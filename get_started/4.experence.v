// 按位, 如果是一个多位数字和一个单位数字按位逻辑操作, 则要将单位数字replacate为多位数字的长度
// e.g. b[15:0]^{16{sub}}

// ->(H)casez, casex: z和x可以作为通配符使用
// concentration  previlege

// ->(H) 提前赋默认值

// ->(H) 批量生成实例  generate + for 
/*
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    

    full_adder adder0(.cin(cin), .cout(cout[0]), .a(a[0]), .b(b[0]), .sum(sum[0]));
    genvar i;
    generate 
        for(i = 1; i < 100; i++) begin: all_adder
            full_adder adder(.cin(cout[i-1]), .cout(cout[i]), .a(a[i]), .b(b[i]), .sum(sum[i]));           
        end
    endgenerate
                             
            
endmodule
*/
