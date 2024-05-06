`include "full_adder.sv"

module ripple_carry #(
    parameter int BITS = 4
) (
    input logic [BITS-1:0] a,
    input logic [BITS-1:0] b,
    input logic c_in,
    output logic [BITS-1:0] sum,
    output logic carry 
);

    logic [BITS:0] W_CARRY;
    assign W_CARRY [0] = c_in;
    

    // For n bit adder, n FA modules are needed
    // FA: a, b, c_in, sum, c_out
    generate
        for (genvar i = 0 ; i < BITS ; i++ ) begin : generate_adders
            full_adder full_adder_inst(a[i], b[i], W_CARRY[i], sum[i], W_CARRY[i+1]);
        end
    endgenerate

    assign carry = W_CARRY[BITS];
    

endmodule