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

// ->   因为 if  elseif elseif... else整个一套本来就有先后关系, 所以可以不用ififif...嵌套

// ->   使用 one-hot 状态编码的优势是: 对于FSM的实现, 可以更方便地使用过去推当下状态, 
//      一般来说状态机更直观地方法肯定是条件法推next_state
// e.g.
/*
module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = state[A] & ~in | state[C] & ~in;
    assign next_state[B] = state[A] & in | state[B] & in | state[D] & in;
    assign next_state[C] = state[B] & ~in | state[D] & ~in;
    assign next_state[D] = state[C] & in;

    // Output logic: 
    assign out = (state[D] == 1);

endmodule
*/

// ->(H)
/*
FSM的控制量如果需要手动更新, 那么必须基于主state进行更新, 不能自成状态. 
主状态循环是主干, 设计时已考虑自启动和可复原性和完整性
控制量更新绝对不能自引用, 另起状态机等, 必须依赖于主状态机

reset量要注意实时性, 他不应被定义为一个时序控制量延时一个时钟生效, 而是要用组合判断即时生效
*/

// ->(H) 这次是大总结, 可以对照下面的系统设计例子来看:
/*
系统设计时的分块问题:
组合和datapath部分最好分块
时序部分: 可以并行串行分块, 
串行流水线分块是工程标准的(就是一个的输出量作为下一个的控制量)
嵌套分块的时候要注意理清时序

最后的底层模块只进行连线, 不写逻辑, 这样更容易维护.
*/

// 序列检测模块
// module seq_1101 (
//     input  clk,
//     input  reset,
//     input  data,
//     output start
// );

//     typedef enum logic [2:0] {
//         S0, S1, S11, S110
//     } state_t;

//     state_t state, next;

//     always @(posedge clk) begin
//         if (reset)
//             state <= S0;
//         else
//             state <= next;
//     end

//     always @(*) begin
//         case (state)
//             S0:   next = data ? S1   : S0;
//             S1:   next = data ? S11  : S0;
//             S11:  next = data ? S11  : S110;
//             S110: next = data ? S1   : S0;   // overlap ok
//             default: next = S0;
//         endcase
//     end

//     // Mealy pulse on detecting 1101
//     assign start = (state == S110) && data;

// endmodule


// module timer_fsm (
//     input  clk,
//     input  reset,
//     input  start,
//     input  done_counting,
//     input  ack,
//     output shift_ena,
//     output counting,
//     output done
// );

//     typedef enum logic [1:0] {
//         RECOG,
//         SHIFT,
//         COUNT,
//         DONE
//     } state_t;

//     state_t state, next;

//     // shift counter (FSM-owned)
//     reg [1:0] shift_cnt;

//     // state + counter register
//     always @(posedge clk) begin
//         if (reset) begin
//             state     <= RECOG;
//             shift_cnt <= 2'd0;
//         end else begin
//             state <= next;

//             if (state == SHIFT)
//                 shift_cnt <= shift_cnt + 1'b1;
//             else
//                 shift_cnt <= 2'd0;
//         end
//     end

//     // next-state logic
//     always @(*) begin
//         case (state)
//             RECOG: next = start ? SHIFT : RECOG;

//             SHIFT: next = (shift_cnt == 2'd3) ? COUNT : SHIFT;

//             COUNT: next = done_counting ? DONE : COUNT;

//             DONE:  next = ack ? RECOG : DONE;

//             default: next = RECOG;
//         endcase
//     end

//     // outputs (pure Moore)
//     assign shift_ena = (state == SHIFT);
//     assign counting  = (state == COUNT);
//     assign done      = (state == DONE);

// endmodule


// // 顶层模块只连线, 把模块都写好, 顶层只连模块.  如果是hierarchy也一样, 每一个模块的顶层都是只连线, 不实现逻辑
// module top_module (
//     input  clk,
//     input  reset,
//     input  data,
//     output shift_ena,
//     output counting,
//     input  done_counting,
//     output done,
//     input  ack
// );

//     wire start;
//     wire seq_recog_reset;

//     seq_1101 u_seq (
//         .clk   (clk),
//         .reset(reset),
//         .data  (data),
//         .start (start)
//     );

//     timer_fsm u_fsm (
//         .clk          (clk),
//         .reset        (reset),
//         .start        (start),
//         .done_counting(done_counting),
//         .ack          (ack),
//         .shift_ena    (shift_ena),
//         .counting     (counting),
//         .done         (done)
//     );

// endmodule

