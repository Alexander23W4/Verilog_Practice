
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
