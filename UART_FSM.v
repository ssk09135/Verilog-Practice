module tx_FSM(
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
    clk
    , reset
    , en
    , load
    ,[7:0]data_in
    , baud_en
    ,txd
);
    input clk;
    input reset;
    input en;
    input load;
    input [7:0] data_in;
    output reg baud_en;
    output reg txd;

    reg [3:0] state;
    reg [3:0] next_state;  

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
        end 
        else begin
            state <= next_state;
        end
    end

    always @(state or load or en) begin
        case (state)
            S0: next_state = (load) ? S1 : S0;
            S1: next_state = en? S2 : S1;
            S2: next_state = en? S3 : S2;
            S3: next_state = en? S4 : S3;
            S4: next_state = en? S5 : S4;
            S5: next_state = en? S6 : S5;
            S6: next_state = en? S7 : S6;
            S7: next_state = en? S8 : S7;
            S8: next_state = en? S9 : S8;
            S9: next_state = en? S10 : S9;
            S10: next_state = en? S0 : S10;
            default: next_state = S0;
        endcase
    end
    always @(state) begin
        case (state)
            S0: begin
                baud_en = 1'b0;
                txd = 1'b1; // Idle state
            end
            S1: begin
                baud_en = 1'b1;
                txd = 1'b0; // Start bit
            end
            S2: begin
                baud_en = 1'b1;
                txd = data_in[0]; // Transmit LSB bit 0
            end
            S3: begin
                baud_en = 1'b1;
                txd = data_in[1]; // Transmit bit 1
            end
            S4: begin
                baud_en = 1'b1;
                txd = data_in[2]; // Transmit bit 2
            end
            S5: begin
                baud_en = 1'b1;
                txd = data_in[3]; // Transmit bit 3 
            end
            S6: begin
                baud_en = 1'b1;
                txd = data_in[4]; // Transmit bit 4
            end
            S7: begin
                baud_en = 1'b1;
                txd = data_in[5]; // Transmit bit 5
            end
            S8: begin
                baud_en = 1'b1;
                txd = data_in[6]; // Transmit bit 6
            end
            S9: begin
                baud_en = 1'b1;
                txd = data_in[7]; // Transmit MSB bit 7
            end
            S10: begin
                baud_en = 1'b1;
                txd = 1'b1; // Stop bit
            default: 
        endcase
    end

endmodule