module alu(
	input [31:0] a, b,
	input [2:0] f,
	output [31:0] y,
	output zero);
	
	reg [7:0] result;
	reg iszero;
	assign zero = iszero;
	assign y = result;

	always @(*)
	begin
		case(f)
		1'h2:
			result = a + b;
		1'h6:
			result = a - b;
		1'h7:
			result = (a < b)?8'h00000001:8'h00000000;
		1'h0:
			result = a & b;
		1'h1:
			result = a | b;
		endcase
		iszero = (result == 8'h00000000)?1'h1:1'h0;
	end
	

endmodule
