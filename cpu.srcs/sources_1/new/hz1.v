`timescale 1ns / 1ps
//����xclkΪ�Դ�ʱ��
//����resetΪ��λ�ź�
//���sΪռ�ձ�Ϊһ����ź�
//���mΪ����
module hz1(
    input stop,
    input xclk,
    input reset,
    output reg s,
    output reg m
    );
    //totalΪ���ٸ�ʱ�����ڷ�������
    parameter bs=1;
    parameter total=100000000/bs;
    //parameter total=10;
    //mkΪ����Ϊ����ʱ������
    parameter mk=1;
    //��������������������
    reg [31:0]js;
    reg [31:0]mc;
    always @(posedge xclk or posedge reset) begin
        if(reset) begin
            s<=0;
            m<=0;
            js<=0;
            mc<=0;
        end
        else begin if(js==total) begin
                js<=1;
                s<=~s;
                mc<=1;
                m<=1;
            end
            else begin
                if(!stop)
                    js<=js+1;
                mc<=mc+1;
                if(mc==mk) m<=0;
                if(js==total/2) s<=~s;
            end
        end
    end
endmodule