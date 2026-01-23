module ramp1(
    input clk,
    input areset,
    output reg [3:0] q);
    
    parameter S1 = 1, S2 = 2, S3 = 3, S4 = 4;
    reg [1:0] state, next;

    always @(*) begin
        case(state) 
            S1 : next = S2;
            S2 : next = S2;
            S3 : next = S4;
            S4 : next = S1;
            default : next = S1;
        endcase
    end


    always @(posedge clk) begin
        if(areset) begin
            state <= S1;
        end
        else begin
            state <= next;
        end
    end

    always @(*) begin
        case(state) 
            S1: q = 4'b0101;
            S2: q = 4'b1100;
            S3: q = 4'b1001;
            S4: q = 4'b0011;
            default: q = 4'b0000;
        endcase
    end

endmodule





        
