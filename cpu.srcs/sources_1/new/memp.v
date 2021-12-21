`timescale 1ns / 1ps

module memp(
    input clk,
    input rst,
    input [31:0]add,
    input memrd,
    input memwr,
    input [31:0]wdata,
    output reg [31:0]rdata
    );
    parameter data_width=32;
    parameter address_width=7;
    parameter num_ram=1<<address_width;
    
    reg [data_width-1:0]me[0:num_ram];
    wire [6:0]address=add[6:0];
   
    always @(posedge clk or posedge rst)
    begin
        if(rst) begin      

            me[0]=32'b00100000000000100000000000000001;   //addi $2,$0,1
            me[1]=32'b00100000000000110000000000000001;   //addi $3,$0,1
            me[2]=32'b00100000000000010000000000000001;   //addi $1,$0,1
            me[3]=32'b00100000000010000000000000000010;   //addi $8,$0,2
            me[4]=32'b00100000000010100010011100010000;   //addi $10,$0,10000 //n-1
            me[5]=32'b01110001010010100101000000000010;   //mul $10,$10,$10
            me[6]=32'b00000001010000010101000000100010;   //sub $10,$10,$1
            me[7]=32'b00100000010011000000000000000000;   //loop: addi $12,$2,0
            me[8]=32'b00100000011000100000000000000000;   //addi $2,$3,0 //test1,risk,forwarding,R-R
            me[9]=32'b10101101000000110000000000000000;   //sw $3,0,$8 //test4,risk,forwarding,I-I
            me[10]=32'b10001101000001010000000000000000;   //lw $5,0,$8 //test5,risk,block,load-use
            me[11]=32'b00000000101011000001100000100000;   //add $3,$5,$12
            me[12]=32'b00100001000010000000000000000001;   //addi $8,$8,1
            me[13]=32'b00000001010000010101000000100010;   //sub $10,$10,$1
            me[14]=32'b00010101010000001111111111111000;   //bne $10,$0,loop //test2,risk,forwarding,R-I
            me[15]=32'b00001000000000000000000000010011;   //jmp c //test3,risk,clear,B
            me[16]=32'b00100000000000110000000000000001;   //addi $3,$0,1
            me[17]=32'b00100000000010100000000000000001;   //addi $10,$0,1 
            me[18]=32'b00100000000010100000000000000001;   //addi $10,$0,1
            me[19]=32'b11111000000000000000000000000000;   //c: end
            
        end    
        else if(memwr)
            me[address]=wdata; 
    end
    always @(*)
    begin
        if(memrd)
            rdata=me[address];
    end
endmodule

