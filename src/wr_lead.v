`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/30 21:25:01
// Design Name: 
// Module Name: wr_lead
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//该模块主要解析数据包的长度，优先级和目的端口
//数据进入后存入该模块fifo
//每包数据产生一组info信号传入后级，告诉后级该包数据该从fifo读多长
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module wr_lead
(
	input				sys_clk		    ,
	input				sys_rst		    ,

	//data input
	input				wr_sop		    ,
	input				wr_eop		    ,
	input				wr_vld		    ,
	input		[7:0]	wr_data		    ,

	//data information
    output reg  [19:0]	data_info		,
    output reg  		data_info_vld	,//每拉高一次，表示一包数据到来
	
    //data output
	input				data_ren        ,//该信号一方面由addr_gen模块产生（dest端口空闲，直接送入dest端口），一方面由queue_gen模块产生（送入SRAM）
	output		[7:0]	data_out        ,

    //full flag
	output				full		    
);


reg  [11:0]	len_cnt	;
reg  [3:0]	pri	;
reg	 [3:0]  dest_port;
wire		empty;
	
always @ (posedge sys_clk)
begin
	if(sys_rst)
		len_cnt <= 12'd0;
	else 
		if(wr_sop && wr_vld)    //wr_vld?
			len_cnt <= 12'd0;
		else if(wr_vld)
			len_cnt <= len_cnt + 1'b1;
		else
			len_cnt <= len_cnt;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
		data_info     <= 19'd0;
		data_info_vld <= 1'd0;
	end
	else if(wr_eop && wr_vld)   //wr_vld?
	begin
		data_info     <= {len_cnt+1,pri,dest_port};
		data_info_vld <= 1'd1;
	end
	else 
	begin
		data_info     <= data_info;
		data_info_vld <= 1'd0;
	end
end	

//ctrl data
always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
		pri 	  <= 4'd0;
		dest_port <= 4'd0;
	end
	else if(wr_sop)
	begin
		pri 	  <= wr_data[6:4];//pri 4位 / wr_data[6:4] 3位
		dest_port <= wr_data[3:0];	
	end
	else
	begin
		pri 	  <= pri;
		dest_port <= dest_port;	
	end
end		
	
wr_fifo u_wr_fifo (
  .clk		(sys_clk	        ),    // input wire clk
  .srst		(sys_rst	        ),    // input wire srst
  .din		(wr_data	        ),    // input wire [7 : 0] din
  .wr_en	(wr_vld & !wr_sop   ),    // input wire wr_en
  .rd_en	(data_ren	        ),    // input wire rd_en
  .dout		(data_out	        ),    // output wire [7 : 0] dout
  .full		(full		        ),    // output wire full
  .empty	(empty		        )     // output wire empty
);				
	
endmodule
