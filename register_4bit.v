module register_4bit (
	input wire [3:0]D,
	input wire reset,
	output reg [3:0]Q
);
	always @(posedge clk) begin
		if (!reset)
			Q<=D;
		else 
			Q<=0;
	end
endmodule