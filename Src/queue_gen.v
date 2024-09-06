`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/02 14:52:07
// Design Name: 
// Module Name: queue_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module queue_gen(
    input			sys_clk			,
    input			sys_rst			,

    input			port0_info_vld	,	
    input			port1_info_vld	,	
    input			port2_info_vld	,	
    input			port3_info_vld	,	
    input			port4_info_vld	,	
    input			port5_info_vld	,	
    input			port6_info_vld	,	
    input			port7_info_vld	,	
    input			port8_info_vld	,	
    input			port9_info_vld	,	
    input			port10_info_vld	,
    input			port11_info_vld	,
    input			port12_info_vld	,
    input			port13_info_vld	,
    input			port14_info_vld	,
    input			port15_info_vld	,

    input	[31:0]	port0_info	    ,//2'd0;[29:16]:addr_start;[15:4]:len;[3:0]:pri    
    input	[31:0]	port1_info	    ,    
    input	[31:0]	port2_info	    ,    
    input	[31:0]	port3_info	    ,    
    input	[31:0]	port4_info	    ,    
    input	[31:0]	port5_info	    ,    
    input	[31:0]	port6_info	    ,    
    input	[31:0]	port7_info	    ,    
    input	[31:0]	port8_info	    ,    
    input	[31:0]	port9_info	    ,    
    input	[31:0]	port10_info	    ,
    input	[31:0]	port11_info	    ,
    input	[31:0]	port12_info	    ,
    input	[31:0]	port13_info	    ,
    input	[31:0]	port14_info	    ,
    input	[31:0]	port15_info	    ,

    output	reg		queue_full		,	
    output	    	rd_info_vld		,
    output	[27:0]	rd_info			,//[27:26]2'd0;[25:12]start_addr;[11:0]:len
    output	reg		port_idle		,

	output	reg		req_addr		,//给地址管理模块	
    input			req_done		,//此时SRAM已读完
    output	wire	addr_done		,//作用？
	output	wire [516:0]		addr_use 	
);
	
reg				port0_rd_en		;
reg				port1_rd_en		;
reg				port2_rd_en		;
reg				port3_rd_en		;
reg				port4_rd_en		;
reg				port5_rd_en		;
reg				port6_rd_en		;
reg				port7_rd_en		;
reg				port8_rd_en		;
reg				port9_rd_en		;
reg				port10_rd_en	;
reg				port11_rd_en	;
reg				port12_rd_en	;
reg				port13_rd_en	;
reg				port14_rd_en	;
reg				port15_rd_en	;

wire  [31:0]    port0_dout		;
wire  [31:0]    port1_dout		;
wire  [31:0]    port2_dout		;
wire  [31:0]    port3_dout		;
wire  [31:0]    port4_dout		;
wire  [31:0]    port5_dout		;
wire  [31:0]    port6_dout		;
wire  [31:0]    port7_dout		;
wire  [31:0]    port8_dout		;
wire  [31:0]    port9_dout		;
wire  [31:0]    port10_dout		;
wire  [31:0]    port11_dout		;
wire  [31:0]    port12_dout		;
wire  [31:0]    port13_dout		;
wire  [31:0]    port14_dout		;
wire  [31:0]    port15_dout		;

wire            port0_full		;
wire            port1_full		;
wire            port2_full		;
wire            port3_full		;
wire            port4_full		;
wire            port5_full		;
wire            port6_full		;
wire            port7_full		;
wire            port8_full		;
wire            port9_full		;
wire            port10_full		;
wire            port11_full		;
wire            port12_full		;
wire            port13_full		;
wire            port14_full		;
wire            port15_full		;

wire            port0_empty		;
wire            port1_empty		;
wire            port2_empty		;
wire            port3_empty		;
wire            port4_empty		;
wire            port5_empty		;
wire            port6_empty		;
wire            port7_empty		;
wire            port8_empty		;
wire            port9_empty		;
wire            port10_empty	;
wire            port11_empty	;
wire            port12_empty	;
wire            port13_empty	;
wire            port14_empty	;
wire            port15_empty	;	

queue_fifo u_queue_fifo0 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port0_info		),  // input wire [31 : 0] din
  .wr_en	(port0_info_vld	),  // input wire wr_en
  .rd_en	(port0_rd_en	),  // input wire rd_en
  .dout		(port0_dout		),  // output wire [31 : 0] dout
  .full		(port0_full		),  // output wire full
  .empty	(port0_empty	)   // output wire empty
);
	
queue_fifo u_queue_fifo1 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port1_info		),  // input wire [31 : 0] din
  .wr_en	(port1_info_vld	),  // input wire wr_en
  .rd_en	(port1_rd_en	),  // input wire rd_en
  .dout		(port1_dout		),  // output wire [31 : 0] dout
  .full		(port1_full		),  // output wire full
  .empty	(port1_empty	)   // output wire empty
);	

queue_fifo u_queue_fifo2 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port2_info		),  // input wire [31 : 0] din
  .wr_en	(port2_info_vld	),  // input wire wr_en
  .rd_en	(port2_rd_en	),  // input wire rd_en
  .dout		(port2_dout		),  // output wire [31 : 0] dout
  .full		(port2_full		),  // output wire full
  .empty	(port2_empty	)   // output wire empty
);	

queue_fifo u_queue_fifo3 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port3_info		),  // input wire [31 : 0] din
  .wr_en	(port3_info_vld	),  // input wire wr_en
  .rd_en	(port3_rd_en	),  // input wire rd_en
  .dout		(port3_dout		),  // output wire [31 : 0] dout
  .full		(port3_full		),  // output wire full
  .empty	(port3_empty	)   // output wire empty
);

queue_fifo u_queue_fifo4 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port4_info		),  // input wire [31 : 0] din
  .wr_en	(port4_info_vld	),  // input wire wr_en
  .rd_en	(port4_rd_en	),  // input wire rd_en
  .dout		(port4_dout		),  // output wire [31 : 0] dout
  .full		(port4_full		),  // output wire full
  .empty	(port4_empty	)   // output wire empty
);

queue_fifo u_queue_fifo5 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port5_info		),  // input wire [31 : 0] din
  .wr_en	(port5_info_vld	),  // input wire wr_en
  .rd_en	(port5_rd_en	),  // input wire rd_en
  .dout		(port5_dout		),  // output wire [31 : 0] dout
  .full		(port5_full		),  // output wire full
  .empty	(port5_empty	)   // output wire empty
);

queue_fifo u_queue_fifo6 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port6_info		),  // input wire [31 : 0] din
  .wr_en	(port6_info_vld	),  // input wire wr_en
  .rd_en	(port6_rd_en	),  // input wire rd_en
  .dout		(port6_dout		),  // output wire [31 : 0] dout
  .full		(port6_full		),  // output wire full
  .empty	(port6_empty	)   // output wire empty
);

queue_fifo u_queue_fifo7 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port7_info		),  // input wire [31 : 0] din
  .wr_en	(port7_info_vld	),  // input wire wr_en
  .rd_en	(port7_rd_en	),  // input wire rd_en
  .dout		(port7_dout		),  // output wire [31 : 0] dout
  .full		(port7_full		),  // output wire full
  .empty	(port7_empty	)   // output wire empty
);

queue_fifo u_queue_fifo8 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port8_info		),  // input wire [31 : 0] din
  .wr_en	(port8_info_vld	),  // input wire wr_en
  .rd_en	(port8_rd_en	),  // input wire rd_en
  .dout		(port8_dout		),  // output wire [31 : 0] dout
  .full		(port8_full		),  // output wire full
  .empty	(port8_empty	)   // output wire empty
);

queue_fifo u_queue_fifo9 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port9_info		),  // input wire [31 : 0] din
  .wr_en	(port9_info_vld	),  // input wire wr_en
  .rd_en	(port9_rd_en	),  // input wire rd_en
  .dout		(port9_dout		),  // output wire [31 : 0] dout
  .full		(port9_full		),  // output wire full
  .empty	(port9_empty	)   // output wire empty
);

queue_fifo u_queue_fifo10 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port10_info	),  // input wire [31 : 0] din
  .wr_en	(port10_info_vld),  // input wire wr_en
  .rd_en	(port10_rd_en	),  // input wire rd_en
  .dout		(port10_dout	),  // output wire [31 : 0] dout
  .full		(port10_full	),  // output wire full
  .empty	(port10_empty	)   // output wire empty
);

queue_fifo u_queue_fifo11 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port11_info	),  // input wire [31 : 0] din
  .wr_en	(port11_info_vld),  // input wire wr_en
  .rd_en	(port11_rd_en	),  // input wire rd_en
  .dout		(port11_dout	),  // output wire [31 : 0] dout
  .full		(port11_full	),  // output wire full
  .empty	(port11_empty	)   // output wire empty
);

queue_fifo u_queue_fifo12 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port12_info	),  // input wire [31 : 0] din
  .wr_en	(port12_info_vld),  // input wire wr_en
  .rd_en	(port12_rd_en	),  // input wire rd_en
  .dout		(port12_dout	),  // output wire [31 : 0] dout
  .full		(port12_full	),  // output wire full
  .empty	(port12_empty	)   // output wire empty
);

queue_fifo u_queue_fifo13 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port13_info	),  // input wire [31 : 0] din
  .wr_en	(port13_info_vld),  // input wire wr_en
  .rd_en	(port13_rd_en	),  // input wire rd_en
  .dout		(port13_dout	),  // output wire [31 : 0] dout
  .full		(port13_full	),  // output wire full
  .empty	(port13_empty	)   // output wire empty
);

queue_fifo u_queue_fifo14 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port14_info	),  // input wire [31 : 0] din
  .wr_en	(port14_info_vld),  // input wire wr_en
  .rd_en	(port14_rd_en	),  // input wire rd_en
  .dout		(port14_dout	),  // output wire [31 : 0] dout
  .full		(port14_full	),  // output wire full
  .empty	(port14_empty	)   // output wire empty
);

queue_fifo u_queue_fifo15 (
  .clk		(sys_clk		),  // input wire clk
  .srst		(sys_rst		),  // input wire srst
  .din		(port15_info	),  // input wire [31 : 0] din
  .wr_en	(port15_info_vld),  // input wire wr_en
  .rd_en	(port15_rd_en	),  // input wire rd_en
  .dout		(port15_dout	),  // output wire [31 : 0] dout
  .full		(port15_full	),  // output wire full
  .empty	(port15_empty	)   // output wire empty
);

//--------------------------------------------

parameter FSM_IDLE = 7'b0000001;
parameter FSM_RD   = 7'b0000010;
parameter FSM_ARBI = 7'b0000100;
parameter FSM_S0   = 7'b0001000;
parameter FSM_S1   = 7'b0010000;
parameter FSM_S2   = 7'b0100000;
parameter FSM_S3   = 7'b1000000;

reg		[6:0]	next_state	;
reg		[6:0]	curr_state	;

reg		[3:0]	port_cnt	;//0~15
reg		[3:0]	arbi_cnt	;//0~7

reg		[3:0]	queue_cnt	;//队列里有多少包

always @ (posedge sys_clk)
begin
	if(sys_rst)
		curr_state <= FSM_IDLE;
	else
		curr_state <= next_state;
end	

always @ (*)
begin
	if(sys_rst)
		next_state = FSM_IDLE;
	else
		case(curr_state)
			FSM_IDLE:
			begin
				if((!port0_empty || !port1_empty || !port2_empty || !port3_empty || !port4_empty || !port5_empty || !port6_empty || !port7_empty ||!port8_empty || !port9_empty || 
				!port10_empty || !port11_empty || !port12_empty || !port13_empty || !port14_empty || !port15_empty) && queue_cnt < 8)
					next_state = FSM_RD;//任一个端口有数据，进入该状态
				else if((port0_empty || port1_empty || port2_empty || port3_empty || port4_empty || port5_empty || port6_empty || port7_empty ||port8_empty || port9_empty || 
				port10_empty || port11_empty || port12_empty || port13_empty || port14_empty || port15_empty) && queue_cnt > 0)
					next_state = FSM_ARBI;
				else
					next_state = FSM_IDLE;
			end
			FSM_RD:
			begin
				if(port_cnt == 4'd15)
					next_state <= FSM_ARBI;
				else
					next_state <= FSM_RD;
			end
			FSM_ARBI:
			begin
				if(arbi_cnt == 4'd7)
					next_state <= FSM_S0;
				else
					next_state <= FSM_ARBI;
			end			
			FSM_S0://锁存输出数据包info
			begin
				next_state <= FSM_S1;
			end			
			FSM_S1://请求地址
			begin
				if(req_done)//可以占用并修改内存空间
					next_state = FSM_S2;
				else
					next_state = FSM_S1;
			end				
			FSM_S2://内存地址分配处理
			begin
				next_state = FSM_IDLE;
			end				
			default: next_state = FSM_IDLE;
		endcase			
end	 

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port_cnt <= 4'd0;
	else if(curr_state == FSM_RD)
		port_cnt <= port_cnt + 1'b1;
	else
		port_cnt <= 4'd0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		arbi_cnt <= 4'd0;
	else if(curr_state == FSM_ARBI)
		arbi_cnt <= arbi_cnt + 1'b1;
	else
		arbi_cnt <= 4'd0;
end	

//---------------queue_cnt---------------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		queue_cnt <= 4'd0;
	else if((curr_state == FSM_RD && port_cnt == 4'd0 && !port0_empty && queue_cnt < 8) || (curr_state == FSM_RD && port_cnt == 4'd1 && !port1_empty && queue_cnt < 8) ||
			(curr_state == FSM_RD && port_cnt == 4'd2 && !port2_empty && queue_cnt < 8) || (curr_state == FSM_RD && port_cnt == 4'd3 && !port3_empty && queue_cnt < 8) ||
			(curr_state == FSM_RD && port_cnt == 4'd4 && !port4_empty && queue_cnt < 8) || (curr_state == FSM_RD && port_cnt == 4'd5 && !port5_empty && queue_cnt < 8) ||
			(curr_state == FSM_RD && port_cnt == 4'd6 && !port6_empty && queue_cnt < 8) || (curr_state == FSM_RD && port_cnt == 4'd7 && !port7_empty && queue_cnt < 8) ||
			(curr_state == FSM_RD && port_cnt == 4'd8 && !port8_empty && queue_cnt < 8) || (curr_state == FSM_RD && port_cnt == 4'd9 && !port9_empty && queue_cnt < 8) ||
			(curr_state == FSM_RD && port_cnt == 4'd10 && !port10_empty && queue_cnt < 8) || (curr_state == FSM_RD && port_cnt == 4'd11 && !port11_empty && queue_cnt < 8) ||
			(curr_state == FSM_RD && port_cnt == 4'd12 && !port12_empty && queue_cnt < 8) || (curr_state == FSM_RD && port_cnt == 4'd13 && !port13_empty && queue_cnt < 8) ||
			(curr_state == FSM_RD && port_cnt == 4'd14 && !port14_empty && queue_cnt < 8) || (curr_state == FSM_RD && port_cnt == 4'd15 && !port15_empty && queue_cnt < 8))		
		queue_cnt <= queue_cnt + 4'd1;
	else if(curr_state == FSM_S0)
		queue_cnt <= queue_cnt - 4'd1;
	else 
		queue_cnt <= queue_cnt;
end	

//---------------port0_rd_en---------------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
		port0_rd_en	 <= 1'b0;
		port1_rd_en	 <= 1'b0;
		port2_rd_en	 <= 1'b0;
		port3_rd_en	 <= 1'b0;
		port4_rd_en	 <= 1'b0;
		port5_rd_en	 <= 1'b0;
		port6_rd_en	 <= 1'b0;
		port7_rd_en	 <= 1'b0;
		port8_rd_en	 <= 1'b0;
		port9_rd_en	 <= 1'b0;
		port10_rd_en <= 1'b0;
		port11_rd_en <= 1'b0;
		port12_rd_en <= 1'b0;
		port13_rd_en <= 1'b0;
		port14_rd_en <= 1'b0;
		port15_rd_en <= 1'b0;
	end
	else if(curr_state == FSM_RD && port_cnt == 4'd0 && !port0_empty && queue_cnt < 8)
		port0_rd_en	 <= 1'b1;	
	else if(curr_state == FSM_RD && port_cnt == 4'd1 && !port1_empty && queue_cnt < 8)
		port1_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd2 && !port2_empty && queue_cnt < 8)
		port2_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd3 && !port3_empty && queue_cnt < 8)
		port3_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd4 && !port4_empty && queue_cnt < 8)
		port4_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd5 && !port5_empty && queue_cnt < 8)
		port5_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd6 && !port6_empty && queue_cnt < 8)
		port6_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd7 && !port7_empty && queue_cnt < 8)
		port7_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd8 && !port8_empty && queue_cnt < 8)
		port8_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd9 && !port9_empty && queue_cnt < 8)
		port9_rd_en	 <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd10 && !port10_empty && queue_cnt < 8)
		port10_rd_en <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd11 && !port11_empty && queue_cnt < 8)
		port11_rd_en <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd12 && !port12_empty && queue_cnt < 8)
		port12_rd_en <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd13 && !port13_empty && queue_cnt < 8)
		port13_rd_en <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd14 && !port14_empty && queue_cnt < 8)
		port14_rd_en <= 1'b1;
	else if(curr_state == FSM_RD && port_cnt == 4'd15 && !port15_empty && queue_cnt < 8)
		port15_rd_en <= 1'b1;
	else
	begin
		port0_rd_en	 <= 1'b0;
		port1_rd_en	 <= 1'b0;
		port2_rd_en	 <= 1'b0;
		port3_rd_en	 <= 1'b0;
		port4_rd_en	 <= 1'b0;
		port5_rd_en	 <= 1'b0;
		port6_rd_en	 <= 1'b0;
		port7_rd_en	 <= 1'b0;
		port8_rd_en	 <= 1'b0;
		port9_rd_en	 <= 1'b0;
		port10_rd_en <= 1'b0;
		port11_rd_en <= 1'b0;
		port12_rd_en <= 1'b0;
		port13_rd_en <= 1'b0;
		port14_rd_en <= 1'b0;
		port15_rd_en <= 1'b0;	
	end
end	
//---------------port0_dout---------------------
reg  [255:0]	queue_info;//16个队列 16*32位

always @ (posedge sys_clk)
begin
	if(sys_rst)
		queue_info <= 256'd0;
	else if(curr_state == FSM_RD && port_cnt == 4'd0 && !port0_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port0_dout};	
	else if(curr_state == FSM_RD && port_cnt == 4'd1 && !port1_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port1_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd2 && !port2_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port2_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd3 && !port3_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port3_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd4 && !port4_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port4_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd5 && !port5_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port5_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd6 && !port6_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port6_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd7 && !port7_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port7_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd8 && !port8_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port8_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd9 && !port9_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port9_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd10 && !port10_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port10_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd11 && !port11_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port11_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd12 && !port12_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port12_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd13 && !port13_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port13_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd14 && !port14_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port14_dout};
	else if(curr_state == FSM_RD && port_cnt == 4'd15 && !port15_empty && queue_cnt < 8)
		queue_info <= {queue_info[223:0],port15_dout};
	else if(curr_state == FSM_S0)
		case(pri_cnt)
			4'd0:queue_info <= {32'd0,queue_info[255:32]};
			4'd1:queue_info <= {32'd0,queue_info[255:64],queue_info[31:0]};
			4'd2:queue_info <= {32'd0,queue_info[255:96],queue_info[63:0]};
			4'd3:queue_info <= {32'd0,queue_info[255:128],queue_info[95:0]};
			4'd4:queue_info <= {32'd0,queue_info[255:160],queue_info[127:0]};
			4'd5:queue_info <= {32'd0,queue_info[255:192],queue_info[159:0]};
			4'd6:queue_info <= {32'd0,queue_info[255:224],queue_info[191:0]};
			4'd7:queue_info <= {32'd0,queue_info[223:0]};
			default:queue_info <= queue_info;
		endcase
	else
		queue_info <= queue_info;		
end	

//----------------优先级排序--------------------
reg  [255:0]	queue_info_reg;
reg  [31:0]		pri_info_reg;
wire [31:0]		pri_info;
reg  [3:0]		pri_info_cnt;
wire [3:0]		pri_cnt;

wire  [11:0]	len;
wire  [7:0]		ram_len;
wire  [7:0]		len_reg;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		queue_info_reg <= queue_info;
	else if(curr_state == FSM_ARBI && arbi_cnt >= 4'd1)//原来：curr_state == FSM_ARBI
		queue_info_reg <= {32'd0,queue_info_reg[255:32]};//轮询移位
	else
		queue_info_reg <= queue_info;
end	

//找出最大优先级的包
always @ (posedge sys_clk)
begin
	if(sys_rst)
		pri_info_reg <= 32'd0;
	else if(curr_state == FSM_ARBI && arbi_cnt == 4'd0)
		pri_info_reg <= queue_info_reg[31:0];
	else if(curr_state == FSM_ARBI && arbi_cnt != 4'd0)
		if(queue_info_reg[3:0] > pri_info_reg[3:0])//依次优先级比较 冒泡排序法？
			pri_info_reg <= queue_info_reg[31:0];
		else if(queue_info_reg[3:0] <= pri_info_reg[3:0])
			pri_info_reg <= pri_info_reg;
		else;
	else;
end	

//最大优先级的包在队列中的位置   优化：两个合并
always @ (posedge sys_clk)
begin
	if(sys_rst)
		pri_info_cnt <= 3'd0;
	else if(curr_state == FSM_ARBI && arbi_cnt == 4'd0)
		pri_info_cnt <= arbi_cnt;
	else if(curr_state == FSM_ARBI && arbi_cnt != 4'd0)
		if(queue_info_reg[3:0] > pri_info_reg[3:0])
			pri_info_cnt <= arbi_cnt;
		else if(queue_info_reg[3:0] <= pri_info_reg[3:0])
			pri_info_cnt <= pri_info_cnt;
		else;
	else;
end

assign pri_info = (curr_state == FSM_S0) ? pri_info_reg : pri_info;
assign pri_cnt	= (curr_state == FSM_S0) ? pri_info_cnt : pri_cnt; 
assign rd_info_vld = (curr_state == FSM_S0) ? 1'b1 : 'd0; 
assign rd_info = pri_info[31:4]; //2'd0;[25:12]:addr_start;[11:0]:len

//-------------读取地址处理------------------------------------------------
wire [511:0] addr_use_r;
wire [8:0] addr_start_reg;

assign len = (curr_state == FSM_S0) ? pri_info[15:4] : len;
assign len_reg = len % 64;
assign ram_len = (len_reg > 0) ? len/64 + 1 : len/64; 

assign addr_start_reg = pri_info[24:16];

genvar i;
generate for ( i = 0 ; i < 512 ; i = i + 1 )	
	begin:xr
		assign addr_use_r[i] = (i >= addr_start_reg && i < addr_start_reg + ram_len) ? 1'b1 : 1'b0;//包所占用的地址块
	end
endgenerate

assign addr_use  = (curr_state == FSM_S2) ? {pri_info[29:25],addr_use_r} : addr_use;//读取地址
assign addr_done = (curr_state == FSM_S2) ? 1'b1 : 1'b0;

//----------------port_idle/queue_full-----------------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		port_idle <= 1'b0;
	else if(curr_state == FSM_IDLE)
		port_idle <= 1'b1;
	else
		port_idle <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		queue_full <= 1'b0;
	else if(queue_cnt == 4'd8)
		queue_full <= 1'b1;
	else
		queue_full <= 1'b0;
end	

//-----------请求修改内存-------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		req_addr <= 1'b0;
	else if(curr_state == FSM_S1)
		req_addr <= 1'b1;
	else
		req_addr <= 1'b0;
end		


endmodule
