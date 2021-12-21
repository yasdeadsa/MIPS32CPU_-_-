`timescale 1ns / 1ps

module test;
    reg clk,rst;
    wire [5:0]fu,regdst0;
    wire [3:0]aluctrl,exmawbout,idexwbout;
    wire [1:0]aluop,alusrca,alusrcb;
    //wire [2:0]exin,exout;
    wire [31:0]exir,cidexir,fiir;
    wire [31:0]zout0,zout1,zout2,zout10,iro,iri,add,ra,alua,alub,memdata,regwdata,wreg,npc2,pcg,pcbefore,pcb,npc3,npc2b,add2a,add2b,memadd,cbeforeid,caid,irwb,cbeforeidmux;
    wire memtort,fiidwr,regwr,pcsrc,regdst,memtoreg,memrd,memwr,branch,jump,alusrc,nstop,immtoreg,ne,zf,canjump,mmm,memsrc,pcwr,clear0,clear1,idexrst,nstopp;
    cpu cpu01(
        /*.memtort(memtort),
        .nstopp(nstopp),
        .fiir(fiir),
        .idexrst(idexrst),
        .cidexir(cidexir),
        .exir(exir),
        .exmawbout(exmawbout),
        .idexwbout(idexwbout),
        .cbeforeidmux(cbeforeidmux),
        .iromawb(irwb),
        .caid(caid),
        .cbeforeid(cbeforeid),
        .clear0(clear0),
        .clear1(clear1),
        .pcwr(pcwr),
        .alusrca(alusrca),
        .alusrcb(alusrcb),
        .memsrc(memsrc),
        /*.iromawb(iromawb),
        .memadd(memadd),
        .add2a(add2a),
        .add2b(add2b),
        .npc2b(npc2b),
        .npc3(npc3),
        .pcb(pcb),
        .pcbefore(pcbefore),
        .pcg(pcg),
        .npc2(npc2),
        .mmm(mmm),
        .canjump(canjump),
        .zf(zf),
        .ne(ne),
        .immtoreg(immtoreg),
        .regdst0(regdst0),
        .wreg(wreg),
        .regwdata(regwdata),
        .memdata(memdata),
        .nstop(nstop),
        .alua(alua),
        .alub(alub),
        .fu(fu),
        .aluctrl(aluctrl),
        .ra(ra),
        .zout0(zout0),
        .zout1(zout1),
        .zout10(zout10),
        .aluop(aluop),
        /*.exout(exout),
        .exin(exin),
        .fiidwr(fiidwr),
        .regwr(regwr),
        .pcsrc(pcsrc),
        .regdst(regdst),
        .memtoreg(memtoreg),
        .memrd(memrd),
        .memwr(memwr),
        .branch(branch),
        .jump(jump),
        .alusrc(alusrc),
        .add(add),
        .iro(iro),
        .iri(iri),*/
        .clk(clk),
        .rst(rst),
        .zout22(zout2)
    );
    always #20
        clk=~clk;
    initial begin
        clk=0;
        rst=1;
        #10;
        rst=0;
        #500;
        rst=0;
        #100;rst=0;
    end
endmodule
