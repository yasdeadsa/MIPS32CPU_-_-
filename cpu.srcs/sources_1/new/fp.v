`timescale 1ns / 1ps

module fp(
    input clkk,
    output reg clk=0
    );
    always @(posedge clkk)
        clk=~clk;
endmodule
