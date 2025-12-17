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

// ->(H) reg寄存器无法直接赋初始值, 只能在第一个时钟(上电)的时候用一个reset信号在always块内置零 

// ->(H) {pm, hh, mm, ss} = {1'b0, 8'd12, 8'd0, 8'd0}
//       用这种方法赋值时, 必须要写清楚位宽
//       其他时候也一样, 位宽显式化

// ->(H) 实现 有层级、有依赖顺序的状态转移
//       if, case, ?:本质上都是条件, 但是后两者只能是并行,
//       for不能随时钟不适用, 所以嵌套只能用if
        /*
        在一个 always @(posedge clk) 的时序块里，
        如果要表达“有层级、有依赖顺序的状态转移（嵌套算法）”，
        实际上只能用 if / else 嵌套。
        */

