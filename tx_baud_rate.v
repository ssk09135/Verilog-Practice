module tx_baud_rate(
    parameter N = 10, 
    parameter FREQ_CLK = 9_600_000, // Example clock frequency 9.6MHz
    parameter BAUD_RATE = 9600 // Example baud rate 
) (
    input wire clk,
    input wire reset,
    input wire baud_en,
    output wire en,
);
    reg [N-1:0] count;
    parameter integer COUNT_MAX = FREQ_CLK / BAUD_RATE - 1;
    assign en = (count == COUNT_MAX) ? 1'b1 : 1'b0;


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            en <= 0;
        end
        else begin 
            if (baud_en) begin 
                if (count==(N-1)) begin
                    count <= 0;
                end
                else begin
                    count <= count + 1'b1;
                end
            end
        end
    end
endmodule