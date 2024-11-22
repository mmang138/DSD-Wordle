module wordle(switch_input, sevenSegmentActiveLow);
input [9:0] switch_input;
output[6:0] sevenSegmentActiveLow;
reg[6:0] sevenSegment;

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

endcase;
end
assign sevenSegmentActiveLow = sevenSegment;
endmodule 