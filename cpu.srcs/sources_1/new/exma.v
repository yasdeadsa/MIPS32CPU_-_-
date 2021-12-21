`timescale 1ns / 1ps

module exma(
    input rst,
    input clk,   
    input [31:0]wbin,    //从高到低regdst，regwr，memtoreg
    input [31:0]main,    //从高到低memrd，memwr，branch，jump
    input [31:0]flagin,canjumpin,    //从高到低aluop,alusrc
    output [31:0]wbout,canjumpout,  
    output [31:0]maout,
    output [31:0]flagout,
    output reg nstop,
    input [31:0]npc2in,npc3in,irin,aluoutin,rtin,
    output [31:0]npc2out,npc3out,irout,aluoutout,rtout
    );
    regtt 
    canjump(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(canjumpin),
        .out(canjumpout)
    );
    regtt 
    wb(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(wbin),
        .out(wbout)
    );
    regtt 
    ma(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(main),
        .out(maout)
    );
    regtt 
    flag(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(flagin),
        .out(flagout)
    );
    regtt #(
        .p(0)
    )
    ir(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(irin),
        .out(irout)
    );
    regtt npc2(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(npc2in),
        .out(npc2out)
    );
    regtt npc3(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(npc3in),
        .out(npc3out)
    );
    
    regtt rt(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(rtin),
        .out(rtout)
    );
    regtt aluout(
        .rst(rst),
        .clk(clk),
        .wr(1),
        .in(aluoutin),
        .out(aluoutout)
    );
    always @* begin
        if(irout[31:26]==6'b111110) begin
            nstop=0;        
        end
        else begin
            nstop=1;
        end
     end
endmodule
