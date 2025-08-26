`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/07 12:04:27
// Design Name: 
// Module Name: CPU_16bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU_16bit(
        input wire clk,
        input wire reset,
	);	
    //프로그램 카운터 명령어 메모리 주소를 여기 둠
	reg [15:0]PC;
	//명령어 레지스터 메모리에서 가져온 메모리를 여기에
	reg [15:0]IR;
	//sequence counter 
	reg	[3:0]SC;
	//Accumulator
	reg [15:0] ACC;
	//Data Register
	reg [15:0] DR;

	// 프로그램 카운터 클락마다 주소를 1씩 올려가면서 명령어가 있는 메모리 주소를 바꿔감
	always @(posedge clk or posedge reset) begin
		
		if (reset==0) begin
			SC <= SC+ 4'b0001;
		end
		elif(SC == 4'b0011)	begin
			SC<=0;
		end
		else begin 
			SC<=0;
		end 
    end
    //메모리에 가서 프로그램 카운터가 준 주소로 가서 명령어를 가지고 온다.
    memory_16bit mem16(.address(PC),
	.clk(clk),
	.dataout(IR),
	.data_in(data_in),
	.write_en(write_en)
	);


	wire [3:0]OP
    wire [3:0]destination ;
	wire [3:0]source;
	wire is_load,is_store,is_alu, is_jump;
	instruction_decoder(.instruction(IR),
		.opcode(OP),
		.destination(destination),
		.source(source),
		.is_load(is_load),
		.is_store(is_store),
        .is_alu(is_alu),
        .is_jump(is_jump)
	);
    
	//program counter 1씩 증가

endmodule
