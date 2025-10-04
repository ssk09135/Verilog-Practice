module four_bit_register (
    input wire clk, // Clock input
    input wire async_clear, // Asynchronous clear
    input wire async_preset, // Asynchronous preset
    input wire enable, // Enable signal
    input wire [3:0] data_in, // 4-bit input data
    output reg [3:0] q // 4-bit output
);
    always @(posedge clk or posedge async_clear or posedge async_preset) begin
        if (async_clear) begin
            q <= 4'b0000; // Clear the register
        end
        else if (async_preset) begin
            q <= 4'b1111; // Preset the register
        end
        else if (enable) begin
            q <= data_in; // Load new data
        end
        else begin
            q <= q; // Maintain current value
        end
    end
endmodule