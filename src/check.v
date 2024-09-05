`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/19 08:50:29
// Design Name: 
// Module Name: check
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 奇校验
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module check(

    input			sys_clk				,
    input			sys_rst				,
    input           por_rd_sop      ,
    input           por_rd_eop      ,
    input           por_rd_vld      ,
    input  [7:0]    por_rd_data     ,

    output  reg         rd_sop      ,
    output  reg         rd_eop      ,
    output  reg         rd_vld      ,
    output  reg[8:0]    rd_data     //[8]校验位

    );
	
	
wire [3:0] cnt;
wire [3:0] mod_2;


assign cnt = por_rd_data[0] + por_rd_data[1] + por_rd_data[2] + por_rd_data[3] + por_rd_data[4] + por_rd_data[5] + por_rd_data[6] + por_rd_data[7];
	
assign mod_2 = cnt % 2;
	
always @ (posedge sys_clk)
begin
	if(sys_rst)
		rd_data <= 9'd0;
	else if(por_rd_vld && mod_2 == 0)
	    rd_data <= {1'b1,por_rd_data};
	else if(por_rd_vld && mod_2 == 1)
	    rd_data <= {1'b0,por_rd_data};
	else
		rd_data <= rd_data;
end	
	
always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
		rd_sop <= 1'd0;
	    rd_eop <= 1'd0;
	    rd_vld <= 1'd0;
	end
	else
	begin
		rd_sop <= por_rd_sop;
	    rd_eop <= por_rd_eop;
	    rd_vld <= por_rd_vld;
	end	
end		
	
endmodule
