module wordle(switch_input, clk, enter, SS1, SS2, SS3, SS4, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8, LED9, LED0, reset);

	////// VARIABLE INITIALIZATION /////////
	
	// input values //
	input [9:0] switch_input; // stores bit values of flipped switches
	input clk, enter, reset; 
	
	// output values //
	output reg[6:0] SS1, SS2, SS3, SS4; // Guessed letter seven segment output
	output reg LED1, LED2, LED3, LED4; // Guess correctness outputs
	output reg LED7, LED8, LED9, LED0; // Current count outputs
	output reg LED5, LED6; // remaining LEDS - used for WIN celebration
	
	// Registers //
	reg[6:0] SW1, SW2, SW3, SW4; // Stores letters of predetermined word
	reg[6:0] sevenSegment; // Stores switch to letter seven segement bit value
	reg[9:0] UG1, UG2, UG3, UG4; // Stores users guessed letter
	reg[31:0] flash_counter; // counter for LED WIN flashing
	reg slow_clk; // Slow clock for visible flashing
	reg [5:0] clk_counter; // Stores the number of clock pulses
	reg enter_old, B, reset_old, led_state, led_state_next, S; // values that need storage
	// stores states and the next state (based on user input)
	reg [4:0] state, next_state; 
	reg[3:0] count, next_count;
	 
	// Set up states //
	// States for overall game play
	parameter s0= 4'b0000, s1= 4'b0001, s2= 4'b0010, s3= 4'b0011,  
				 s4= 4'b0100, s5= 4'b0101, s6= 4'b0110, s7= 4'b0111,
				 s8= 4'b1000, s9= 4'b1001; 
	// States for guess counter
	parameter c0= 3'b000, c1= 3'b001, c2= 3'b010, c3= 3'b011, c4= 3'b100, c5= 3'b101, c6= 3'b111;
	
	// Initializes values of each variable // 
	initial begin
	// user guess
	UG1 = 10'b0000000000; UG2 = 10'b0000000000; UG3 = 10'b0000000000; UG4 = 10'b0000000000;
	// LEDs (count and guess correctness)
	LED1 = 0; LED2 = 0; LED3 = 0; LED4 = 0;
	LED7 = 0; LED8 = 0; LED9 = 0; LED0 = 0;
	LED5 = 0; LED6 = 0;
	// button and game mode
	B = 0; S = 0;
	// seven segment display
	SS1 = 7'b1111111; SS2 = 7'b1111111; SS3 = 7'b1111111; SS4 = 7'b1111111;	
	// state initalization
	state= s0;
	count = 3'b000;
	// predetermined word
	SW1=7'b1111111; SW2=7'b1111111; SW3=7'b1111111; SW4=7'b1111111;
	end

	/// STATE FUNCTIONS AND TRANSITIONS ///
	always @(posedge clk) begin
	   // WIN flashing LEDS //
		if (flash_counter == 7500000) begin // Adjust this value for flashing speed
			 flash_counter <= 0;
			 slow_clk <= ~slow_clk; // Toggle slow_clk
		end else begin
			 flash_counter <= flash_counter + 1; // increases flash_counter based on clock pulse
		end
		// Enter button // 
		if ((enter==0) && (enter_old==1)) begin
			B <= 1; // if enter button is pressed, sets B (button) equal to 1
		end
		// Reset button // 
		if ((reset==0) && (reset_old==1)) begin
			// if reset button is pressed, reset all stored variables
			UG1 = 10'b0000000000; UG2 = 10'b0000000000; UG3 = 10'b0000000000; UG4 = 10'b0000000000;
			next_state <= s0; 
			next_count <= c0;
			B <= 0;
			S <= 0;
		end
		
		// Random word generator //
		if (state == s0) begin // only occurs if at state zero
			if (clk_counter == 5'b10011) begin 
				clk_counter <= 5'b00000; // if clock pulse reaches a count of 20, resets to zero
			end else begin
				clk_counter <= clk_counter + 1; // increase count
			end
		end
		
		// states // 
		if (B == 1) begin // if enter button is pressed
			B <= 0; // resets button
			case (state)
				// STATE 0: idle state. User chooses game mode. Program generates random word.
				s0: begin  
					case(switch_input) // uses switch input to determine game mode
						10'b1000000000 : S <= 1; // indicates easy mode
						10'b0100000000 : S <= 2; // indicates medium mode
						10'b0010000000 : S <= 3; // indicates hard mode
					endcase
					// Easy mode // 
					if ( S == 1 ) begin
						next_state <= s1; // indicates next state will be state 1
						case (clk_counter) // based on counter at time enter button was pressed
							5'b00000: begin // cage
									SW1=7'b0110001; // C
									SW2=7'b0001000; // A
									SW3=7'b0000100; // G
									SW4=7'b0110000; // E
								end
							5'b00001: begin // bead
									SW1=7'b1100000; // B
									SW2=7'b0110000; // E
									SW3=7'b0001000; // A
									SW4=7'b1000010; // D	
								end
							5'b00010: begin // edge
									SW1=7'b0110000; // E
									SW2=7'b1000010; // D	
									SW3=7'b0000100; // G
									SW4=7'b0110000; // E
								end
							5'b00011: begin // face
									SW1=7'b0111000; // F
									SW2=7'b0001000; // A
									SW3=7'b0110001; // C
									SW4=7'b0110000; // E
								end
							5'b00100: begin // dead
									SW1=7'b1000010; // D
									SW2=7'b0110000; // E
									SW3=7'b0001000; // A	
									SW4=7'b1000010; // D	
								end
							5'b00101: begin // feed
									SW1=7'b0111000; // F
									SW2=7'b0110000; // E	
									SW3=7'b0110000; // E	
									SW4=7'b1000010; // D
								end
							5'b00110: begin // aced
									SW1=7'b0001000; // A
									SW2=7'b0110001; // C
									SW3=7'b0110000; // E	
									SW4=7'b1000010; // D
								end
							5'b00111: begin // deaf
									SW1=7'b1000010; // D
									SW2=7'b0110000; // E
									SW3=7'b0001000; // A	
									SW4=7'b0111000; // F
								end
							5'b01000: begin // aged
									SW1=7'b0001000; // A
									SW2=7'b0000100; // G
									SW3=7'b0110000; // E	
									SW4=7'b1000010; // D
								end
							5'b01001: begin // fade
									SW1=7'b0111000; // F
									SW2=7'b0001000; // A
									SW3=7'b1000010; // D	
									SW4=7'b0110000; // E	
								end
							5'b01010: begin // deed
									SW1=7'b1000010; // D
									SW2=7'b0110000; // E	
									SW3=7'b0110000; // E	
									SW4=7'b1000010; // D	
								end
							5'b01011: begin // cage
									SW1=7'b0110001; // C
									SW2=7'b0001000; // A
									SW3=7'b0000100; // G
									SW4=7'b0110000; // E
								end
							5'b01100: begin // bead
									SW1=7'b1100000; // B
									SW2=7'b0110000; // E
									SW3=7'b0001000; // A
									SW4=7'b1000010; // D		
								end
							5'b01101: begin // edge 
									SW1=7'b0110000; // E
									SW2=7'b1000010; // D	
									SW3=7'b0000100; // G
									SW4=7'b0110000; // E											
								end
							5'b01110: begin // face
									SW1=7'b0111000; // F
									SW2=7'b0001000; // A
									SW3=7'b0110001; // C
									SW4=7'b0110000; // E	
								end
							5'b01111: begin // dead
									SW1=7'b1000010; // D
									SW2=7'b0110000; // E
									SW3=7'b0001000; // A	
									SW4=7'b1000010; // D	
								end
							5'b10000: begin // feed 
									SW1=7'b0111000; // F
									SW2=7'b0110000; // E	
									SW3=7'b0110000; // E	
									SW4=7'b1000010; // D
								end
							5'b10001: begin // aced
									SW1=7'b0001000; // A
									SW2=7'b0110001; // C
									SW3=7'b0110000; // E	
									SW4=7'b1000010; // D	
								end
							5'b10010: begin // deaf
									SW1=7'b1000010; // D
									SW2=7'b0110000; // E
									SW3=7'b0001000; // A	
									SW4=7'b0111000; // F
								end
							5'b10011: begin // fade 
									SW1=7'b0111000; // F
									SW2=7'b0001000; // A
									SW3=7'b1000010; // D	
									SW4=7'b0110000; // E	
								end
							endcase
					// Medium mode // 
					end else if ( S ==2 ) begin
						next_state <= s1; // indicates next state will be state 1
						case (clk_counter) // based on counter at time enter button was pressed
							5'b00000: begin // cane
								SW1=7'b0110001; // C
								SW2=7'b0001000; // A	
								SW3=7'b1101010; // N
								SW4=7'b0110000; // E
								end
							5'b00001: begin // land
								SW1=7'b1110001; // L
								SW2=7'b0001000; // A	
								SW3=7'b1101010; // N
								SW4=7'b1000010; // D
								end
							5'b00010: begin // bean
								SW1=7'b1100000; // B
								SW2=7'b0110000; // E
								SW3=7'b0001000; // A	
								SW4=7'b1101010; // N
								end
							5'b00011: begin // name
								SW1=7'b1101010; // N
								SW2=7'b0001000; // A	
								SW3=7'b1011010; // M
								SW4=7'b0110000; // E		
								end
							5'b00100: begin // made
								SW1=7'b1011010; // M
								SW2=7'b0001000; // A
								SW3=7'b1000010; // D
								SW4=7'b0110000; // E			
								end
							5'b00101: begin // maid
								SW1=7'b1011010; // M
								SW2=7'b0001000; // A
								SW3=7'b1001111; // I
								SW4=7'b1000010; // D	
								end
							5'b00110: begin // lane
								SW1=7'b1110001; // L
								SW2=7'b0001000; // A	
								SW3=7'b1101010; // N
								SW4=7'b0110000; // E	
								end
							5'b00111: begin // hand
								SW1=7'b1101000; // H
								SW2=7'b0001000; // A	
								SW3=7'b1101010; // N
								SW4=7'b1000010; // D	
								end
							5'b01000: begin // main
								SW1=7'b1011010; // M
								SW2=7'b0001000; // A
								SW3=7'b1001111; // I
								SW4=7'b1101010; // N			
								end
							5'b01001: begin // band
								SW1=7'b1100000; // B
								SW2=7'b0001000; // A
								SW3=7'b1101010; // N
								SW4=7'b1000010; // D		
								end
							5'b01010: begin // clan //
								SW1=7'b0110001; // C
								SW2=7'b1110001; // L
								SW3=7'b0001000; // A
								SW4=7'b1101010; // N		
								end
							5'b01011: begin // mail
								SW1=7'b1011010; // M
								SW2=7'b0001000; // A
								SW3=7'b1001111; // I
								SW4=7'b1110001; // L
								end
							5'b01100: begin // mend
								SW1=7'b1011010; // M
								SW2=7'b0110000; // E	
								SW3=7'b1101010; // N
								SW4=7'b1000010; // D		
								end
							5'b01101: begin // film 
								SW1=7'b0111000; // F
								SW2=7'b1001111; // I
								SW3=7'b1110001; // L
								SW4=7'b1011010; // M
								end
							5'b01110: begin // dial
								SW1=7'b1000010; // D
								SW2=7'b1001111; // I
								SW3=7'b0001000; // A
								SW4=7'b1110001; // L		
								end
							5'b01111: begin // need
								SW1=7'b1101010; // N
								SW2=7'b0110000; // E
								SW3=7'b0110000; // E
								SW4=7'b1000010; // D
								end
							5'b10000: begin // nail 
								SW1=7'b1101010; // N
								SW2=7'b0001000; // A
								SW3=7'b1001111; // I
								SW4=7'b1110001; // L
								end
							5'b10001: begin // lima
								SW1=7'b1110001; // L
								SW2=7'b1001111; // I
								SW3=7'b1011010; // M
								SW4=7'b0001000; // A		
								end
							5'b10010: begin // glow
								SW1=7'b1110001; // L
								SW2=7'b0001000; // A
								SW3=7'b1011010; // M
								SW4=7'b1100000; // B	
								end
							5'b10011: begin // bits 
								SW1=7'b0000100; // G
								SW2=7'b1110001; // L
								SW3=7'b0001000; // A
								SW4=7'b1011010; // M
								end
							endcase
					// Hard mode // 
					end else if ( S==3 ) begin
						next_state <= s1; // indicates next state will be state 1
						case (clk_counter) // based on counter at time enter button was pressed
							5'b00000: begin // code
								SW1=7'b0110001; // C
								SW2=7'b0000001; // O
								SW3=7'b1000010; // D
								SW4=7'b0110000; // E
								end
							5'b00001: begin // love
								SW1=7'b1110001; // L
								SW2=7'b0000001; // O
								SW3=7'b1101011; // V
								SW4=7'b0110000; // E
								end
							5'b00010: begin // flip
								SW1=7'b0111000; // F
								SW2=7'b1110001; // L
								SW3=7'b1001111; // I
								SW4=7'b0011000; // P
								end
							5'b00011: begin // flop
								SW1=7'b0111000; // F
								SW2=7'b1110001; // L
								SW3=7'b0000001; // O
								SW4=7'b0011000; // P			
								end
							5'b00100: begin // fpga
								SW1=7'b0111000; // F
								SW2=7'b0011000; // P
								SW3=7'b0000100; // G
								SW4=7'b0001000; // A		
								end
							5'b00101: begin // blue
								SW1=7'b1100000; // B
								SW2=7'b1110001; // L
								SW3=7'b1000001; // U
								SW4=7'b0110000; // E	
								end
							5'b00110: begin // star
								SW1=7'b0100100; // S
								SW2=7'b1001110; // T
								SW3=7'b0001000; // A
								SW4=7'b1111010; // R	
								end
							5'b00111: begin // fire
								SW1=7'b0111000; // F
								SW2=7'b1001111; // I
								SW3=7'b1111010; // R
								SW4=7'b0110000; // E		
								end
							5'b01000: begin // gold
								SW1=7'b0000100; // G
								SW2=7'b0000001; // O
								SW3=7'b1110001; // L
								SW4=7'b1000010; // D		
								end
							5'b01001: begin // wind
								SW1=7'b1001001; // W
								SW2=7'b1001111; // I
								SW3=7'b1101010; // N
								SW4=7'b1000010; // D		
								end
							5'b01010: begin // park
								SW1=7'b0011000; // P
								SW2=7'b0001000; // A
								SW3=7'b1111010; // R
								SW4=7'b1111000; // K			
								end
							5'b01011: begin // moon
								SW1=7'b1011010; // M
								SW2=7'b0000001; // O
								SW3=7'b0000001; // O
								SW4=7'b1101010; // N	
								end
							5'b01100: begin // wave
								SW1=7'b1001001; // W
								SW2=7'b0001000; // A
								SW3=7'b1101011; // V
								SW4=7'b0110000; // E		
								end
							5'b01101: begin // book 
								SW1=7'b1100000; // B
								SW2=7'b0000001; // O
								SW3=7'b0000001; // O
								SW4=7'b1111000; // K	
								end
							5'b01110: begin // tree
								SW1=7'b1001110; // T
								SW2=7'b1111010; // R
								SW3=7'b0110000; // E
								SW4=7'b0110000; // E		
								end
							5'b01111: begin // calm
								SW1=7'b0110001; // C
								SW2=7'b0001000; // A
								SW3=7'b1110001; // L
								SW4=7'b1011010; // M
								end
							5'b10000: begin // rain 
								SW1=7'b1111010; // R
								SW2=7'b0001000; // A
								SW3=7'b1001111; // I
								SW4=7'b1101010; // N
								end
							5'b10001: begin // brim
								SW1=7'b1100000; // B
								SW2=7'b1111010; // R
								SW3=7'b1001111; // I
								SW4=7'b1011010; // M		
								end
							5'b10010: begin // glow
								SW1=7'b0000100; // G
								SW2=7'b1110001; // L
								SW3=7'b0000001; // O
								SW4=7'b1001001; // W		
								end
							5'b10011: begin // bits 
								SW1=7'b1100000; // B
								SW2=7'b1001111; // I
								SW3=7'b1001110; // T
								SW4=7'b0100100; // S
								end
							endcase
					end // level if statements
				end // case s0
				// STATE 1 : stores user guess for first letter
				s1: begin 
						UG1 <= sevenSegment;
						next_state <= s2;
					end // s1
				// STATE 2 : stores user guess for second letter	
				s2: begin 
						UG2 <= sevenSegment;
						next_state <= s3;
					end // s2
				// STATE 3 : stores user guess for third letter
				s3: begin
						UG3 <= sevenSegment;
						next_state <= s4;
					end // s3
				// STATE 4 : stores user guess for fourth letter
				s4: begin 
						UG4 <= sevenSegment;
						next_state <= s5;
					end // s4
				// STATE 5 : checks if user guesses were correct. Increases guess count
				s5: begin 
						if ((count == c0) || (count == c1) || (count == c2) || (count == c3) || (count == c4))begin // if count is less than 5
							if ((UG1==SW1)&&(UG2==SW2)&&(UG3==SW3)&&(UG4==SW4)) begin // Checks if user guess is correct
								next_state <= s7; // if user guess is correct -> user wins. Indicates next state is state 7. 
							end 
							else begin
								next_state <= s6; // if user guess is incorrect with guesses to spare, indicates next state is state 6.
							end
						end else if (count == c5)begin // checks if count is 5 or more
							next_state <= s8; // out of guess, indicates next state is state 8
						end
						// increases count by moving from one count state to the next // 
						case (count)
							c0: next_count <= c1;
							c1: next_count <= c2;
							c2: next_count <= c3;
							c3: next_count <= c4;
							c4: next_count <= c5;
							c5: next_count <= c0;
							default: next_count <= c0;
						endcase
					end // s5
				// STATE 6: User guess is incorrect and has more guess. resets guess inputs, updates LEDS and resets to state 1
				s6: next_state <= s1;
				// STATE 7: User wins. Displays "WINS" and celebrate with flashing LEDS
				s7: next_state <= s0;
				// STATE 8: User loses. Diplays "LOSE" on seven segment
				s8: next_state <= s9;
				// STATE 9: Displays correct word on sevent segment
				s9: next_state <= s0; 
			endcase // states 
		end // b==1 if statement
		
		// update states and buttons
		state <= next_state;
		count <= next_count;
		enter_old <= enter;
		reset_old <= reset;
		
	end //clk
	
	// SEVEN SEGMENT DISPLAY VALUES //
	always @* // allows seven segment to change in real time when user is chosing letters
		begin
			case(switch_input) // based on bit values associated with 
			// multiplier of 0 (000)
			10'b1000000000 : sevenSegment = 7'b0001000; // A
			10'b0100000000 : sevenSegment = 7'b1100000; // B
			10'b0010000000 : sevenSegment = 7'b0110001; // C
			10'b0001000000 : sevenSegment = 7'b1000010; // D
			10'b0000100000 : sevenSegment = 7'b0110000; // E
			10'b0000010000 : sevenSegment = 7'b0111000; // F
			10'b0000001000 : sevenSegment = 7'b0000100; // G
			// multiplier of 1 (001)
			10'b1000000001 : sevenSegment = 7'b1101000; // H
			10'b0100000001 : sevenSegment = 7'b1001111; // I
			10'b0010000001 : sevenSegment = 7'b1000111; // J
			10'b0001000001 : sevenSegment = 7'b1111000; // K
			10'b0000100001 : sevenSegment = 7'b1110001; // L
			10'b0000010001 : sevenSegment = 7'b1011010; // M
			10'b0000001001 : sevenSegment = 7'b1101010; // N
			// multiplier of 2 (010)
			10'b1000000010 : sevenSegment = 7'b0000001; // O
			10'b0100000010 : sevenSegment = 7'b0011000; // P
			10'b0010000010 : sevenSegment = 7'b0001100; // Q
			10'b0001000010 : sevenSegment = 7'b1111010; // R
			10'b0000100010 : sevenSegment = 7'b0100100; // S
			10'b0000010010 : sevenSegment = 7'b1001110; // T
			10'b0000001010 : sevenSegment = 7'b1000001; // U
			// multiplier of 3 (100)
			10'b1000000100 : sevenSegment = 7'b1101011; // V
			10'b0100000100 : sevenSegment = 7'b1001001; // W
			10'b0010000100 : sevenSegment = 7'b1001000; // X
			10'b0001000100 : sevenSegment = 7'b1000100; // Y
			10'b0000100100 : sevenSegment = 7'b0010010; // Z
			default : sevenSegment = 7'b0000000; // indicates incorrect input -> no letter is displayed
		endcase;	
	end // always clock
	
	///// UPDATE SEVEN SEGMENT AND LED VALUES /////
	always @(state) begin
		case (state)
		  // STATE 0: idle state. User chooses game mode. Program generates random word.
        s0: begin
				LED5 <= 0; LED6 <= 0;
				case(switch_input)
					// diplay user mode based on selected switch
					10'b1000000000 : begin // easy
						SS1 = 7'b0110000; // E  
						SS2 = 7'b0001000; // A
						SS3 = 7'b0100100; // S
						SS4 = 7'b1000100; // Y
						end
					10'b0100000000 : begin // medium
						SS1 = 7'b1011010; // M
						SS2 = 7'b0110000; // E
						SS3 = 7'b1000010; // D
						SS4 = 7'b1111111;
						end
					10'b0010000000 : begin // cage
						SS1 = 7'b1101000; // H
						SS2 = 7'b0001000; // A
						SS3 = 7'b1111010; // R
						SS4 = 7'b1000010; // D
						end
					default: begin
						SS1 <= 7'b0100100; // S 
						SS2 <= 7'b0110000; // E
						SS3 <= 7'b1110001; // L
						SS4 <= 7'b0110000; // E
						end
					endcase
				end // s0
		  // STATE 1 : stores user guess for first letter
        s1: begin 
				// turns off all seven segments aside from the first
				SS1 <= sevenSegment; // displays value of letter-switch correspondence
				SS2 <= 7'b1111111; // empty seven segment
				SS3 <= 7'b1111111; // empty seven segment
				SS4 <= 7'b1111111; // empty seven segment
				end
        // STATE 2 : stores user guess for second letter
		  s2: begin
				SS1 <= UG1; // saves user guess on seven segment
				SS2 <= sevenSegment; // displays value of letter-switch correspondence
				SS3 <= 7'b1111111; // empty seven segment
				SS4 <= 7'b1111111; // empty seven segment
				end
		  // STATE 3 : stores user guess for third letter
        s3: begin
				SS1 <= UG1; // saves user guess on seven segment
				SS2 <= UG2; // saves user guess on seven segment
				SS3 <= sevenSegment; // displays value of letter-switch correspondence
				SS4 <= 7'b1111111; // empty seven segment
				end
		  // STATE 4 : stores user guess for fourth letter
        s4: begin
				SS1 <= UG1; // saves user guess on seven segment
				SS2 <= UG2; // saves user guess on seven segment
				SS3 <= UG3; // saves user guess on seven segment
				SS4 <= sevenSegment; // displays value of letter-switch correspondence
				end
        // STATE 5 : checks if user guesses were correct. Increases guess count
		  s5: begin
				// seven segments remain unchanged
				SS1 <= UG1;
				SS2 <= UG2;
				SS3 <= UG3; 
				SS4 <= UG4;
				end 
		  // STATE 6: User guess is incorrect and has more guess. resets guess inputs, updates LEDS and resets to state
		  s6: begin
				// resets seven segment display
				SS1 <= 7'b1111111;  
            SS2 <= 7'b1111111; 
            SS3 <= 7'b1111111;
            SS4 <= 7'b1111111;
				// compare guess with actual word
            // first letter //
				if (UG1 == SW1) begin 
					LED1 <= 1;
				end else begin
					LED1 <= 0;
					end				
				// second letter // 
				if (UG2 == SW2) begin 
					LED2 <= 1; // if correct corresponding LED turns on
				end else begin
					LED2 <= 0;
					end
				// third letter //
				if (UG3 == SW3) begin 
					LED3 <= 1; // if correct corresponding LED turns on
				end else begin
					LED3 <= 0;
					end
				// fourth letter // 
				if (UG4 == SW4) begin 
					LED4 <= 1; // if correct corresponding LED turns on
				end else begin
					LED4 <= 0;
					end
				// Update count LEDs
				case (count)
						c0: begin // count = 0
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 0; 
								LED0 <= 0; 
							end
						c1: begin // count = 1
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 0; 
								LED0 <= 1; 
							end
						c2: begin // count = 2
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 1; 
								LED0 <= 1;  
							end
						c3: begin // count = 3 
								LED7 <= 0;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
						c4: begin // count = 4 
								LED7 <= 1;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
						c5: begin // count = 5 
								LED7 <= 1;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
					endcase // count
				end // s6
        // STATE 7: User wins. Displays "WINS" and celebrate with flashing LEDS
		  s7: begin
            SS1 <= 7'b1001001; // W
            SS2 <= 7'b1001111; // I
            SS3 <= 7'b1101010; // N
            SS4 <= 7'b0100100; // S
				
				// Flash LEDs
            LED1 <= slow_clk;
            LED2 <= slow_clk; 
				LED3 <= slow_clk;
            LED4 <= slow_clk;
				LED5 <= slow_clk;
            LED6 <= slow_clk;
				LED7 <= slow_clk;
            LED8 <= slow_clk;
				LED9 <= slow_clk;
            LED0 <= slow_clk;
				
				end
		  // STATE 8: User loses. Diplays "LOSE" on seven segment
        s8: begin
            SS1 <= 7'b1110001; // L
            SS2 <= 7'b0000001; // O
            SS3 <= 7'b0100100; // S
            SS4 <= 7'b0110000; // E
				
				// resets count LEDS
				LED7 <= 0;
            LED8 <= 0; 
				LED9 <= 0;
            LED0 <= 0; 
				end
		 // STATE 9: Displays correct word on sevent segment
       s9: begin
            SS1 <= SW1;
            SS2 <= SW2;
            SS3 <= SW3;
            SS4 <= SW4;
				end
		endcase
	
	end // state clock
	
endmodule	