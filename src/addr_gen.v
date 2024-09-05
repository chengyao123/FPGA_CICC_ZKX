`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/02 14:51:16
// Design Name: 
// Module Name: addr_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 数据包SG处理模块  以包为单位进行处理
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module addr_gen
#(
	parameter	PORT_NUM = 16
)
(
	input						sys_clk			,
	input						sys_rst			,

    //从wr_lead输入 数据信息与有效信号
    input 	  [19:0]			data_info		,//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    input 	  					data_info_vld	,    
	
    //从sram_ctrl输入 内存状态
	input	  [9*32-1:0]		sram_idle_cnt	,
	input	  [9*32-1:0]		sram_addr		,

    //目的端口空闲 直接给输出端口
    input	  [PORT_NUM-1:0]	port_idle		,//输出端口空闲信号
	output	reg					data_ren     	,//读使能 给wr_lead
	output	reg	[3:0]			data_ren_port 	,//数据读取端口
    output           			por_rd_sop      ,//端口输出开始、结束与有效信号
    output  reg      			por_rd_eop      ,
    output           			por_rd_vld      ,

	//给多路仲裁模块
	output	reg					req_addr		,//向mult_arbit请求地址
    input						req_done		,//仲裁模块给出 允许地址请求 
    output	wire				addr_done		,//地址分配完成 写入数据
	output	wire [516:0]		addr_use 		,//写入占用地址

	//给各端口队列模块
	output  reg					queue_info_vld0	,//输出有效信号
	output  reg					queue_info_vld1	,	
	output  reg					queue_info_vld2	,	
	output  reg					queue_info_vld3	,	
	output  reg					queue_info_vld4	,	
	output  reg					queue_info_vld5	,	
	output  reg					queue_info_vld6	,	
	output  reg					queue_info_vld7	,	
	output  reg					queue_info_vld8	,	
	output  reg					queue_info_vld9	,	
	output  reg					queue_info_vld10,	
	output  reg					queue_info_vld11,	
	output  reg					queue_info_vld12,	
	output  reg					queue_info_vld13,	
	output  reg					queue_info_vld14,	
	output  reg					queue_info_vld15,	
	output  reg	[31:0]			queue_info      //给队列模块的数据信息
);
	
wire [11:0]	len			;
wire [03:0]	pri			;
wire [03:0] dest_port	;
wire		empty		;
wire		full		;
reg			ren_done	;
reg			rd_en		;
wire [19:0]	info_dout	;

data_fifo u_data_fifo (
  .clk		(sys_clk		),    // input wire clk
  .srst		(sys_rst		),    // input wire srst
  .din		(data_info		),    // input wire [19 : 0] din
  .wr_en	(data_info_vld	),    // input wire wr_en
  .rd_en	(rd_en			),    // input wire rd_en
  .dout		(info_dout		),    // output wire [19 : 0] dout
  .full		(full			),    // output wire full
  .empty	(empty			)     // output wire empty
);

parameter FSM_IDLE = 7'b0000001;
parameter FSM_S0   = 7'b0000010;
parameter FSM_S1   = 7'b0000100;
parameter FSM_S2   = 7'b0001000;
parameter FSM_S3   = 7'b0010000;
parameter FSM_S4   = 7'b0100000;
parameter FSM_S5   = 7'b1000000;

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
				if(!empty)
					next_state = FSM_S0;//读一个fifo
				else
					next_state = FSM_IDLE;
			end
			FSM_S0:
			begin
				next_state = FSM_S1;
			end			
			FSM_S1:
			begin
				if(port_idle[dest_port] == 1'b1)//目的端口空闲
					next_state = FSM_S2;
				else
					next_state = FSM_S3;
			end
			FSM_S2:
			begin
				if(ren_done)//读缓存fifo完成信号
					next_state = FSM_IDLE;
				else
					next_state = FSM_S2;
			end
			FSM_S3:
			begin
				next_state = FSM_S4;
			end				
			FSM_S4:
			begin
				if(req_done)//可以占用并修改内存空间
					next_state = FSM_S5;
				else
					next_state = FSM_S4;
			end			
			FSM_S5:
			begin
				next_state = FSM_IDLE;
			end				
			default: next_state = FSM_IDLE;
		endcase			
end	 

assign len       = (curr_state == FSM_S1) ? info_dout[19:8] : len;
assign pri       = (curr_state == FSM_S1) ? info_dout[7:4]  : pri;
assign dest_port = (curr_state == FSM_S1) ? info_dout[3:0]  : dest_port;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		rd_en <= 1'b0;
	else if(curr_state == FSM_S0)
		rd_en <= 1'b1;
	else
		rd_en <= 1'b0;
end	

reg	 [11:0]	fsm_s2_cnt;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		data_ren <= 1'b0;
	else if(curr_state == FSM_S2)
		data_ren <= 1'b1;
	else
		data_ren <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		data_ren_port <= 4'b0;
	else if(curr_state == FSM_S2)
		data_ren_port <= dest_port;
	else
		data_ren_port <= 4'b0;
end

always @ (posedge sys_clk)
begin
	if(sys_rst)
		fsm_s2_cnt <= 12'd0;
	else if(curr_state == FSM_S2)
		fsm_s2_cnt <= fsm_s2_cnt + 1'b1;
	else if(curr_state == FSM_IDLE)
		fsm_s2_cnt <= 12'd0;
	else
		fsm_s2_cnt <= fsm_s2_cnt;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		ren_done <= 1'b0;
	else if(fsm_s2_cnt == len - 2)
		ren_done <= 1'b1;
	else
		ren_done <= 1'b0;	
end	
//-----------请求修改内存-------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		req_addr <= 1'b0;
	else if(curr_state == FSM_S4)
		req_addr <= 1'b1;
	else
		req_addr <= 1'b0;
end		
//-----------查看内存占用情况并修改内存-------------	
wire  [7:0]		ram_len;
wire  [7:0]		len_reg;
reg	  [13:0]	addr_start;//{5+9}


assign len_reg = len % 64;
assign ram_len = (len_reg > 0) ? len/64 + 1 : len/64;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		addr_start <= 14'd0;
	else if(curr_state == FSM_S4 && req_done)
		if(sram_idle_cnt[8:0] >= ram_len)
			addr_start <= {5'd0,sram_addr[8:0]};
		else if(sram_idle_cnt[2*9-1:9] >= ram_len)
			addr_start <= {5'd1,sram_addr[2*9-1:9]};		
		else if(sram_idle_cnt[3*9-1:2*9] >= ram_len)
			addr_start <= {5'd2,sram_addr[3*9-1:2*9]};
		else if(sram_idle_cnt[4*9-1:3*9] >= ram_len)
			addr_start <= {5'd3,sram_addr[4*9-1:3*9]};
		else if(sram_idle_cnt[5*9-1:4*9] >= ram_len)
			addr_start <= {5'd4,sram_addr[5*9-1:4*9]};
		else if(sram_idle_cnt[6*9-1:5*9] >= ram_len)
			addr_start <= {5'd5,sram_addr[6*9-1:5*9]};
		else if(sram_idle_cnt[7*9-1:6*9] >= ram_len)
			addr_start <= {5'd6,sram_addr[7*9-1:6*9]};
		else if(sram_idle_cnt[8*9-1:7*9] >= ram_len)
			addr_start <= {5'd7,sram_addr[8*9-1:7*9]};
		else if(sram_idle_cnt[9*9-1:8*9] >= ram_len)
			addr_start <= {5'd8,sram_addr[9*9-1:8*9]};
		else if(sram_idle_cnt[10*9-1:9*9] >= ram_len)
			addr_start <= {5'd9,sram_addr[10*9-1:9*9]};
		else if(sram_idle_cnt[11*9-1:10*9] >= ram_len)
			addr_start <= {5'd10,sram_addr[11*9-1:10*9]};
		else if(sram_idle_cnt[12*9-1:11*9] >= ram_len)
			addr_start <= {5'd11,sram_addr[12*9-1:11*9]};		
		else if(sram_idle_cnt[13*9-1:12*9] >= ram_len)
			addr_start <= {5'd12,sram_addr[13*9-1:12*9]};		
		else if(sram_idle_cnt[14*9-1:13*9] >= ram_len)
			addr_start <= {5'd13,sram_addr[14*9-1:13*9]};		
		else if(sram_idle_cnt[15*9-1:14*9] >= ram_len)
			addr_start <= {5'd14,sram_addr[15*9-1:14*9]};		
		else if(sram_idle_cnt[16*9-1:15*9] >= ram_len)
			addr_start <= {5'd15,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[17*9-1:16*9] >= ram_len)
			addr_start <= {5'd16,sram_addr[15*9-1:14*9]};		
		else if(sram_idle_cnt[18*9-1:17*9] >= ram_len)
			addr_start <= {5'd17,sram_addr[15*9-1:14*9]};		
		else if(sram_idle_cnt[19*9-1:18*9] >= ram_len)
			addr_start <= {5'd18,sram_addr[15*9-1:14*9]};		
		else if(sram_idle_cnt[20*9-1:19*9] >= ram_len)
			addr_start <= {5'd19,sram_addr[15*9-1:14*9]};		
		else if(sram_idle_cnt[21*9-1:20*9] >= ram_len)
			addr_start <= {5'd20,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[22*9-1:21*9] >= ram_len)
			addr_start <= {5'd21,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[23*9-1:22*9] >= ram_len)
			addr_start <= {5'd22,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[24*9-1:23*9] >= ram_len)
			addr_start <= {5'd23,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[25*9-1:24*9] >= ram_len)
			addr_start <= {5'd24,sram_addr[15*9-1:14*9]};		
		else if(sram_idle_cnt[26*9-1:25*9] >= ram_len)
			addr_start <= {5'd25,sram_addr[15*9-1:14*9]};		
		else if(sram_idle_cnt[27*9-1:26*9] >= ram_len)
			addr_start <= {5'd26,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[28*9-1:27*9] >= ram_len)
			addr_start <= {5'd27,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[29*9-1:28*9] >= ram_len)
			addr_start <= {5'd28,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[30*9-1:29*9] >= ram_len)
			addr_start <= {5'd29,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[31*9-1:30*9] >= ram_len)
			addr_start <= {5'd30,sram_addr[15*9-1:14*9]};	
		else if(sram_idle_cnt[32*9-1:31*9] >= ram_len)
			addr_start <= {5'd31,sram_addr[15*9-1:14*9]};
		else
			addr_start <= addr_start;	// ?
	else
		addr_start <= addr_start;	
end	

//-----------内存占用-------------	
wire [511:0] addr_use_r;
wire [8:0] 	 addr_start_reg;

assign addr_start_reg = addr_start[8:0];

assign addr_done = (curr_state == FSM_S5) ? 1'b1 : 1'b0;

genvar i;
generate for ( i = 0 ; i < 512 ; i = i + 1 )	
	begin:xr
		assign addr_use_r[i] = (i >= addr_start_reg && i < addr_start_reg + ram_len) ? 1'b1 : 1'b0;
	end
endgenerate

assign addr_use  = (curr_state == FSM_S5) ? {addr_start[13:9],addr_use_r} : addr_use;

//-----------output-------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
        queue_info_vld0	 <= 1'b0 ;
        queue_info_vld1	 <= 1'b0 ;
        queue_info_vld2	 <= 1'b0 ;
        queue_info_vld3	 <= 1'b0 ;
        queue_info_vld4	 <= 1'b0 ;
        queue_info_vld5	 <= 1'b0 ;
        queue_info_vld6	 <= 1'b0 ;
        queue_info_vld7	 <= 1'b0 ;
        queue_info_vld8	 <= 1'b0 ;
        queue_info_vld9	 <= 1'b0 ;
        queue_info_vld10 <= 1'b0 ;
        queue_info_vld11 <= 1'b0 ;
        queue_info_vld12 <= 1'b0 ;
        queue_info_vld13 <= 1'b0 ;
        queue_info_vld14 <= 1'b0 ;
        queue_info_vld15 <= 1'b0 ;
	end
	else if(addr_done)
	begin
		case(dest_port)
			4'd0 : queue_info_vld0	<= 1'd1;
			4'd1 : queue_info_vld1	<= 1'd1;
			4'd2 : queue_info_vld2	<= 1'd1;
			4'd3 : queue_info_vld3	<= 1'd1;
			4'd4 : queue_info_vld4	<= 1'd1;
			4'd5 : queue_info_vld5	<= 1'd1;
			4'd6 : queue_info_vld6	<= 1'd1;
			4'd7 : queue_info_vld7	<= 1'd1;
			4'd8 : queue_info_vld8	<= 1'd1;
			4'd9 : queue_info_vld9	<= 1'd1;
			4'd10: queue_info_vld10  <= 1'd1;
			4'd11: queue_info_vld11  <= 1'd1;
			4'd12: queue_info_vld12  <= 1'd1;
			4'd13: queue_info_vld13  <= 1'd1;
			4'd14: queue_info_vld14  <= 1'd1;
			4'd15: queue_info_vld15  <= 1'd1;
			default:
			begin
                queue_info_vld0	 <= queue_info_vld0	;
                queue_info_vld1	 <= queue_info_vld1	;
                queue_info_vld2	 <= queue_info_vld2	;
                queue_info_vld3	 <= queue_info_vld3	;
                queue_info_vld4	 <= queue_info_vld4	;
                queue_info_vld5	 <= queue_info_vld5	;
                queue_info_vld6	 <= queue_info_vld6	;
                queue_info_vld7	 <= queue_info_vld7	;
                queue_info_vld8	 <= queue_info_vld8	;
                queue_info_vld9	 <= queue_info_vld9	;
                queue_info_vld10 <= queue_info_vld10;
                queue_info_vld11 <= queue_info_vld11;
                queue_info_vld12 <= queue_info_vld12;
                queue_info_vld13 <= queue_info_vld13;
                queue_info_vld14 <= queue_info_vld14;
                queue_info_vld15 <= queue_info_vld15; 
			end
		endcase
	end
	else 
	begin
        queue_info_vld0	 <= 1'b0 ;
        queue_info_vld1	 <= 1'b0 ;
        queue_info_vld2	 <= 1'b0 ;
        queue_info_vld3	 <= 1'b0 ;
        queue_info_vld4	 <= 1'b0 ;
        queue_info_vld5	 <= 1'b0 ;
        queue_info_vld6	 <= 1'b0 ;
        queue_info_vld7	 <= 1'b0 ;
        queue_info_vld8	 <= 1'b0 ;
        queue_info_vld9	 <= 1'b0 ;
        queue_info_vld10 <= 1'b0 ;
        queue_info_vld11 <= 1'b0 ;
        queue_info_vld12 <= 1'b0 ;
        queue_info_vld13 <= 1'b0 ;
        queue_info_vld14 <= 1'b0 ;
        queue_info_vld15 <= 1'b0 ;
	end
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		queue_info <= 32'd0;
	else if(addr_done)
		queue_info <= {2'd0,addr_start,len,pri};	//queue_info[31:0], 2'd0;addr_start[29:16], len[15:4], pri[3:0]
	else 
		queue_info <= queue_info;
end	

assign por_rd_vld = data_ren;
assign por_rd_sop = (curr_state == FSM_S2 && fsm_s2_cnt == 12'd1) ? 1'b1 : 1'b0;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		por_rd_eop <= 1'b0;
	else if(ren_done)
		por_rd_eop <= 1'b1;
	else
		por_rd_eop <= 1'b0;	
end

endmodule
