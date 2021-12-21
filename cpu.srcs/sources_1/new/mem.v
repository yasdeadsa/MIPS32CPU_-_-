`timescale 1ns / 1ps

module mem(
    input clk,
    input [31:0]add,
    input memrd,
    input memwr,
    input [31:0]wdata,
    output reg [31:0]rdata
    );
    parameter data_width=32;
    parameter address_width=8;
    parameter num_ram=1<<address_width;
    
    reg [data_width-1:0]me[0:num_ram];
    wire [7:0]address=add[7:0];
   
    
    always @(posedge clk)
    begin
        if(memwr)
            me[address]=wdata; 
    end
    
    always @(*)
    begin
        if(memrd)
            rdata=me[address];
    end
endmodule

