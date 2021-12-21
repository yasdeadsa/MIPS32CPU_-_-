`timescale 1ns / 1ps

module mux15(
    input c,
    input [4:0]in0,in1,
    output reg [4:0]out
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
