module adder_comparison_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum_RCA, Sum_CLA;
    wire Cout_RCA, Cout_CLA;
    
    // Instantiate both adders
    ripple_carry_adder_4bit RCA(
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum_RCA), .Cout(Cout_RCA)
    ); 
    
    carry_lookahead_adder_4bit CLA(
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum_CLA), .Cout(Cout_CLA)
    ); 

    initial begin
        // Initialize VCD dump
        $dumpfile("adder_comparison_tb.vcd");
        $dumpvars(0, adder_comparison_tb);
        
        // Test cases
        test_case(9'b000000000);
        test_case(9'b000100100);
        test_case(9'b000000000);
        test_case(9'b001101000);
        test_case(9'b000000000);
        test_case(9'b111100010);
        #20;
        $finish;
    end
    
    task test_case;
        input [8:0] inputs;
        begin
            {A, B, Cin} = inputs;
            #20;
        end
    endtask

endmodule