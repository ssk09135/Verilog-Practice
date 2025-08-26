module ALU (
	OPI,data_1,data_2,data_out,clk
);
	input wire [3:0]OPI;
	input wire [15:0]data_R2,data_R1; //instruction code를 통해 레지스터 주소를 찾고 레지스터안에 메모리 주소를 통해서 메모리에서 꺼내옴 
	input wire clk;
	output reg [15:0]data_out;
	always

	always @(posedge clk) begin
		case(OPI)
			4'b0000: ;//NOP
			4'b0001: //LOAD
			4'b0010: data_out = data_1 - data_2; //STORE
			4'b0011: data_out = data_1 & data_2; //ADD
			4'b0100: data_out = data_1 | data_2; //SUB
			4'b0101: data_out = 
			
			
			data_out = data_1 + data_2; //LOAD
			4'b0010: data_out = data_1 - data_2; //STORE
			4'b0011: data_out = data_1 & data_2; //ADD
			4'b0100: data_out = data_1 | data_2;
			default: data_out = 0;
	end

endmodule