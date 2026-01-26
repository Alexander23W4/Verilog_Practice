module ramp1(
    input clk,
    input areset,
    output reg [3:0] q);
    
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    reg [25:0] count;
    reg [1:0] state, next;


    always @(*) begin
        if(count == 26'd50000000)begin
            case(state) 
                S0 : next = S1;
                S1 : next = S2;
                S2 : next = S3;
                S3 : next = S0;
                default : next = S0;
            endcase
        end
        else begin
            next = state;
        end
    end


    always @(posedge clk) begin
            state <= next;
            if(count == 26'd50000000) begin
                count <= 0;
            end
            else begin
                count <= count + 1;
            end
    end

    always @(*) begin
        case(state) 
            S0: q = 4'b0101;
            S1: q = 4'b1100;
            S2: q = 4'b1001;
            S3: q = 4'b0011;
            default: q = 4'b0000;
        endcase
    end

endmodule





        
