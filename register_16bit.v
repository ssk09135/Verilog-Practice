module register_16bit (
	input reg clk,
	input wire reset,
	input wire [15:0]D,
	output reg [15:0]Q
);
	always @(posedge clk or posedge reset) begin
		if (reset)
			out <=16'b0000_0000_0000_0000;
		else
			Q<=D;
	end
endmodule