`timescale 1ns / 1ps

module add(
    input [31:0]a,b,
    output reg [31:0]addout
    );
    always @* begin
        addout=a+b;
    end
endmodule
