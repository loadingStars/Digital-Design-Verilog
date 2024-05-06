module counter #(
    parameter WIDTH = 2
)(
    input logic clk,
    input logic nrst,
    output logic [WIDTH-1:0] out
);
    always @(posedge clk) begin
        if(!nrst)
        begin
            out = 0;
        end
        else
        begin
            out = out + 1;
        end

    end
endmodule