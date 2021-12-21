module alucu(
    input [5:0]funct,opcode,
    input [1:0]aluop,
    output reg [3:0]alucontrol
    );
    always @(*) begin
        case(opcode)
            6'b001000:alucontrol<=4'b0001;
            6'b001001:alucontrol<=4'b0000;
            6'b001010:alucontrol<=4'b1010;
            6'b001011:alucontrol<=4'b1001;
            default:
                begin
                    case(aluop)
                        2'b00:alucontrol<=4'b0001;   //add
                        2'b01:alucontrol<=4'b0011;   //sub
                        default:case(funct)     //rÐÍ
                            6'b100000:alucontrol<=4'b0001;   //add
                            6'b100001:alucontrol<=4'b0000;   //addu
                            6'b100010:alucontrol<=4'b0011;   //sub
                            6'b100011:alucontrol<=4'b0010;   //subu
                            6'b100100:alucontrol<=4'b0111;   //and
                            6'b100101:alucontrol<=4'b1000;   //or
                            6'b101010:alucontrol<=4'b1010;   //slt
                            6'b000010:alucontrol<=4'b0100;   //mul
                            default:alucontrol<=4'bzzzz;
                        endcase
                    endcase
                end 
        endcase
    end
endmodule
