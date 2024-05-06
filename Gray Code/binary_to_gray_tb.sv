`include "binary_to_gray.sv"
`timescale 1ns/1ps

module binary_to_gray_tb();

localparam int BITS = 8;

logic [BITS-1:0] binary;
logic [BITS-1:0] gray;

binary_to_gray  #(BITS) dut (.binary(binary), .gray(gray));

initial begin : 
    $dumpfile("out.vcd");
    $dumpvars(1, dut);
end

initial begin

    $display("Simulation Begins");
    $monitor("Binary %b | Gray %b", binary ,gray);

    #10; 
    for (int i = 0; i < 2**BITS; i++ ) begin
        #10;
        binary = i;    
    end
    #10; 

    $finish;

end

endmodule