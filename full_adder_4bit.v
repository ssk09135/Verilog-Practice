`timescale 1ps/1ps
module full_adder_4bit (
    input wire[3:0] A,
    input wire[3:0] B,
    input wire Cin,
    output wire[3:0] S,
    output wire Cout
);
    assign {Cout, S} = A + B + Cin;
endmodule