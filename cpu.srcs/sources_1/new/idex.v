`timescale 1ns / 1ps

module idex(
    input rst,
    input clk,   
    input [31:0]wbin,    //从高到低regdst，regwr，memtoreg
    input [31:0]main,    //从高到低memrd，memwr，branch，jump
    input [31:0]exin,    //从高到低aluop,alusrc
    output [31:0]wbout,  
    output [31:0]maout,
    output [31:0]exout,
    input [31:0]npc1in,irin,rsin,rtin,immin,cidexir,
    output [31:0]npc1out,irout,rsout,rtout,immout,
    output reg b
    );
    always @(negedge clk) begin
        b=((rsin>0&&main[5])||(rsin<0&&main[6]));
    end
    regtt 
    wb(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(wbin),
        .out(wbout)
    );
    regtt 
    ma(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(main),
        .out(maout)
    );
    regtt 
    ex(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(exin),
        .out(exout)
    );
    regtt #(
        .p(0)
    )
    ir(
        .cout(cidexir),
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(irin),
        .out(irout)
    );
    regtt npc1(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(npc1in),
        .out(npc1out)
    );
    regtt rs(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(rsin),
        .out(rsout)
    );
    regtt rt(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(rtin),
        .out(rtout)
    );
    regtt imm(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(immin),
        .out(immout)
    );
endmodule
