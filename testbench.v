//testbench

module alu_tb();
	
	reg [7:0] A,B;
	reg F; //input
	wire [7:0] Y; //output y
	wire ZERO; // output zero

	reg ExpectedY;
	reg ExpectedZero; 
	reg [4:0] testVectors [20:0];

	alu Alu(.a(A), .b(B), .f(F), .y(Y), .zero(ZERO));
 
	integer i; //iterator

	initial begin
	//load data
		$readmemh("alu.tv",testVectors);
		for(i = 0; i < 21; i = i + 1) begin
			{F, A, B, ExpectedY, ExpectedZero} = testVectors[i];
			#1 $display("A = %h, B = %h, F = %h, ExpectedY = %h, ExpectedZero = %h, Y = %h, ZERO = %h",A, B, F, ExpectedY, ExpectedZero, Y, ZERO);
			#10;
		end
	end


endmodule