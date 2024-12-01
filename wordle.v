module wordle(switch_input, clk, enter, SS1, SS2, SS3, SS4, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8, LED9, LED0, reset);

	////// VARIABLE INITIALIZATION /////////
	input [9:0] switch_input;
	input clk, enter, reset;
	
	
	output reg[6:0] SS1, SS2, SS3, SS4;
	// Guess correctness outputs
	output reg LED1, LED2, LED3, LED4;
	// Current count outputs
	output reg LED7, LED8, LED9, LED0;
	// remaining LED for win celebration
	output reg LED5, LED6;
	

	
	
	reg[6:0] sevenSegment;
	// SG = set word [BITS]
	reg[6:0] SW1=7'b1100000, SW2=7'b1001111, SW3=7'b1001110, SW4=7'b0100100;
	// UG = user guess
	reg[9:0] UG1, UG2, UG3, UG4;
	
	
	
	// Set up states
	parameter s0= 4'b0000, s1= 4'b0001, s2= 4'b0010, s3= 4'b0011, 
				 s4= 4'b0100, s5= 4'b0101, s6= 4'b0110, s7= 4'b0111,
				 s8= 4'b1000, s9= 4'b1001;
	reg [4:0] state, next_state;
	parameter c0= 3'b000, c1= 3'b001, c2= 3'b010, c3= 3'b011, c4= 3'b100, c5= 3'b101, c6= 3'b111;
	reg[3:0] count, next_count;
	reg enter_old, B, reset_old, led_state, led_state_next;
	
	initial begin
	UG1 = 10'b0000000000;
	UG2 = 10'b0000000000;
	UG3 = 10'b0000000000;
	UG4 = 10'b0000000000;
	LED1 = 0; LED2 = 0; LED3 = 0; LED4 = 0;
	LED7 = 0; LED8 = 0; LED9 = 0; LED0 = 0;
	LED5 = 0; LED6 = 0;
	B = 0;
	SS1 = 7'b1111111;
	SS2 = 7'b1111111;
	SS3 = 7'b1111111;
	SS4 = 7'b1111111;	
	state= s0;
	count = 3'b000;
	end


	always @(posedge clk) begin
		state <= next_state;
		count <= next_count;
		if ((enter==0) && (enter_old==1)) begin
			B <= 1;
		end
		if ((reset==0) && (reset_old==1)) begin
			UG1 = 10'b0000000000;
			UG2 = 10'b0000000000;
			UG3 = 10'b0000000000;
			UG4 = 10'b0000000000;
			next_state <= s0; 
			next_count <= c0;
			B <= 0;
		end
		if (B == 1) begin
			B <= 0;
			case (state)
				// reset state
				s0: begin 
						next_state <= s1;
						end 
				s1: begin 
						UG1 <= sevenSegment;
						next_state <= s2;
						end
				s2: begin 
						UG2 <= sevenSegment;
						next_state <= s3;
						end
				s3: begin
						UG3 <= sevenSegment;
						next_state <= s4;
						end
				s4: begin 
						UG4 <= sevenSegment;
						next_state <= s5;
						end
				s5:begin 
						if ((count == c0) || (count == c1) || (count == c2) || (count == c3) || (count == c4))begin
							if ((UG1==SW1)&&(UG2==SW2)&&(UG3==SW3)&&(UG4==SW4)) begin
								next_state <= s7;
							end 
							else begin
								next_state <= s6;
							end
						end else if (count == c5)begin
							next_state <= s8;
						end
						end // case
				s6: begin
						case (count)
							c0: next_count <= c1;
							c1: next_count <= c2;
							c2: next_count <= c3;
							c3: next_count <= c4;
							c4: next_count <= c5;
							default: next_count <= c0;
						endcase
						next_state <= s1;
						end // case
				s7: next_state <= s0;
				s8: begin
						next_state <= s9;
						end
				s9: next_state <= s0; 
			endcase
		end // b==1 if statement
		
		enter_old <= enter;
		reset_old <= reset;
		
	end //clk
		always @*
		begin
			case(switch_input)
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
			10'b0000010001 : sevenSegment = 7'b1101010; // M
			10'b0000001001 : sevenSegment = 7'b1011010; // N
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
			default : sevenSegment = 7'b0000000; // lights up seven segment
		endcase;	
	end // always clock
	
	always @(state) begin
   case (state)
        s0: begin
            SS1 <= 7'b1111111;  
            SS2 <= 7'b1111111; 
            SS3 <= 7'b1111111;
            SS4 <= 7'b1111111;
				if (UG1 == SW1) begin 
					LED1 <= 1;
				end else begin
					LED1 <= 0;
					end
				
				if (UG2 == SW2) begin 
					LED2 <= 1;
				end else begin
					LED2 <= 0;
					end
				
				if (UG3 == SW3) begin 
					LED3 <= 1;
				end else begin
					LED3 <= 0;
					end
				
				if (UG4 == SW4) begin 
					LED4 <= 1;
				end else begin
					LED4 <= 0;
					end
				case (count)
						c0: begin 
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 0; 
								LED0 <= 0; 
							end
						c1: begin 
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 0; 
								LED0 <= 1; 
							end
						c2: begin 
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 1; 
								LED0 <= 1;  
							end
						c3: begin 
								LED7 <= 0;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
						c4: begin 
								LED7 <= 1;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
						c5: begin 
								LED7 <= 1;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
					endcase 
				end
        s1: begin 
				SS1 <= sevenSegment;
				SS2 <= 7'b1111111;
				SS3 <= 7'b1111111; 
				SS4 <= 7'b1111111;
				end
        s2: begin
				SS1 <= UG1;
				SS2 <= sevenSegment;
				SS3 <= 7'b1111111; 
				SS4 <= 7'b1111111;
				end
        s3: begin
				SS1 <= UG1;
				SS2 <= UG2;
				SS3 <= sevenSegment;
				SS4 <= 7'b1111111;
				end
        s4: begin
				SS1 <= UG1;
				SS2 <= UG2;
				SS3 <= UG3; 
				SS4 <= sevenSegment;
				end
        s5: begin
				SS1 <= UG1;
				SS2 <= UG2;
				SS3 <= UG3; 
				SS4 <= UG4;
				end 
		  s6: begin
				SS1 <= 7'b1111111;  
            SS2 <= 7'b1111111; 
            SS3 <= 7'b1111111;
            SS4 <= 7'b1111111;
				
				// compare guess with actual word
				
            if (UG1 == SW1) begin 
					LED1 <= 1;
				end else begin
					LED1 <= 0;
					end
				if (UG2 == SW2) begin 
					LED2 <= 1;
				end else begin
					LED2 <= 0;
					end
				if (UG3 == SW3) begin 
					LED3 <= 1;
				end else begin
					LED3 <= 0;
					end
				if (UG4 == SW4) begin 
					LED4 <= 1;
				end else begin
					LED4 <= 0;
					end
				case (count)
						c0: begin 
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 0; 
								LED0 <= 0; 
							end
						c1: begin 
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 0; 
								LED0 <= 1; 
							end
						c2: begin 
								LED7 <= 0;
								LED8 <= 0;
								LED9 <= 1; 
								LED0 <= 1;  
							end
						c3: begin 
								LED7 <= 0;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
						c4: begin 
								LED7 <= 1;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
						c5: begin 
								LED7 <= 1;
								LED8 <= 1;
								LED9 <= 1; 
								LED0 <= 1; 
							end
					endcase
					
				end
        s7: begin
            SS1 <= 7'b1001001; // W
            SS2 <= 7'b1001111; // I
            SS3 <= 7'b1011010; // N
            SS4 <= 7'b0100100; // S
				end
        s8: begin
            SS1 <= 7'b1110001; // L
            SS2 <= 7'b0000001; // O
            SS3 <= 7'b0100100; // S
            SS4 <= 7'b0110000; // E
				end
       s9: begin
            SS1 <= 7'b1100000; // B
            SS2 <= 7'b1001111; // I
            SS3 <= 7'b1001110; // T
            SS4 <= 7'b0100100; // S
				end
   endcase
	
end // state clock
	
endmodule	