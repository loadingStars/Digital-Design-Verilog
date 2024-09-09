module lfsr # (
    parameter WIDTH = 32,
    parameter logic [WIDTH-1:0] SEED = 34489738,
    parameter logic [WIDTH-1:0] TAP = 32'h80000032
    )
    (
    input logic clk,
    input logic n_rst,
    output logic [WIDTH-1:0] out
    );
    
    logic [WIDTH-1:0] state;

    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            state <= SEED;  // On reset, load the seed value
        end else begin
            state <= {state[WIDTH-2:0], ^(state & TAP)}; // Shift left and insert feedback at LSB
        end
    end

    assign out = state;


endmodule
