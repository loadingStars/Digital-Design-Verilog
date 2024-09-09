module lfsr_top();

    // Define parameters
    localparam integer WIDTH = 32;
    localparam logic [WIDTH-1:0] SEED = 34534;
    localparam logic [WIDTH-1:0] TAP = 32'h80000032;

    // Define signals
    logic clk;
    logic n_rst;
    logic [WIDTH-1:0] out;

    // Instantiate the LFSR module
    lfsr #(
        .WIDTH(WIDTH),
        .SEED(SEED),
        .TAP(TAP)
    ) my_lfsr (
        .clk(clk),
        .n_rst(n_rst),
        .out(out)
    );


    initial begin
        $dumpfile("signal.vcd");
        $dumpvars(0, my_lfsr);
    end

endmodule
