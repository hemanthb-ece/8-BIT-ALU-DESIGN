module alu(
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [2:0] Sel,
    output reg  [7:0] Result,
    output reg        CarryOut,
    output wire       Zero
);
    always @(*) begin
        Result = 8'b0;
        CarryOut = 1'b0;
        case (Sel)
            3'b000: {CarryOut, Result} = {1'b0, A} + {1'b0, B};
            3'b001: begin
                Result = A - B;
                CarryOut = (A < B); // Borrow indicator
            end
            3'b010: Result = A & B;
            3'b011: Result = A | B;
            3'b100: Result = A ^ B;
            default: begin Result = 8'b0; CarryOut = 1'b0; end
        endcase
    end
    assign Zero = (Result == 8'b0);
endmodule
