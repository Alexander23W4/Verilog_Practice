// module-module name-input&output   endmodule   
/*
module-moduleName-(端口列表);
端口信号声明 (输入输出属性, 信号的数据类型, 信号的位宽); 
input output inout; wire reg logic; 位宽[n1:n2]
参数声明 parameter ...
*/
// assign 内部信号声明

// always 底层模块或门原语调用
/*
@ means "at", "wait for", 赋值对象 must be reg type     (begin end 之间是顺序执行, 否则并行执行)
negedge posedge 下降沿, 上升沿      
e.g. always @(D);  // whenever D changes excute the command
★: if case for , could be used in always block
一般来说时序逻辑赋值要用 A <= B;  // non-blocking assignment  非阻塞赋值
组合逻辑赋值要用 A = B;   // blocking assignment  阻塞赋值
★:一个 always 块内只能用一种赋值方式
*/

// 门原语: 可用 and or xor ... 可以直接用, 本质上就是已经封装好的底层模块

// 数据类型:
// net中的数据类型: wire tri supply0....                     以wire为主
// variable中的数据类型: reg integer time real realtime...   以reg为主

// 数字表示:
// 6' b010100    8' sb10010111 = -010111   5' d14 = 01110 

// 逻辑(bool)表示:
// 1, 0, x, z(高阻态)

//-------------------------------
// 几种verilog代码风格:
// 门电路型: 直接上门, 但是过于封装, 不显含底层逻辑, 写这个还不如直接画原理图. 优先级(3)
// assign型: 介于两者之间, 一般是纯粹的逻辑实现用这个, 写这个包含大量的逻辑符号. 优先级(2)
// always型: 比较好的一点就是直接可以上if case for, 抽象逻辑友好. 优先级(1)

// module structure test:
module MUX2to1(
    input wire A, 
    input wire B,
    input wire Sel,
    output wire Y
)
assign Y = Sel ? B : A;
endmodule

module edge_DFF(
    input wire D,
    input wire CLK,
    output reg Q,
    output reg Qbar
)
always @(posedge CLK)   
begin
    Q <= D;
    Qbar <= ~D;
end
endmodule

module full_subtractor();

endmodule

module random_test(A, B, Y);
    input wire A;
    input wire B;
    output wire Y;

    assign M = A !&& B;
    assign T = A ~^ M;
    assign Y = T !|| B;
endmodule 

module full_adder(A, B, Carry_in, S, Carry_out);
    input wire [3:0] A, B;
    input wire Carry_in;
    output reg [3:0] S;
    output reg Carry_out;

endmodule


// logic words test:

Y = ~8' b10101000;






