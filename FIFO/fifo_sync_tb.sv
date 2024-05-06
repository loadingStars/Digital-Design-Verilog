`timescale 1ns/1ps
`include "fifo_sync.sv"

module fifo_sync_tb ();
    
    logic clk = 1'b0;

    fifo_sync dut(.clk(clk));

    always begin : clk_generate
        #5 clk = ~clk;
    end

    initial begin
        #20;
        $finish;
    end

endmodule