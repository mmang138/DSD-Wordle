module wordle(switch_input, clk, enter, SS1, SS2, SS3, SS4, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LED8);

    ////// VARIABLE INITIALIZATION /////////
    input [9:0] switch_input;
    input clk, enter;
    
    output reg[6:0] SS1, SS2, SS3, SS4;
    // Guess correctness outputs
    output reg LED1, LED2, LED3, LED4;
    // Current guess count outputs (1 to 5 guesses)
    output reg LED5, LED6, LED7, LED8;

    reg[6:0] sevenSegment;
    // SG = set word [BITS]
    reg[6:0] SW1=7'b1100000, SW2=7'b1001111, SW3=7'b1001110, SW4=7'b0100100;
    // UG = user guess
    reg[9:0] UG1, UG2, UG3, UG4;
    reg[3:0] count;

    // Set up states
    parameter s0= 4'b0000, s1= 4'b0001, s2= 4'b0010, s3= 4'b0011, 
             s4= 4'b0100, s5= 4'b0101, s6= 4'b0110, s7= 4'b0111,
             s8= 4'b1000, s9= 4'b1001;
    reg [4:0] state, next_state;
    initial state = 4'b0000;
    reg enter_old, B;

    initial begin
        UG1 = 10'b0;
        UG2 = 10'b0;
        UG3 = 10'b0;
        UG4 = 10'b0;
        LED1 = 0; LED2 = 0; LED3 = 0; LED4 = 0;
        LED5 = 0; LED6 = 0; LED7 = 0; LED8 = 0;
        count= 0;
        B = 0;
        enter_old = 0;
        SS1 = 7'b0;
        SS2 = 7'b0;
        SS3 = 7'b0;
        SS4 = 7'b0;
    end

    always @(posedge clk) begin
        state <= next_state;
        if ((enter==0) && (enter_old==1)) begin
            B <= 1;
        end

        if (B == 1) begin
            B <= 0;
            case (state)
                s0: next_state <= s1;
                s1: begin 
                    next_state <= s2;
                    UG1 <= switch_input;
                end
                s2: begin 
                    next_state <= s3;
                    UG2 <= switch_input;
                end
                s3: begin 
                    next_state <= s4;
                    UG3 <= switch_input;
                end
                s4: begin 
                    next_state <= s5;
                    UG4 <= switch_input;
                end
                s5: begin 
                    if (count < 5) begin
                        if ((UG1==SW1)&&(UG2==SW2)&&(UG3==SW3)&&(UG4==SW4)) begin
                            next_state <= s7;  // Correct guess
                        end else begin
                            next_state <= s6;  // Incorrect guess
                        end
                    end else if (count == 5) begin
                        next_state <= s8;  // End of guesses
                    end
                end
                s6: begin
                    if (UG1 == SW1) LED1 <= 1;
                    if (UG2 == SW2) LED2 <= 1;
                    if (UG3 == SW3) LED3 <= 1;
                    if (UG4 == SW4) LED4 <= 1;
                    count <= count + 1;
                end
                s7: begin
                    next_state <= s0; // Reset game
                end
                s8: begin
                    next_state <= s9; // Word guessed correctly or max guesses reached
                end
                s9: begin
                    next_state <= s0; // Reset game
                end
            endcase
        end

        enter_old <= enter;
    end

    always @* begin
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

        // Update the 7-segment displays
        if (state == s1) begin
            SS1 = sevenSegment;
        end else if (state == s2) begin 
            SS2 = sevenSegment;
        end else if (state == s3) begin 
            SS3 = sevenSegment;
        end else if (state == s4) begin
            SS4 = sevenSegment;  
        end
    end
endmodule
