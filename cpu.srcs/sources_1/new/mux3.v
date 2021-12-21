`timescale 1ns / 1ps

module mux3(
    input [2:0]c,
    input [31:0]in0,in1,in2,in3,in4,in5,in6,in7,
    output reg [31:0]out
    );
    always @* begin
        case(c)
            3'b000:out=in0;
            3'b001:out=in1;
            3'b010:out=in2;
            3'b011:out=in3;
            3'b100:out=in4;
            3'b101:out=in5;
            3'b110:out=in6;
            3'b111:out=in7;
        endcase
    end
endmodule
