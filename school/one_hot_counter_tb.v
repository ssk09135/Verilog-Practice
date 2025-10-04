//`timescale 1ns / 1ps
module one_hot_counter_tb();
    parameter WIDTH = 8;
    reg clk;
    reg rst_n;
    wire [WIDTH-1:0] count;
// Instantiate the Unit Under Test (UUT)
    one_hot_counter #(
        .WIDTH(WIDTH)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );
// Clock generation
    always begin
        #5 clk = ~clk;
    end
// Test sequence
    initial begin
// Initialize inputs
        clk = 0;
        rst_n = 0;
// Wait for global reset
        #100;
        rst_n = 1;
// Wait for a few clock cycles
        #100;
// Monitor the output for WIDTH+1 clock cycles
        repeat (WIDTH+1) begin
            @(posedge clk);
            $display("Time=%0t, Count=%b", $time, count);
        end
 // Finish the simulation
        $finish;
    end
// Check for one-hot property
    initial begin
        $dumpfile("one_hot_counter_tb.vcd");
        $dumpvars(0, one_hot_counter_tb);
    end
endmodule