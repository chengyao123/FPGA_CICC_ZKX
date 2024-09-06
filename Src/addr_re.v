`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/12 09:45:54
// Design Name: 
// Module Name: addr_re
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

//需优化
module addr_re(
    input			sys_clk			,
    input			sys_rst			,
	
	input			wr_start		, //写完成
	input			rd_start		, //读完成
	input	[511:0] wr_use			,
	input	[511:0] rd_use			,
	
	output	 		done			,
	output   [8:0]	sram_idle_cnt	, 
	output   [8:0]	sram_addr		

    );

reg  [511:0]	addr_use	;
reg  [511:0]	addr_use_shift	;
reg  [511:0]	addr_use_shift_r;
wire        	addr_use_shift_p;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		addr_use <= 512'd0;
	else if(wr_start == 1'b1)
		addr_use <= wr_use | addr_use; //地址使用
	else if(rd_start == 1'b1)
		addr_use <= rd_use ^ addr_use; //地址回收
	else
		addr_use <= addr_use;
end	

	
//--------------------------------------------
parameter FSM_IDLE 	  = 7'b0000001;
parameter FSM_STRAT   = 7'b0000010;
parameter FSM_SHFIT   = 7'b0000100;
parameter FSM_RE      = 7'b0001000;
parameter FSM_S1      = 7'b0010000;
parameter FSM_S2      = 7'b0100000;

reg		[6:0]	next_state	;
reg		[6:0]	curr_state	;

reg		[8:0]	cnt			;	
	
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
				if(wr_start || rd_start)
					next_state = FSM_STRAT;
				else
					next_state = FSM_IDLE;
			end	
			FSM_STRAT:
			begin
				next_state = FSM_SHFIT;
			end				
	        FSM_SHFIT:
			begin
				if(cnt == 9'd511)
					next_state = FSM_RE;
				else
					next_state = FSM_SHFIT;
			end	
			FSM_RE:
			begin
				next_state = FSM_IDLE;
			end	
			default:
			begin
				next_state = FSM_IDLE;
			end				
		endcase	
end	
	
always @ (posedge sys_clk)
begin
	if(sys_rst)
		cnt <= 9'd0;
	else if(curr_state == FSM_SHFIT)
		cnt <= cnt + 1'b1;
	else
		cnt <= 9'd0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		addr_use_shift <= 512'd0;
	else if(curr_state == FSM_STRAT) // 作用?
		addr_use_shift <= addr_use;
	else if(curr_state == FSM_SHFIT)
		addr_use_shift <= {1'b0,addr_use_shift[511:1]}; //高位 置0?
	else
		addr_use_shift <= addr_use_shift;
end	

//----------------------------------------------
reg [8:0]	sram_idle_cnt_r	; 
reg [8:0]	sram_addr_r		;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		sram_idle_cnt_r <= 9'd0;
	else if(curr_state == FSM_STRAT)
		sram_idle_cnt_r <= 9'd0;
	else 
		if(curr_state == FSM_SHFIT && addr_use_shift[0] == 1'b1)
			sram_idle_cnt_r <= sram_idle_cnt_r; // 原来：sram_idle_cnt_r <= 9'd0; 
		else if(curr_state == FSM_SHFIT && addr_use_shift[0] == 1'b0)
			sram_idle_cnt_r <= sram_idle_cnt_r + 1'b1;
		else;	 
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		addr_use_shift_r <= 512'd0;
	else
		addr_use_shift_r <= addr_use_shift;
end	

assign addr_use_shift_p = (!addr_use_shift[0] && addr_use_shift_r[0]) ? 1'b1 : 1'b0;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		sram_addr_r <= 9'd0;
	else if(curr_state == FSM_SHFIT && addr_use_shift_p == 1'b1) //需优化，不能隔空储存，不止一个addr_use_shift_p
		sram_addr_r <= cnt; //
	else
		sram_addr_r <= sram_addr_r;
end


assign done			 = (curr_state == FSM_RE) ? 1'b1 : 1'b0;
assign sram_idle_cnt = (curr_state == FSM_RE) ? sram_idle_cnt_r : sram_idle_cnt;
assign sram_addr     = (curr_state == FSM_RE) ? sram_addr_r : sram_addr;
	
endmodule
