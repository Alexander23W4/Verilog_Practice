
// ★★★ 在写verilog的时候, 注意 强目的性驱动, 形成风格, 形成习惯    是终极工程师需要的
//    -------所以注意几点--------
/*
1. 先想逻辑电路连接
2. 对应逻辑电路的特点, 强目的性驱动的选择优势的写法, 最终形成设计风格和习惯

*/

/*
1---> Key Words:
module
input output
assign always
endmodule
*/

/*
2---> Basic Operators in Verilog (bitwise/logical/reduction/case):
~      bitwise NOT
!      logical NOT

& | ^        bitwise AND OR XOR
&& ||        logical AND OR

~& ~| ~^     bitwise NAND NOR XNOR

&a |a ^a     reduction AND OR XOR
~&a ~|a ~^a  reduction NAND NOR XNOR

== !=        logical equality
=== !==      case equality

others:
{}      concatenation
{}:n    replication
?:      conditional
*/


/*
3---> Variables in Verilog:
wire                       represents physical connections
reg                        represents storage elements (flip-flops) ★:只能在always块里面赋值
integer                    用于辅助功能性数字, 如循环i

vector [m:n]               represents multiple bits (m>n)
*/

/*
4 ---> Number representaion:
N'bXXXX      N bits binary
N'dXXXX      N bits decimal
N'hXXXX      N bits hexadecimal
N'oXXXX      N bits octal
*/

/*
5 ---> functions::
if   case  for    generate + for
*/

/*
6 ---> System function:
$bits(variable)          returns the size (in bits) of the variable
*/


/*
7 ---> Write Testbench:
testbench测试脚本不是硬件, 只是脚本, initial块中就是脚本定义
`timescale ../..
initial forever

创造时钟:
`timescale 1ps/1ps
module top_module ( );
    reg clk;

    // 1?? 实例化 DUT（实例名随意，这里用 u_dut）
    dut u_dut (
        .clk(clk)
        // 其他端口如果有，可以先不连或补上
    );

    // 2?? 时钟产生：周期 10 ps，初始为 0，第一次上升沿
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;  // 5 ps 翻转一次 → 周期 10 ps
    end
endmodule

创造波形:
module top_module ( output reg A, output reg B );//

    // generate input patterns here
    initial begin
        A = 0; B = 0;
        #10 A = 1;
        #5  B = 1;
        #5 A = 0;
        #20 B = 0;
    end


endmodule

`timescale 1ps/1ps
module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
    q7 test_q7(.clk(clk), .in(in), .s(s), .out(out));
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        in = 1'b0;
        s = 3'b010;
        #10 s = 3'b110;
        #10 begin
            s = 3'b010;
            in = 1;
        end
        #10 begin
            s = 3'b111;
            in = 0;
        end
        #10 begin
            s = 3'b000;
            in = 1;
        end
        #30 in = 0;
    end

endmodule
*/