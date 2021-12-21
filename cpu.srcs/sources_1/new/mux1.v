`timescale 1ns / 1ps

module mux1(
    input c,
    input [31:0]in0,in1,
    output reg [31:0]out
    );
    always @* begin
        if(c) begin
            out =in1;
        end
        else begin
            out=in0;
        end
    end
endmodule
