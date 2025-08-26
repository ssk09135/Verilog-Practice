module MUX_2to1 (
	input wire sel,
	input wire data_1,
	input wire data_0,
	output reg data_out
);
	always @(*) begin
		data_out = sel ? data_1:data_0;
	end
endmodule