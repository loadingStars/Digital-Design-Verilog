module FSM(
    // Input
    input wire clk,
    input wire reset,
    input wire A,
    input wire B,

    // Outputs
    output wire output1,
    output wire output2,
    output reg[2:0] status
);

initial begin
    $dumpfile("signal.vcd");
    $dumpvars(0, FSM);
end

// Creating a state encoding
typedef enum logic[2:0] {STATE_I, STATE_1, STATE_2, STATE_3, STATE_4, STATE_5_PH, STATE_6_PH, STATE_7_PH} state_t;
state_t currentState, nextState;

// Synchronous state-transition
always @(posedge clk ) begin
    if (reset) begin
        currentState <= STATE_I;
    end else begin
        currentState <= nextState;
    end
end

// Conditional Transition logic
always_comb begin
    nextState = currentState;
    case (currentState)
        STATE_I: begin
                nextState = STATE_1;
        end
        STATE_1: begin
            if (A & B) begin
                nextState = STATE_2;
            end
        end
        STATE_2: begin
            if (A) begin
                nextState = STATE_3;
            end
        end
        STATE_3: begin
            if (!A & B) begin
                nextState = STATE_I;
            end else if (A & !B) begin
                nextState = STATE_4;
            end
        end
        STATE_4 : begin
        end
        // PH Transitions
        STATE_5_PH: begin
            nextState = STATE_I;
        end
        STATE_6_PH: begin
            nextState = STATE_I;
        end
        STATE_7_PH: begin
            nextState = STATE_I;
        end 
    endcase

end


// Output logic
// Multi Bit outputs
always_comb begin
    status = 3'b000;
    case (currentState)
        STATE_2 : begin
            status = 3'b010;
        end
        STATE_3 : begin
            status = 3'b011;
        end
    endcase
end

// Single Bit outputs
assign output1 = (currentState == STATE_1) | (currentState == STATE_2);
assign output2 = (currentState == STATE_2);

endmodule
