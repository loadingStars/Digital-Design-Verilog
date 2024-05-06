`include "half_adder.sv"

module full_adder (
    input logic a,
    input logic b,
    input logic c_in,
    output logic sum,
    output logic carry
);
    logic ha0_s_out;
    logic ha0_c_out;
    logic ha1_c_out;
    logic ha1_s_out;
    
    //HA: a b sum carry
    half_adder ha0(a, b, ha0_s_out, ha0_c_out);
    half_adder ha1(ha0_s_out, c_in, ha1_s_out, ha1_c_out);

    assign sum = ha1_s_out;
    assign carry = ha0_c_out | ha1_c_out; 

    
endmodule