module alu(
    input [5:0]opcode,
    input [31:0]a,
    input [31:0]b,
    input [3:0]op,
    output reg [1:0]flag, //低位zf，高位lef
    output reg [31:0]y
    );
    reg [32:0]out;
    always @(*)
    begin
        case(op)
            //加法按照十进制处理溢出
            4'b0001: begin
                if(a+b>33'd4294967295) begin
                    out=a+b-((a+b)/1000000000)*1000000000;
                end 
                else begin
                    out=a+b;
                end  
                if((opcode==6'b000000)||(opcode==6'b001000)||opcode==6'b001001) begin
                    y=out;
                end
                else begin
                    y=a+b;
                end
            end             
            //4'b0000:y=a+b; //add
            4'b0000:y=$signed(a)+$signed(b); //addu
            4'b0010: begin   //subu
                y=a-b;
                if(y==0) begin
                    flag[0]=1;
                end
                else begin
                    flag[0]=0;
                    if(y<0) 
                        flag[1]=1;
                    else
                        flag[1]=0;
                end 
            end
            4'b0011: begin   //sub
                y=$signed(a)-$signed(b);
                if(y==0) begin
                    flag[0]=1;
                end
                else begin
                    flag[0]=0;
                    if(y<0||y[31]) 
                        flag[1]=1;
                    else
                        flag[1]=0;
                end 
            end
            4'b0100:y=a*b;      //mul
            4'b0101:y=~(a||b);   //或非，nor
            4'b0110:y=a^b;   //异或,xor
            4'b0111:y=a&&b;  //逻辑与,and
            4'b1000:y=a||b;  //逻辑或,or
            4'b1001:y=(a<b)?1:0;  //sltu,
            4'b1010:y=($signed(a)<$signed(b))?1:0;  //slt,
         endcase
    end
endmodule
