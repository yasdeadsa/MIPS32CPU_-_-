`timescale 1ns / 1ps

module cpu(
    output [6:0]gajs1,
    output [6:0]gajs2,
    output [7:0]cbitjs,
    //output [31:0]add,idir,
    //output [31:0]zout2,
    input rst,
    input clkk 
    );
    //wire clk;  
    wire [1:0]n;
    wire y,ddd,yy,yyy;
    wire [10:0]cc,cccc;
    wire [10:0]aa,dd,ff,aaaa;
    wire [10:0]bb,ee,bbbb;
    wire [31:0]zout2,a,b,c,d,e,g,h,i,j,k,l,m,o,p,q,r,s,t,u,v,w,x,z,aaa,bbb,ccc,eee,fff,ggg,hhh,iii,jjj,nnn,cbeforeid;
    wire [4:0]f;
    wire regwr,pcsrc,regdst,memtoreg,memrd,memwr,branch,jump,alusrc,immtoreg,nstop,mmm,canjump;
    wire [1:0]aluop;
    wire [3:0]aluctrl;
    wire clk,gt,le,ne;
    wire lef;
    //assign imtoreg=dd[3];
    //assign npc2=x,pcg=a,pcbefore=o,pcb=b,npc3=w,npc2b=u,add2a=j,add2b=l,memadd=z,cbeforeid={aaaa[2],cccc[0],aaaa[0],aaaa[1],bbbb[2],bbbb[3],bbbb[1],bbbb[0]
     //   ,cccc[2:1],aaaa[3],bbbb[4],bbbb[5],bbbb[6]};
 
   // assign caid={aawb,bbma,cc},exir=r,idexrst=rst||clear1,fiir=d;
//    assign memdata=eee,regwdata=g,wreg=f,regdst0=jjj[20:16],iromawb=jjj,zf=yy;
//    assign alua=ka,alub=sb;
    //assign fu=r[5:0];
    //assign ra=t;
    assign {aluop[1:0],alusrc}=cc;
    assign {le,gt,ne,memrd,memwr,branch,jump}=ee;
    assign {immtoreg,regdst,regwr,memtoreg}=ff;
    //assign rdataa=eee;
   // assign exout=cc;
    //assign exin=cccc;
    //assign fiidwr=1;
    //assign iro=e,iri=d,add=c;
    //assign zout22=zout2;
    //assign yyy=yy||canjump;
    //assign ddd=(yy&&branch)||canjump;
    assign ddd=(yy&&branch)||(gt&&((lef&&le)||(!le&&!le&&!y)));
    assign pcsrc=jump||ddd;
    //assign clk=clkk;
    fp fp0(
        .clk(clk),
        .clkk(clkk)
    );
    /*hz1 hz102(
        .xclk(clkk),
        .reset(0),
        .s(clk),
        .stop(0)
    );*/
    sm8 sm001(
        .en(8'b11111111),
        .stop8(0),
        .reset8(0),
        .xclk8(clkk),
        .en8(1),
        .bcd8(zout2[31:0]),
        .ga81(gajs1),
        .ga82(gajs2),
        .cbit8(cbitjs)
    );
    wire pcwr,clear0,clear1,fiidwr;
    tdqc tdqc1(
        .clear0(clear0),
        .clear1(clear1),
        .pcwr(pcwr),
        .fiidwr(fiidwr),
        .pcsrc(pcsrc),
        .fiidir(e),
        .idexir(r), 
        .idexmemrd(bb[3])
       // .ideximmtoreg()
    );
    wire [13:0]cuout;
    /*mux1 muxbeforeidex(
        .in0(cuout),
        .in1(0),
        .c(clear0),
        .out({aaaa[2],cccc[0],aaaa[0],aaaa[1],bbbb[2],bbbb[3],bbbb[1],bbbb[0]
        ,cccc[2:1],aaaa[3],bbbb[4],bbbb[5],bbbb[6]})
    );*/
    wire [10:0]aawb,bbma;
    /*mux1 muxbeforeexma(
        .in1(0),
        .in0({aawb,bbma}),
        .out({aa,bb}),
        .c(clear1)
    );*/
    wire nstopp;
    cu cu0(
        .nstop(nstop),
        .op(e[31:26]),
        .out({aaaa[2],cccc[0],aaaa[0],aaaa[1],bbbb[2],bbbb[3],bbbb[1],bbbb[0]
        ,cccc[2:1],aaaa[3],bbbb[4],bbbb[5],bbbb[6]})
    );
    /*regy regy0(
        .in(nstopp),
        .clk(clk),
        .out(nstop)
    );*/
    mux1 muxbepc(
        .in0(b),
        .in1(a),
        .c(pcsrc),
        .out(o)
    );
    pcc pc(
        .nstop(nstop),
        .rst(rst),
        .clk(clk),
        .wr(pcwr),
        .in(o),
        .out(c)
    );
    add add1(
        .a(32'd1),
        .b(c),
        .addout(b)
    );
    memp memp1(
        .clk(clk),
        .rst(rst),
        .add(c),
        .rdata(d),
        .memrd(1),
        .memwr(0)
    );
    //√∞œ’±‹√‚
    wire [2:0]alusrca,alusrcb;
    //assign alusrca[2]=
    wire memsrc;
    wire memtors,memtort;
    zfkz zfkz1(
        .memtors(memtors),
        .memtort(memtort),
        .fiidir(e),
        .regdst(regdst),
        .mawbmemtoreg(memtoreg),
        .exmair(bbb),
        .idexir(r),
        .mawbir(jjj),
        .exmaregwr(dd[1]),
        .exmamemtoreg(dd[0]),
        .exmamemwr(ee[2]),
        .idexmemwr(bb[2]),
        .mawbregwr(ff[1]),
        .alusrca(alusrca),
        .alusrcb(alusrcb),
        .memsrc(memsrc)
    );
    wire [31:0]ka,sb;
    mux3 mux2bealub(
        .in6(0),
        .in7(0),
        .in5(0),
        .in4(0),
        .in0(m),
        .in3(l),
        .in1(z),
        .in2(g),
        .c({bb[5],alusrcb[1]||alusrc,alusrcb[0]||alusrc}),
        .out(sb)
    );
    mux2 mux2bealua(
        .in0(k),
        .in1(z),
        .in2(g),
        .c({alusrca}),
        .out(ka)
    );
    
    alu alu1(
        .opcode(r[31:26]),
        .op(aluctrl),
        .a(ka),
        .b(sb),
        .y(t),
        .flag(n)
    );
     wire [31:0]aaaw;
    mux1 muxbeforemem(
        .in0(aaa),
        .in1(g),
        .c(memsrc),
        .out(aaaw)
    );
    mem mem1(
        .clk(clk),
        .add(z),
        .wdata(aaaw),
        .rdata(eee),
        .memrd(memrd),
        .memwr(memwr)
    );
    
    fiid fiid1(
        .rst(rst||clear0),
        .clk(clk),
        .fiidwr(fiidwr&&nstop),
        .npc1in(b),
        .irin(d),
        .npc1out(i),
        .irout(e)
    );
    regz regz1(
        //.zout0(zout0),
       // .zout1(zout1),
        .zout2(zout2),
        //.zout10(zout10),
        .rst(rst),
        .clk(clk),
        .regwr(regwr),
        .rreg1(e[25:21]),
        .rreg2(e[20:16]),
        .wreg(f),
        .wdata(g),
        .rdata1(p),
        .rdata2(q)
    );
    sigext sigext1(
        .sigin(e[15:0]),
        .sigout(h)
    );
    wire [31:0]tort,tors;
    mux1 mux1beforeidexrt(
        .c(memtort),
        .in0(q),
        .in1(g),
        .out(tort)  
    );
    mux1 mux1beforeidexrs(
        .c(memtors),
        .in0(p),
        .in1(g),
        .out(tors)  
    );
    idex idex1(
       // .cidexir(cidexir),
        .b(mmm),
        .rst(rst||clear1),
        .clk(clk),
        .irin(e),
        .irout(r),
        .immin(h),
        .immout(l),
        .rtin(tort),
        .rtout(m),
        .rsin(tors),
        .rsout(k),
        .npc1in(i),
        .npc1out(j),
        .wbin(aaaa),
        .wbout(aa),
        .main(bbbb),
        .maout(bb),
        .exin(cccc),
        .exout(cc)
    );
   // assign idexwbout=aawb;
    mux1 mux12(
        .c(alusrc),
        .in0(m),
        .in1(l),
        .out(s)
    );
    /*alu alu1(
        .op(aluctrl),
        .a(k),
        .b(s),
        .y(t),
        .flag(n)
    );*/
  //  assign cbeforeidmux=cuout;
    add add2(
        .a(j),
        .b(l),
        .addout(u)
    );
    
    exma exma1(
        //.nstop(nstop),
        .canjumpin(mmm),
        .canjumpout(canjump),
        .rst(rst),
        .clk(clk),
        .irin(r),
        .irout(bbb),
        .rtin(m),
        .rtout(aaa),
        .aluoutin(t),
        .aluoutout(z),
        .flagin(n),
        .flagout({lef,y}),
        .npc2in(u),
        .npc2out(x),
        .npc3in({2'b00,j[29:26],r[25:0]}),
        .npc3out(w),
        .wbin(aa),
        .wbout(dd),
        .main(bb),
        .maout(ee)
    );
   // assign exmawbout=dd;
    mux1 mux1zf(
        .in0(y),
        .in1(~y),
        .c(ne),
        .out(yy)
    );
    mux2 mux21(
        .in1(w),
        .in2(x),
        .c({ddd,jump}),
        .out(a)
    );
    /*mem mem1(
        .clk(clk),
        .add(z),
        .wdata(aaa),
        .rdata(eee),
        .memrd(memrd),
        .memwr(memwr)
    );*/
    mawb mawb1(
        .rst(rst),
        .clk(clk),
        .aluoutin(z),
        .aluoutout(fff),
        .memoutin(eee),
        .memoutout(ggg),
        .irin(bbb),
        .irout(jjj),
        .wbin(dd),
        .wbout(ff)
    );
    mux2 mux22(
        .in0(fff),
        .in1({jjj[15:0],16'b0}),
        .in2(ggg),
        .c({memtoreg,immtoreg}),
        .out(g)
    );
    /*mux1 mux14(
        .in0(fff),
        .in1(ggg),
        .out(g),
        .c(memtoreg)
    );*/
    mux15 mux151(
        .in0(jjj[20:16]),
        .in1(jjj[15:11]),
        .c(regdst),
        .out(f)
    );
    /*cu cu0(
        .nstop(nstop),
        .op(e[31:26]),
        .out()
    );*/
    alucu alucu0(
        .opcode(r[31:26]),
        .aluop(aluop),
        .funct(r[5:0]),
        .alucontrol(aluctrl)
    );
endmodule
