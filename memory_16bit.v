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


module memory_16bit(
        input reg clk,
		input wire [15:0]data_in,
		input wire [7:0]address,
		output reg [15:0]data_out,
		input write_en
	);	
	reg [15:0]mem[0:255];

	always @(posedge clk) begin
		if (write_en)
			mem[address]<= data_in;
		else ;
		data_out <=mem[addr];
	end
endmodule
