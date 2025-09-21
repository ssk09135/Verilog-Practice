module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign #1 sum = a ^ b ^ cin;
    assign #3 cout = (a & b) | (cin & (a ^ b));
endmodule