`timescale 1ns / 1ps

module fiid(
    input rst,
    input clk,fiidwr,
    input [31:0]npc1in,irin,
    output [31:0]npc1out,irout
    );
    regtt #(
        .p(0)
    ) 
    ir(
        .rst(rst),
        .clk(clk),
        .wr(fiidwr),
        .in(irin),
        .out(irout)
    );
    regtt npc1(
        .rst(rst),
        .clk(clk),
        .wr(fiidwr),
        .in(npc1in),
        .out(npc1out)
    );
endmodule
