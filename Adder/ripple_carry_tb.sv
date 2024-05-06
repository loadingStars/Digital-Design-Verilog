`include "ripple_carry.sv"
`timescale 1ns/1ps

module ripple_carry_tb ();
    
    localparam  int BITS = 4;
    logic [BITS-1:0] a;
    logic [BITS-1:0] b;
    logic [BITS-1:0] sum;
    logic carry;

    ripple_carry #(BITS) dut (.a(a), .b(b), .c_in(1'b0), .sum(sum), .carry(carry));
   
    initial begin
        $dumpfile("out.vcd");
        $dumpvars(1, dut);
    end

    initial begin
        
        $monitor("a = %0d | b = %0d | sum = %0d | carry = %0d", a, b, sum, carry);
        
        #10;
        for (int i = 0; i < 2**BITS; i++) begin
        a = i; b = i;
        #10;
        end
        
        

    end


endmodule