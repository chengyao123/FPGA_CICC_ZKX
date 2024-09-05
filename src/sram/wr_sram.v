`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 22:58:09
// Design Name: 
// Module Name: wr_sram
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

module wr_sram 
#(
	parameter SRAM_INDEX = 0
)
(
    input			sys_clk				,
    input			sys_rst				,
//------------------wr-------------------------
	input			port_req_done		,//可以写地址			
	input  [33:0]	port_que_info		,	
	
	output reg		wr_fifo_ren0	    ,//16个fifo，选择哪个？
	input  [7:0]    wr_fifo_data0		,

	// output reg		wr_fifo_ren1	    ,//16个fifo，选择哪个？
	// input  [7:0]    wr_fifo_data1		,
	
	output	reg    	port_wr_done		,//写ram完成信号	
	output	     	port_wr_re			,//写端口ram更新完成信号	
//------------------rd-------------------------	
	input			rd_req_done			,//可以读地址	
    input	[25:0]	rd_info				,
	
	output	reg    	port_rd_done		,//duram完成信号	
	output	     	port_rd_re			,//du端口ram更新完成信号	
	
//-------------------------------------------	
	input	[511:0] wr_use				,
	input	[511:0] rd_use				,
	output  [8:0]	sram_idle_cnt		, 
	output  [8:0]	sram_addr			,
//--------------sram端口	
	output     	[14:0]	sram_addr_r		,
	inout	   	[7:0]	sram_data		,
	output             	sram_cs			, //低有效
	output              sram_oe			, //低有效
	output              sram_we			, //低有效
//--------------读端口	
	output	reg		port_rd_sop			,
	output	 		port_rd_eop			,
	output			port_rd_vld			,
	output	[7:0]	port_rd_data 		
);

// wire    [7:0] wr_fifo_data;
// assign wr_fifo_data = (port_que_info[33:30] == 4'd1) ? wr_fifo_data0 : (port_que_info[33:30] == 4'd2) ? wr_fifo_data1 : 8'd0; //目前就端口0和端口1 从wr_fifo写入sram
assign port_wr_re = (curr_state == FSM_RE) && re_done;
assign port_rd_re = (curr_state == FSM_RD_RE) && re_done;
	
//-------------------------------------
wire   [13:0]  	addr_start		;//[13:9]为SRAM索引
wire   [11:0]  	len				;
wire      		re_done			;
//wire      		wr_start		;
reg   [11:0] 	wr_cnt			;

reg 	[14:0]	wr_sram_addr	;
wire 	[7:0]	wr_sram_data	;
reg         	wr_sram_cs		;
reg          	wr_sram_oe		;
reg          	wr_sram_we		;
	
assign addr_start = (port_req_done) ? port_que_info[29:16] : addr_start;
assign len        = (port_req_done) ? port_que_info[15:4] : len;

//-------------------------------------
wire   [13:0]  	rd_addr_start	;
wire   [11:0]  	rd_len			;
wire      		rd_re_done		;
wire      		rd_start		;
reg    [11:0] 	rd_cnt			;

reg    [14:0]	rd_sram_addr	;
//wire   [7:0]	rd_sram_data	;
reg         	rd_sram_cs		;
reg          	rd_sram_oe		;
reg          	rd_sram_we		;

assign rd_addr_start = (rd_req_done) ? rd_info[25:12] : rd_addr_start;
assign rd_len        = (rd_req_done) ? rd_info[11:0] : rd_len;

parameter FSM_IDLE      = 7'd1;
parameter FSM_INFO      = 7'd2;
parameter FSM_WR        = 7'd3;
parameter FSM_WR_DONE   = 7'd4;
parameter FSM_RE        = 7'd5;
parameter FSM_RE_DONE   = 7'd6;

parameter FSM_RD_INFO   = 7'd7;
parameter FSM_RD        = 7'd8;
parameter FSM_RD_DONE   = 7'd9;
parameter FSM_RD_RE     = 7'd10;
parameter FSM_RD_RE_DONE= 7'd11;

reg		[6:0]	next_state;
reg		[6:0]	curr_state;

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
				if(port_req_done)
					next_state = FSM_INFO;
				else if(rd_req_done)
					next_state = FSM_RD_INFO;
				else
					next_state = FSM_IDLE;
			end
			FSM_INFO :
			begin
				if(addr_start[13:9] == SRAM_INDEX)
					next_state = FSM_WR;
				else
					next_state = FSM_IDLE;
			end			
			FSM_WR:
			begin
				if(wr_cnt == len - 1)
					next_state = FSM_WR_DONE;
				else
					next_state = FSM_WR;
			end			
			FSM_WR_DONE :
			begin
				next_state = FSM_RE;
			end	
			FSM_RE:
			begin
				if(re_done == 1'b1)
					next_state = FSM_RE_DONE;
				else
					next_state = FSM_RE;
			end				
			FSM_RE_DONE:
			begin
				next_state = FSM_IDLE;
			end

			FSM_RD_INFO :
			begin
				if(rd_addr_start[13:9] == SRAM_INDEX)
					next_state = FSM_RD;
				else
					next_state = FSM_IDLE;
			end			
			FSM_RD:
			begin
				if(rd_cnt == rd_len - 1)
					next_state = FSM_RD_DONE;
				else
					next_state = FSM_RD;
			end			
			FSM_RD_DONE :
			begin
				next_state = FSM_RD_RE;
			end	
			FSM_RD_RE:
			begin
				if(re_done == 1'b1)
					next_state = FSM_RD_RE_DONE;
				else
					next_state = FSM_RD_RE;
			end				
			FSM_RD_RE_DONE:
			begin
				next_state = FSM_IDLE;
			end
			default:
			begin
				next_state = FSM_IDLE;
			end				
		endcase
end
//-----------------wr--------------------------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		wr_cnt <= 12'd0;
	else if(curr_state == FSM_WR)
		wr_cnt <= wr_cnt + 12'd1;
	else
		wr_cnt <= 12'd0;
end	

//端口数据写入
always @ (posedge sys_clk)
begin
	if(sys_rst)
		wr_fifo_ren0 <= 1'd0;
	else if(curr_state == FSM_WR)
		wr_fifo_ren0 <= 1'b1;
	else
		wr_fifo_ren0 <= 1'd0;
end	

//端口2写入
// always @ (posedge sys_clk)
// begin
// 	if(sys_rst)
// 		wr_fifo_ren1 = 1'd0;
// 	else if(curr_state == FSM_WR && port_que_info[33:30] == 4'd2)
// 		wr_fifo_ren1 = 1'b1;
// 	else
// 		wr_fifo_ren1 = 1'd0;
// end	

always @ (*)
begin
	if(sys_rst)
		wr_sram_addr = 15'd0;
	else if(curr_state == FSM_WR && wr_cnt == 12'd1)
		wr_sram_addr = addr_start * 64;
	else if(curr_state == FSM_WR || curr_state == 4) // curr_state == FSM_WR_DONE?
		wr_sram_addr = wr_sram_addr + 1'b1;
	else
		wr_sram_addr = 15'd0;
end	

assign wr_sram_data = wr_fifo_data0;

always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
		wr_sram_cs <= 1'b1;
		wr_sram_oe <= 1'b1;
		wr_sram_we <= 1'b1;	
	end
	else if(curr_state == FSM_WR)
	begin
		wr_sram_cs <= 1'b0;
		wr_sram_oe <= 1'b1;
		wr_sram_we <= 1'b0;	
	end
	else
	begin
		wr_sram_cs <= 1'b1;
		wr_sram_oe <= 1'b1;
		wr_sram_we <= 1'b1;	
	end
end	

//---------------rd----------------------------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		rd_cnt <= 12'd0;
	else if(curr_state == FSM_RD)
		rd_cnt <= rd_cnt + 12'd1;
	else
		rd_cnt <= 12'd0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		rd_sram_addr <= 15'd0;
	else if(curr_state == FSM_RD && rd_cnt == 12'd0)
		rd_sram_addr <= rd_addr_start * 64;
	else if(curr_state == FSM_RD)
		rd_sram_addr <= rd_sram_addr + 1'b1;
	else
		rd_sram_addr <= 15'd0;
end	

//assign rd_sram_data = sram_data;

always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
		rd_sram_cs <= 1'b1;
		rd_sram_oe <= 1'b1;
		rd_sram_we <= 1'b1;	
	end
	else if(curr_state == FSM_RD)
	begin
		rd_sram_cs <= 1'b0;
		rd_sram_oe <= 1'b0;
		rd_sram_we <= 1'b1;	
	end
	else
	begin
		rd_sram_cs <= 1'b1;
		rd_sram_oe <= 1'b1;
		rd_sram_we <= 1'b1;	
	end
end	

//读写控制
assign sram_addr_r = (curr_state == FSM_INFO || curr_state == FSM_WR || curr_state == FSM_WR_DONE || curr_state == FSM_RE || curr_state == FSM_RE_DONE) ? wr_sram_addr : rd_sram_addr;
assign sram_cs   = (curr_state == FSM_INFO || curr_state == FSM_WR || curr_state == FSM_WR_DONE || curr_state == FSM_RE || curr_state == FSM_RE_DONE) ?     wr_sram_cs : rd_sram_cs;
assign sram_oe   = (curr_state == FSM_INFO || curr_state == FSM_WR || curr_state == FSM_WR_DONE || curr_state == FSM_RE || curr_state == FSM_RE_DONE) ?     wr_sram_oe : rd_sram_oe;
assign sram_we   = (curr_state == FSM_INFO || curr_state == FSM_WR || curr_state == FSM_WR_DONE || curr_state == FSM_RE || curr_state == FSM_RE_DONE) ?     wr_sram_we : rd_sram_we;
assign sram_data = (curr_state == FSM_INFO || curr_state == FSM_WR || curr_state == FSM_WR_DONE || curr_state == FSM_RE || curr_state == FSM_RE_DONE) ?     wr_sram_data : 8'dz;

//-------------------------------------------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		port_wr_done <= 1'b0;
	else if(curr_state == FSM_WR_DONE)
		port_wr_done <= 1'b1;
	else
		port_wr_done <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port_rd_done <= 1'b0;
	else if(curr_state == FSM_RD_DONE)
		port_rd_done <= 1'b1;
	else
		port_rd_done <= 1'b0;
end	

addr_re u_addr_re(
    .sys_clk			(sys_clk		),
    .sys_rst			(sys_rst		),
    .wr_start			(port_wr_done   ),
    .rd_start			(port_rd_done	),
    .wr_use				(wr_use			),
    .rd_use				(rd_use			),
	
    .done				(re_done		),
    .sram_idle_cnt		(sram_idle_cnt	), 
    .sram_addr			(sram_addr		)
);	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port_rd_sop <= 1'd0;
	else if(curr_state == FSM_RD && rd_cnt == 12'd0)
		port_rd_sop <= 1'd1;
	else
		port_rd_sop <= 1'd0;
end	

assign port_rd_vld = ~sram_oe;

assign port_rd_eop = (curr_state == 9) ? 1'b1 : 1'b0; // curr_state = FSM_RD_DONE
assign port_rd_data = sram_data;

endmodule
