`timescale 1ns/1ns
`include "full_adder.sv"

module tb ();

logic a, b, c_in, sum, carry;

full_adder dut (a, b, c_in, sum, carry);

initial begin
    $dumpfile("out.vcd");
    $dumpvars(1, dut);
end

initial begin
    $display("Simulation Begins\n");
    $display("---------------------------------------------------------------------");
    $monitor("a = 0b%0b | b = 0b%0b | c_in = 0b%0b | sum = 0b%0b | carry = 0b%0b \n", a, b, c_in, sum, carry);
    a = 0; b = 0; c_in = 0;
    #10;
    a = 0; b = 0; c_in = 1;
    #10
    a = 0; b = 1; c_in = 0;
    #10
    a = 0; b = 1; c_in = 1;
    #10
    a = 1; b = 0; c_in = 0;
    #10
    a = 1; b = 0; c_in = 1;
    #10
    a = 1; b = 1; c_in = 0;
    #10
    a = 1; b = 1; c_in = 1;
    #10
    $finish();

end
    
endmodule