module tb_full_adder();
    
    initial begin
        $dumpfile("tb_full_adder.vcd");
        $dumpvars(0, tb_full_adder)
    end
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] S;
    wire Cout;
    full_adder_4bit full_adder_4bit (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));
    initial begin
        A = 4'b0000; B = 4'b0000; Cin = 0;
        #10 A = 4'b0001; B = 4'b0001; Cin = 0;
        #10 A = 4'b0010; B = 4'b0010; Cin = 0;
        #10 A = 4'b0011; B = 4'b0011; Cin = 0;
        #10 A = 4'b0100; B = 4'b0100; Cin = 0;
        #10 A = 4'b0101; B = 4'b0101; Cin = 0;
        #10 A = 4'b0110; B = 4'b0110; Cin = 0;
        #10 A = 4'b0111; B = 4'b0111; Cin = 0;
        #10 A = 4'b1000; B = 4'b1000; Cin = 0;
        #10 A = 4'b1001; B = 4'b1001; Cin = 0;
        #10 A = 4'b1010; B = 4'b1010; Cin = 0;
        #10 A = 4'b1011; B = 4'b1011; Cin = 0;
        #10 A = 4'b1100; B = 4'b1100; Cin = 0;
        #10 A = 4'b1101; B = 4'b1101; Cin = 0;
        #10 A = 4'b1110; B = 4'b1110; Cin = 0;
        #10 A = 4'b1111; B = 4'b1111;   Cin = 0;
        #10 A = 4'b1111; B = 4'b1111;   Cin = 1;
    end
    
endmodule