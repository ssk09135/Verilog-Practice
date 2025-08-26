module UART_rxd(
    parameter S0 = 4'b0000,
    parameter S1 = 4'b0001,
    parameter S2 = 4'b0010,
    parameter S3 = 4'b0011,
    parameter S4 = 4'b0100,
    parameter S5 = 4'b0101,
    parameter S6 = 4'b0110,
    parameter S7 = 4'b0111,
    parameter S8 = 4'b1000,
    parameter S9 = 4'b1001,
    parameter S10 = 4'b1010
) (
    input clk,
    input reset,
    input en,
    input load,
    input rxd,
    output reg baud_en,
    output reg [7:0] data_out
);
    reg [3:0]state ;
    reg [3:0]next_state;
    reg [7:0] data_buffer;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            data_buffer <= 8'b0;
        end else begin
            state <= next_state;
        end
    end
    always @(state or load or en or rxd) begin
        case (state)
            S0: next_state = (load & ~rxd) ? S1 : S0;
            S1: next_state = en ? S2 : S1;
            S2: next_state = en ? S3 : S2;
            S3: next_state = en ? S4 : S3;
            S4: next_state = en ? S5 : S4;
            S5: next_state = en ? S6 : S5;
            S6: next_state = en ? S7 : S6;
            S7: next_state = en ? S8 : S7;
            S8: next_state = en ? S9 : S8;
            S9: next_state = en ? S10 : S9;
            S10: next_state = en ? S0 : S10;
            default: next_state = S0;
        endcase
        always @(state) begin
            case (state)
                S0: begin
                    baud_en = 1'b0;
                end
                S1: begin
                    baud_en = 1'b1;
                end
                S2: begin
                    data_buffer[0] = rxd; // Read LSB first
                end
                S3: begin
                    data_buffer[1] = rxd;
                end
                S4: begin
                    data_buffer[2] = rxd;
                end
                S5: begin
                    data_buffer[3] = rxd;
                end
                S6: begin
                    data_buffer[4] = rxd;
                end
                S7: begin
                    data_buffer[5] = rxd;
                end
                S8: begin
                    data_buffer[6] = rxd;
                end
                S9: begin
                    data_buffer[7] = rxd; // Read MSB last
                end
                S10: begin
                    data_out = data_buffer; // Output the received data
                end
                default: begin
                    baud_en = 1'b0;
                end
            endcase
            
        end
    end 


    
endmodule