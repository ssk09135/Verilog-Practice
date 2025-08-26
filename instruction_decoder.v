module instruction_decoder (
	input wire [15:0] instruction,
	output reg [3:0] opcode,
	output reg [3:0] destination,
	output reg [3:0] source,
	output reg is_load,is_store,is_alu,is_jump
);
	always @(*) begin
		opcode = instruction[15:12];
		destination = instruction[11:8];
		source = instruction[7:4];
		is_load  = (opcode == 4'b0001);
        is_store = (opcode == 4'b001x);
        is_alu   = (opcode == 4'b01xx);
        is_jump  = (opcode == 4'b1xxx);
	end
endmodule