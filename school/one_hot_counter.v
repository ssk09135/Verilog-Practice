module one_hot_counter #(
    parameter WIDTH = 8
) (
    input wire clk,
    input wire rst_n,
    output reg [WIDTH-1:0] count
);
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= {{WIDTH-1{1'b0}}, 1'b1}; // Reset to 1-hot "1"
    end 
    else begin
        if (count[WIDTH-1] == 1'b1) begin
            count <= {{WIDTH-1{1'b0}}, 1'b1}; // Wrap around to first state
        end 
        
        else begin
            count <= {count[WIDTH-2:0], count[WIDTH-1]}; // Shift left
        end
    end
end
endmodule