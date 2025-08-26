module CPU_16bit(
    input wire clk,
    input wire reset
);
    // Program Counter
    reg [7:0] PC;
    wire [7:0] next_PC;
    assign next_PC = PC + 1;

    // Instruction Register
    reg [15:0] IR;

    // General Purpose Registers
    reg [15:0] AC; // Accumulator
    reg [15:0] DR; // Data Register

    // Sequence Counter
    reg [3:0] SC;

    // Memory
    wire [15:0] mem_data_out;
    reg  [15:0] mem_data_in;
    reg  [7:0]  mem_addr;
    reg         mem_write_en;

    memory_16bit mem(
        .clk(clk),
        .data_in(mem_data_in),
        .address(mem_addr),
        .data_out(mem_data_out),
        .write_en(mem_write_en)
    );

    // ALU
    wire [15:0] alu_out;
    wire [3:0] opcode;
    ALU alu(
        .OPI(opcode),
        .data_1(AC),
        .data_2(DR),
        .data_out(alu_out),
        .clk(clk)
    );

    // Instruction Decoder
    wire [3:0] dest, src;
    wire is_load, is_store, is_alu, is_jump;
    instruction_decoder decoder(
        .instruction(IR),
        .opcode(opcode),
        .destination(dest),
        .source(src),
        .is_load(is_load),
        .is_store(is_store),
        .is_alu(is_alu),
        .is_jump(is_jump)
    );

    // Sequence Counter Logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            SC <= 0;
        else if (SC == 4'd3) // 예시: 4단계로 가정
            SC <= 0;
        else
            SC <= SC + 1;
    end

    // Main CPU Operation (간단 예시)
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            PC <= 0;
            IR <= 0;
            AC <= 0;
            DR <= 0;
            mem_write_en <= 0;
            mem_addr <= 0;
            mem_data_in <= 0;
        end else begin
            case (SC)
                0: begin // Fetch
                    mem_addr <= PC;
                    mem_write_en <= 0;
                end
                1: begin // Load instruction
                    IR <= mem_data_out;
                    PC <= next_PC;
                end
                2: begin // Decode & Execute (간단 예시)
                    if (is_load) begin
                        mem_addr <= IR[7:0];
                        mem_write_en <= 0;
                        DR <= mem_data_out;
                    end else if (is_store) begin
                        mem_addr <= IR[7:0];
                        mem_data_in <= AC;
                        mem_write_en <= 1;
                    end else if (is_alu) begin
                        DR <= alu_out;
                        AC <= alu_out;
                    end else if (is_jump) begin
                        PC <= IR[7:0];
                    end
                end
                3: begin // Write-back or idle
                    mem_write_en <= 0;
                end
            endcase
        end
    end

endmodule