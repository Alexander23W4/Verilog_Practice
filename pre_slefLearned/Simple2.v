

module posedge_DFF(
    input wire D;
    input wire CLK;
    output reg Q;
)
    always @(posedge CLK)begin
        Q <= D;
    end

endmodule


module AD_simple(
    input wire A;
    input wire B;
    input wire CLK;
    output wire Y;
)
    assign M1 = A|Y;
    posedge_DFF DFF1(.D(M1), .CLK(CLK), .Q(M2));
    posedge_DFF DFF2(M2, B, Y);    // 不要这么写, not clear

endmodule


// always型的mux4_1
module MUX4_to_1(
    input wire [3:0] D,
    input wire [1:0] Sel,
    output reg Y
);
always @(D, Sel)
begin
    case({Sel[1], Sel[0]})
        2'b00:Y = D[0];
        2'b01:Y = D[1];
        2'b10:Y = D[2];
        2'b11:Y = D[3];
        default: Y = 1'bx;
    endcase
end
endmodule
