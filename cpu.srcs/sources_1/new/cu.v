`timescale 1ns / 1ps
//b
module cu(
    input [5:0]op,
    output reg nstop,
    output reg [13:0]out
    );
    always @* begin
        case(op)
            6'b000000:out=14'b10010000100000; //r
            6'b100011:out=14'b01110100000000; //lw
            6'b101011:out=14'b01001000000000; //sw
            6'b000100:out=14'b00000010010000; //beq
            6'b000101:out=14'b00000010010100; //bne,ne
            6'b000010:out=14'b00000001000000; //j
            6'b001111:out=14'b00010000001000; //lui
            6'b011100:out=14'b10010000100000; //mul
            6'b000111:out=14'b00000000010010; //bgtz
            6'b000110:out=14'b00000000010011; //blez
            6'b001000:out=14'b01010000100000; //addi
            6'b001001:out=14'b01010000100000; //addiu
            6'b001010:out=14'b01010000100000; //slti
            6'b001011:out=14'b01010000100000; //sltiu
            default:out=10'b000000000000;
        endcase
        /*case(op)
            6'b000000:out=11'b10010000100; //r
            6'b100011:out=11'b01110100000; //lw
            6'b101011:out=11'b01001000000; //sw
            6'b000100:out=11'b00000010010; //beq
            6'b000101:out=11'b00000010010; //bne
            6'b000010:out=11'b00000001000; //j
            6'b001111:out=11'b00010000001; //lui
            6'b011100:out=11'b10010000100; //mul
            default:out=11'b00000000000;
        endcase*/
        if(op==6'b111110) begin
            nstop=0;        
        end
        else begin
            nstop=1;
        end
    end
endmodule
