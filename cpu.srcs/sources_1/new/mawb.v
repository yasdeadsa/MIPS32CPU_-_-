`timescale 1ns / 1ps

module mawb(
    input rst,
    input clk,   
    input [31:0]wbin,    //´Ó¸ßµ½µÍregdst£¬regwr£¬memtoreg  
    output [31:0]wbout,  
    input [31:0]memoutin,irin,aluoutin,
    output [31:0]memoutout,irout,aluoutout
    );
    regtt
    wb(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(wbin),
        .out(wbout)
    );
    regtt #(
        .p(0)
    ) 
    ir(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(irin),
        .out(irout)
    );        
    regtt memout(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(memoutin),
        .out(memoutout)
    );
    regtt aluout(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(aluoutin),
        .out(aluoutout)
    );
endmodule
