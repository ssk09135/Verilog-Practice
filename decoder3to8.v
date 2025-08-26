`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/07 14:34:18
// Design Name: 
// Module Name: decoder3to8
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


module decoder3to8(
		input wire [2:0]before,
		output reg [7:0]after
    );
	always @ (before) begin
		case (before) 
			3'b111:after = 8b'1000_0000;
			3'b110:after = 8b'0100_0000;
			3'b101:after = 8b'0010_0000;
			3'b100:after = 8b'0001_0000;
			3'b011:after = 8b'0000_1000;
			3'b010:after = 8b'0000_0100;
			3'b001:after = 8b'0000_0010;
			3'b000:after = 8b'0000_0001;
			default:after = 8b'0000_0000;
	end



endmodule
