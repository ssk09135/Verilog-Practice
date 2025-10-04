//`timescale 1ns / 1ps
module four_bit_register_tb();
 // Inputs
    reg clk;
    reg async_clear;
    reg async_preset;
    reg enable;
    reg [3:0] data_in;
 // Outputs
    wire [3:0] q;
 // Instantiate the Unit Under Test (UUT)
    four_bit_register uut (
        .clk(clk),
        .async_clear(async_clear),
        .async_preset(async_preset),
        .enable(enable),
        .data_in(data_in),
        .q(q)
    );
 // Clock generation
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end
 // Test sequence
    initial begin
 // Initialize inputs
        clk = 0;
        async_clear = 0;
        async_preset = 0;
        enable = 0;

        data_in = 4'b0000;
 // Wait for global reset
        #100;
 // Test 1: Asynchronous clear
        #10 async_clear = 1;
        #10 async_clear = 0;
// Test 2: Asynchronous preset
        #10 async_preset = 1;
        #10 async_preset = 0;

 // Test 3: Load data
        #10 enable = 1;

        data_in = 4'b1010;


 // Test 4: Maintain value when enable is high but load is low
        #20 data_in = 4'b0101;

 // Test 5: Disable the register
        #10 enable = 0;

        data_in = 4'b1111;

 // Test 6: Re-enable and load new data
        #10 enable = 1;

 // End simulation
        #30 $finish;
    end
 // Monitor changes
    initial begin
 // $monitor("Time=%0t clk=%b async_clear=%b async_preset=%b enable=%b load=%b data_in=%b q=%b",
 // $time, clk, async_clear, async_preset,enable, load, data_in, q);
        $dumpfile("four_bit_register_tb.vcd");
        $dumpvars(0, four_bit_register_tb);
    end
endmodule