`timescale 1ns/1ps
`include "counter.sv"

module counter_tb ();
    
    localparam int WIDTH = 4;
    localparam time CLOCK_CYCLE_TIME = 10ns;

    logic clk = 1'b0;
    logic nrst = 1'b1;
    logic [WIDTH-1:0] out;

    

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(1, dut);
    end

    always begin : clk_generate
        #((CLOCK_CYCLE_TIME / 2)) clk = ~clk;
    end

    counter #(WIDTH) dut (.clk(clk), .nrst(nrst), .out(out));

    initial begin
            #1;
			nrst = 0;
			@(negedge clk);
			nrst = 1;

			#50;
            $finish;

    end

endmodule