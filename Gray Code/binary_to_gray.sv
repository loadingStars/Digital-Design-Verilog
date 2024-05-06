module binary_to_gray #(
    parameter int N = -1
)(
    input logic [N-1:0] binary,
    output logic [N-1:0] gray
);

    assign gray = binary ^ (binary >> 1);

endmodule