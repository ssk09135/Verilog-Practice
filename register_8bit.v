module register_8bit (
	input reg clk,
	input wire reset,
	input wire [7:0]D,
	output reg [7:0]Q
);
	always @(posedge clk or posedge reset) begin
		if (reset)
			out <= 8'b0000_0000;
		else
			Q<=D;
	end
endmodule