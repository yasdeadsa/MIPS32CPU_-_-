`timescale 1ns / 1ps

module mux2(
    input [1:0]c,
    input [31:0]in0,in1,in2,in3,
    output reg [31:0]out
    );
    always @* begin
        case(c) //synopsys parallel_case
            2'b00:out=in0;
            2'b01:out=in1;
            2'b10:out=in2;
            2'b11:out=in3;
        endcase
    end
endmodule
