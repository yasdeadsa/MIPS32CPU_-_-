`timescale 1ns / 1ps
//输入xclk为自带时钟
//输入reset为复位信号
//输出s为占空比为一半的信号
//输出m为脉冲
module hz1(
    input stop,
    input xclk,
    input reset,
    output reg s,
    output reg m
    );
    //total为多少个时钟周期发生脉冲
    parameter bs=1;
    parameter total=100000000/bs;
    //parameter total=10;
    //mk为脉宽为几个时钟周期
    parameter mk=1;
    //脉冲计数器和脉宽计数器
    reg [31:0]js;
    reg [31:0]mc;
    always @(posedge xclk or posedge reset) begin
        if(reset) begin
            s<=0;
            m<=0;
            js<=0;
            mc<=0;
        end
        else begin if(js==total) begin
                js<=1;
                s<=~s;
                mc<=1;
                m<=1;
            end
            else begin
                if(!stop)
                    js<=js+1;
                mc<=mc+1;
                if(mc==mk) m<=0;
                if(js==total/2) s<=~s;
            end
        end
    end
endmodule