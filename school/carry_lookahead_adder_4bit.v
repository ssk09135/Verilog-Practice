module carry_lookahead_adder_4bit(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [3:0] G, P, C;
    assign #1 G = A & B; // Generate
    assign #1 P = A ^ B; // Propagate
    assign C[0] = Cin;
    assign #2 C[1] = G[0] | (P[0] & C[0]);
    assign #2 C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign #2 C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign #2 Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] &
    P[2] & P[1] & P[0] & C[0]);
    assign #1 Sum = P ^ C;
endmodule