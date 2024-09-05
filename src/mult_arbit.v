`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/30 22:48:55
// Design Name: 
// Module Name: mult_arbit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 根据当前状态，将读或写的info，给32个sram  case语句
// 输出一个端口读写flag,即在当前只对某一端口进行读或写操作
// 不管哪个sram的读写都只对该端口有效
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mult_arbit
(
    input			sys_clk				,
    input			sys_rst				,
	
    //读写地址请求信号
	input	[15:0]	wr_req_addr			,//输入端口请求写地址	从数据处理模块输入
	input	[15:0]	rd_req_addr			,//输出端口请求读地址	从读出队列模块输入	
	input	     	port_wr_re			,//输入端口ram更新完成信号 从sram控制模块输入
	input	     	port_rd_re			,//输出端口ram更新完成信号 从sram控制模块输入

    //16个输入端口数据信息
    input   [31:0]  port0_que_info		,//2'd0;[29:16]:addr_start;[15:4]:len;[3:0]:pri
    input   [31:0]  port1_que_info		,
    input   [31:0]  port2_que_info		,
    input   [31:0]  port3_que_info		,
    input   [31:0]  port4_que_info		,
    input   [31:0]  port5_que_info		,
    input   [31:0]  port6_que_info		,
    input   [31:0]  port7_que_info		,
    input   [31:0]  port8_que_info		,
    input   [31:0]  port9_que_info		,
    input   [31:0]  port10_que_info		,
    input   [31:0]  port11_que_info		,
    input   [31:0]  port12_que_info		,
    input   [31:0]  port13_que_info		,
    input   [31:0]  port14_que_info		,
    input   [31:0]  port15_que_info		,
	
    //16个输出端口读取数据信息
    input   [27:0]  port0_rd_info		,
    input   [27:0]  port1_rd_info		,
    input   [27:0]  port2_rd_info		,
    input   [27:0]  port3_rd_info		,
    input   [27:0]  port4_rd_info		,
    input   [27:0]  port5_rd_info		,
    input   [27:0]  port6_rd_info		,
    input   [27:0]  port7_rd_info		,
    input   [27:0]  port8_rd_info		,
    input   [27:0]  port9_rd_info		,
    input   [27:0]  port10_rd_info		,
    input   [27:0]  port11_rd_info		,
    input   [27:0]  port12_rd_info		,
    input   [27:0]  port13_rd_info		,
    input   [27:0]  port14_rd_info		,
    input   [27:0]  port15_rd_info		,

    //输入端口允许请求 写地址
	output			port0_req_done		,//可以写地址	
	output			port1_req_done		,	
	output			port2_req_done		,	
	output			port3_req_done		,	
	output			port4_req_done		,	
	output			port5_req_done		,	
	output			port6_req_done		,	
	output			port7_req_done		,	
	output			port8_req_done		,	
	output			port9_req_done		,	
	output			port10_req_done		,
	output			port11_req_done		,
	output			port12_req_done		,
	output			port13_req_done		,
	output			port14_req_done		,
	output			port15_req_done		,
	
    //输出端口允许请求 读地址
	output			rd0_req_done		,//可以读地址	
	output			rd1_req_done		,	
	output			rd2_req_done		,	
	output			rd3_req_done		,	
	output			rd4_req_done		,	
	output			rd5_req_done		,	
	output			rd6_req_done		,	
	output			rd7_req_done		,	
	output			rd8_req_done		,	
	output			rd9_req_done		,	
	output			rd10_req_done	    ,	
	output			rd11_req_done	    ,	
	output			rd12_req_done	    ,	
	output			rd13_req_done	    ,	
	output			rd14_req_done	    ,	
	output			rd15_req_done	    ,

   //写入仲裁与读出仲裁结果 给sram_ctrl
   output  reg [33:0]  port_que_info	,//[33:30]:port;[29:16]:addr_start;[15:4]:len;[3:0]:pri
   output  reg [27:0]  port_rd_info		,

   output  reg [4:0]   ctrl_flag		 //[4]读写标识   [3:0]端口标识
);

//--------------------------------------------
parameter FSM_IDLE  = 8'd1;

parameter FSM_SW0   = 8'd2 ,FSM_SW1   = 8'd3, FSM_SW2   = 8'd4, FSM_SW3   = 8'd5,
          FSM_SW4   = 8'd6 ,FSM_SW5   = 8'd7, FSM_SW6   = 8'd8, FSM_SW7   = 8'd9,
		  FSM_SW8   = 8'd10,FSM_SW9   = 8'd11,FSM_SW10  = 8'd12,FSM_SW11  = 8'd13,
		  FSM_SW12  = 8'd14,FSM_SW13  = 8'd15,FSM_SW14  = 8'd16,FSM_SW15  = 8'd17; 

parameter FSM_SR0   = 8'd18,FSM_SR1   = 8'd19,FSM_SR2   = 8'd20,FSM_SR3   = 8'd21,
          FSM_SR4   = 8'd22,FSM_SR5   = 8'd23,FSM_SR6   = 8'd24,FSM_SR7   = 8'd25,
          FSM_SR8   = 8'd26,FSM_SR9   = 8'd27,FSM_SR10  = 8'd28,FSM_SR11  = 8'd29,
          FSM_SR12  = 8'd30,FSM_SR13  = 8'd31,FSM_SR14  = 8'd32,FSM_SR15  = 8'd33;

parameter FSM_SW0_INFO   = 8'd34 ,FSM_SW1_INFO   = 8'd35, FSM_SW2_INFO   = 8'd36, FSM_SW3_INFO   = 8'd37,
          FSM_SW4_INFO   = 8'd38 ,FSM_SW5_INFO   = 8'd39, FSM_SW6_INFO   = 8'd40, FSM_SW7_INFO   = 8'd41,
		  FSM_SW8_INFO   = 8'd42 ,FSM_SW9_INFO   = 8'd43, FSM_SW10_INFO  = 8'd44, FSM_SW11_INFO  = 8'd45,
		  FSM_SW12_INFO  = 8'd46 ,FSM_SW13_INFO  = 8'd47, FSM_SW14_INFO  = 8'd48, FSM_SW15_INFO  = 8'd49;

parameter FSM_SR0_INFO   = 8'd50 ,FSM_SR1_INFO   = 8'd51, FSM_SR2_INFO   = 8'd52, FSM_SR3_INFO   = 8'd53,
          FSM_SR4_INFO   = 8'd54 ,FSM_SR5_INFO   = 8'd55, FSM_SR6_INFO   = 8'd56, FSM_SR7_INFO   = 8'd57,
		  FSM_SR8_INFO   = 8'd58 ,FSM_SR9_INFO   = 8'd59, FSM_SR10_INFO  = 8'd60, FSM_SR11_INFO  = 8'd61,
		  FSM_SR12_INFO  = 8'd62 ,FSM_SR13_INFO  = 8'd63, FSM_SR14_INFO  = 8'd64, FSM_SR15_INFO  = 8'd65;

parameter FSM_SW0_RE   = 8'd98 ,FSM_SW1_RE   = 8'd99, FSM_SW2_RE   = 8'd100, FSM_SW3_RE   = 8'd101,
          FSM_SW4_RE   = 8'd102,FSM_SW5_RE   = 8'd103,FSM_SW6_RE   = 8'd104, FSM_SW7_RE   = 8'd105,
		  FSM_SW8_RE   = 8'd106,FSM_SW9_RE   = 8'd107,FSM_SW10_RE  = 8'd108, FSM_SW11_RE  = 8'd109,
		  FSM_SW12_RE  = 8'd110,FSM_SW13_RE  = 8'd111,FSM_SW14_RE  = 8'd112, FSM_SW15_RE  = 8'd113;
           
parameter FSM_SR0_RE   = 8'd114,FSM_SR1_RE   = 8'd115,FSM_SR2_RE   = 8'd116, FSM_SR3_RE   = 8'd117,
          FSM_SR4_RE   = 8'd118,FSM_SR5_RE   = 8'd119,FSM_SR6_RE   = 8'd120, FSM_SR7_RE   = 8'd121,
		  FSM_SR8_RE   = 8'd122,FSM_SR9_RE   = 8'd123,FSM_SR10_RE  = 8'd124, FSM_SR11_RE  = 8'd125,
		  FSM_SR12_RE  = 8'd126,FSM_SR13_RE  = 8'd127,FSM_SR14_RE  = 8'd128, FSM_SR15_RE  = 8'd129; 		  

reg		[7:0]	next_state	;
reg		[7:0]	curr_state	;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		curr_state <= FSM_IDLE;
	else
		curr_state <= next_state;
end	
//16个端口读写轮询状态机
always @ (*)
begin
	if(sys_rst)
		next_state = FSM_IDLE;
	else
		case(curr_state)
			FSM_IDLE:
			begin
				next_state = FSM_SW0;
			end
			FSM_SW0:
			begin
				if(wr_req_addr[0] == 1'b1)
					next_state = FSM_SW0_INFO;
				else
					next_state = FSM_SW1;	
			end
			FSM_SW0_INFO://锁存info
			begin
				next_state = FSM_SW0_RE;
			end
			FSM_SW0_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW1;
				else
					next_state = FSM_SW0_RE;				
			end

			FSM_SW1:
			begin
				if(wr_req_addr[1] == 1'b1)
					next_state = FSM_SW1_INFO;
				else
					next_state = FSM_SW2;	
			end
			FSM_SW1_INFO://锁存info
			begin
				next_state = FSM_SW1_RE;
			end
			FSM_SW1_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW2;
				else
					next_state = FSM_SW1_RE;				
			end

			FSM_SW2:
			begin
				if(wr_req_addr[2] == 1'b1)
					next_state = FSM_SW2_INFO;
				else
					next_state = FSM_SW3;	
			end
			FSM_SW2_INFO://锁存info
			begin
				next_state = FSM_SW2_RE;
			end
			FSM_SW2_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW3;
				else
					next_state = FSM_SW2_RE;				
			end

			FSM_SW3:
			begin
				if(wr_req_addr[3] == 1'b1)
					next_state = FSM_SW3_INFO;
				else
					next_state = FSM_SW4;	
			end
			FSM_SW3_INFO://锁存info
			begin
				next_state = FSM_SW3_RE;
			end
			FSM_SW3_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW4;
				else
					next_state = FSM_SW3_RE;				
			end

			FSM_SW4:
			begin
				if(wr_req_addr[4] == 1'b1)
					next_state = FSM_SW4_INFO;
				else
					next_state = FSM_SW5;	
			end
			FSM_SW4_INFO://锁存info
			begin
				next_state = FSM_SW4_RE;
			end
			FSM_SW4_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW5;
				else
					next_state = FSM_SW4_RE;				
			end

			FSM_SW5:
			begin
				if(wr_req_addr[5] == 1'b1)
					next_state = FSM_SW5_INFO;
				else
					next_state = FSM_SW6;	
			end
			FSM_SW5_INFO://锁存info
			begin
				next_state = FSM_SW5_RE;
			end
			FSM_SW5_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW6;
				else
					next_state = FSM_SW5_RE;				
			end

			FSM_SW6:
			begin
				if(wr_req_addr[6] == 1'b1)
					next_state = FSM_SW6_INFO;
				else
					next_state = FSM_SW7;	
			end
			FSM_SW6_INFO://锁存info
			begin
				next_state = FSM_SW6_RE;
			end
			FSM_SW6_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW7;
				else
					next_state = FSM_SW6_RE;				
			end

			FSM_SW7:
			begin
				if(wr_req_addr[7] == 1'b1)
					next_state = FSM_SW7_INFO;
				else
					next_state = FSM_SW8;	
			end
			FSM_SW7_INFO://锁存info
			begin
				next_state = FSM_SW7_RE;
			end
			FSM_SW7_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW8;
				else
					next_state = FSM_SW7_RE;				
			end

			FSM_SW8:
			begin
				if(wr_req_addr[8] == 1'b1)
					next_state = FSM_SW8_INFO;
				else
					next_state = FSM_SW9;	
			end
			FSM_SW8_INFO://锁存info
			begin
				next_state = FSM_SW8_RE;
			end
			FSM_SW8_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW9;
				else
					next_state = FSM_SW8_RE;				
			end

			FSM_SW9:
			begin
				if(wr_req_addr[9] == 1'b1)
					next_state = FSM_SW9_INFO;
				else
					next_state = FSM_SW10;	
			end
			FSM_SW9_INFO://锁存info
			begin
				next_state = FSM_SW9_RE;
			end
			FSM_SW9_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW10;
				else
					next_state = FSM_SW9_RE;				
			end

			FSM_SW10:
			begin
				if(wr_req_addr[10] == 1'b1)
					next_state = FSM_SW10_INFO;
				else
					next_state = FSM_SW11;	
			end
			FSM_SW10_INFO://锁存info
			begin
				next_state = FSM_SW10_RE;
			end
			FSM_SW10_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW11;
				else
					next_state = FSM_SW10_RE;				
			end

			FSM_SW11:
			begin
				if(wr_req_addr[11] == 1'b1)
					next_state = FSM_SW11_INFO;
				else
					next_state = FSM_SW12;	
			end
			FSM_SW11_INFO://锁存info
			begin
				next_state = FSM_SW11_RE;
			end
			FSM_SW11_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW12;
				else
					next_state = FSM_SW11_RE;				
			end

			FSM_SW12:
			begin
				if(wr_req_addr[12] == 1'b1)
					next_state = FSM_SW12_INFO;
				else
					next_state = FSM_SW13;	
			end
			FSM_SW12_INFO://锁存info
			begin
				next_state = FSM_SW12_RE;
			end
			FSM_SW12_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW13;
				else
					next_state = FSM_SW12_RE;				
			end

			FSM_SW13:
			begin
				if(wr_req_addr[13] == 1'b1)
					next_state = FSM_SW13_INFO;
				else
					next_state = FSM_SW14;	
			end
			FSM_SW13_INFO://锁存info
			begin
				next_state = FSM_SW13_RE;
			end
			FSM_SW13_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW14;
				else
					next_state = FSM_SW13_RE;				
			end

			FSM_SW14:
			begin
				if(wr_req_addr[14] == 1'b1)
					next_state = FSM_SW14_INFO;
				else
					next_state = FSM_SW15;	
			end
			FSM_SW14_INFO://锁存info
			begin
				next_state = FSM_SW14_RE;
			end
			FSM_SW14_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SW15;
				else
					next_state = FSM_SW14_RE;				
			end

			FSM_SW15:
			begin
				if(wr_req_addr[15] == 1'b1)
					next_state = FSM_SW15_INFO;
				else
					next_state = FSM_SR0;	
			end
			FSM_SW15_INFO://锁存info
			begin
				next_state = FSM_SW15_RE;
			end
			FSM_SW15_RE:
			begin
				if(port_wr_re == 1'b1)
					next_state = FSM_SR0;
				else
					next_state = FSM_SW15_RE;				
			end
			
			FSM_SR0:
			begin
				if(rd_req_addr[0] == 1'b1)
					next_state = FSM_SR0_INFO;
				else
					next_state = FSM_SR1;	
			end
			FSM_SR0_INFO://锁存info
			begin
				next_state = FSM_SR0_RE;
			end
			FSM_SR0_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR1;
				else
					next_state = FSM_SR0_RE;				
			end	
	
			FSM_SR1:
			begin
				if(rd_req_addr[1] == 1'b1)
					next_state = FSM_SR1_INFO;
				else
					next_state = FSM_SR2;	
			end
			FSM_SR1_INFO://锁存info
			begin
				next_state = FSM_SR1_RE;
			end
			FSM_SR1_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR2;
				else
					next_state = FSM_SR1_RE;				
			end		
	
			FSM_SR2:
			begin
				if(rd_req_addr[2] == 1'b1)
					next_state = FSM_SR2_INFO;
				else
					next_state = FSM_SR3;	
			end
			FSM_SR2_INFO://锁存info
			begin
				next_state = FSM_SR2_RE;
			end
			FSM_SR2_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR3;
				else
					next_state = FSM_SR2_RE;				
			end		
	
			FSM_SR3:
			begin
				if(rd_req_addr[3] == 1'b1)
					next_state = FSM_SR3_INFO;
				else
					next_state = FSM_SR4;	
			end
			FSM_SR3_INFO://锁存info
			begin
				next_state = FSM_SR3_RE;
			end
			FSM_SR3_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR4;
				else
					next_state = FSM_SR3_RE;				
			end		

			FSM_SR4:
			begin
				if(rd_req_addr[4] == 1'b1)
					next_state = FSM_SR4_INFO;
				else
					next_state = FSM_SR5;	
			end
			FSM_SR4_INFO://锁存info
			begin
				next_state = FSM_SR4_RE;
			end
			FSM_SR4_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR5;
				else
					next_state = FSM_SR4_RE;				
			end		
	
			FSM_SR5:
			begin
				if(rd_req_addr[5] == 1'b1)
					next_state = FSM_SR5_INFO;
				else
					next_state = FSM_SR6;	
			end
			FSM_SR5_INFO://锁存info
			begin
				next_state = FSM_SR5_RE;
			end
			FSM_SR5_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR6;
				else
					next_state = FSM_SR5_RE;				
			end		

			FSM_SR6:
			begin
				if(rd_req_addr[6] == 1'b1)
					next_state = FSM_SR6_INFO;
				else
					next_state = FSM_SR7;	
			end
			FSM_SR6_INFO://锁存info
			begin
				next_state = FSM_SR6_RE;
			end
			FSM_SR6_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR7;
				else
					next_state = FSM_SR6_RE;				
			end		
	
			FSM_SR7:
			begin
				if(rd_req_addr[7] == 1'b1)
					next_state = FSM_SR7_INFO;
				else
					next_state = FSM_SR8;	
			end
			FSM_SR7_INFO://锁存info
			begin
				next_state = FSM_SR7_RE;
			end
			FSM_SR7_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR8;
				else
					next_state = FSM_SR7_RE; 				
			end		
	
			FSM_SR8:
			begin
				if(rd_req_addr[8] == 1'b1)
					next_state = FSM_SR8_INFO;
				else
					next_state = FSM_SR9;	
			end
			FSM_SR8_INFO://锁存info
			begin
				next_state = FSM_SR8_RE;
			end
			FSM_SR8_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR9;
				else
					next_state = FSM_SR8_RE;				
			end		
	
			FSM_SR9:
			begin
				if(rd_req_addr[9] == 1'b1)
					next_state = FSM_SR9_INFO;
				else
					next_state = FSM_SR10;	
			end
			FSM_SR9_INFO://锁存info
			begin
				next_state = FSM_SR9_RE;
			end
			FSM_SR9_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR10;
				else
					next_state = FSM_SR9_RE;				
			end		

			FSM_SR10:
			begin
				if(rd_req_addr[10] == 1'b1)
					next_state = FSM_SR10_INFO;
				else
					next_state = FSM_SR11;	
			end
			FSM_SR10_INFO://锁存info
			begin
				next_state = FSM_SR10_RE;
			end
			FSM_SR10_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR11;
				else
					next_state = FSM_SR10_RE;				
			end		

			FSM_SR11:
			begin
				if(rd_req_addr[11] == 1'b1)
					next_state = FSM_SR11_INFO;
				else
					next_state = FSM_SR12;	
			end
			FSM_SR11_INFO://锁存info
			begin
				next_state = FSM_SR11_RE;
			end
			FSM_SR11_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR12;
				else
					next_state = FSM_SR11_RE;				
			end		
	
			FSM_SR12:
			begin
				if(rd_req_addr[12] == 1'b1)
					next_state = FSM_SR12_INFO;
				else
					next_state = FSM_SR13;	
			end
			FSM_SR12_INFO://锁存info
			begin
				next_state = FSM_SR12_RE;
			end
			FSM_SR12_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR13;
				else
					next_state = FSM_SR12_RE;				
			end		

			FSM_SR13:
			begin
				if(rd_req_addr[13] == 1'b1)
					next_state = FSM_SR13_INFO;
				else
					next_state = FSM_SR14;	
			end
			FSM_SR13_INFO://锁存info
			begin
				next_state = FSM_SR13_RE;
			end
			FSM_SR13_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR14;
				else
					next_state = FSM_SR13_RE;				
			end		

			FSM_SR14:
			begin
				if(rd_req_addr[14] == 1'b1)
					next_state = FSM_SR14_INFO;
				else
					next_state = FSM_SR15;	
			end
			FSM_SR14_INFO://锁存info
			begin
				next_state = FSM_SR14_RE;
			end
			FSM_SR14_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SR15;
				else
					next_state = FSM_SR14_RE;				
			end		

			FSM_SR15:
			begin
				if(rd_req_addr[15] == 1'b1)
					next_state = FSM_SR15_INFO;
				else
					next_state = FSM_SW0;	
			end
			FSM_SR15_INFO://锁存info
			begin
				next_state = FSM_SR15_RE;
			end
			FSM_SR15_RE:
			begin
				if(port_rd_re == 1'b1)
					next_state = FSM_SW0;
				else
					next_state = FSM_SR15_RE;				
			end		
			default:
			begin
				next_state = FSM_IDLE;				
			end				
		endcase
end

//请求写地址	
assign port0_req_done  = (curr_state == FSM_SW0_RE) ? 1'b1 : 1'b0;	
assign port1_req_done  = (curr_state == FSM_SW1_RE) ? 1'b1 : 1'b0;	
assign port2_req_done  = (curr_state == FSM_SW2_RE) ? 1'b1 : 1'b0;	
assign port3_req_done  = (curr_state == FSM_SW3_RE) ? 1'b1 : 1'b0;	
assign port4_req_done  = (curr_state == FSM_SW4_RE) ? 1'b1 : 1'b0;	
assign port5_req_done  = (curr_state == FSM_SW5_RE) ? 1'b1 : 1'b0;	
assign port6_req_done  = (curr_state == FSM_SW6_RE) ? 1'b1 : 1'b0;	
assign port7_req_done  = (curr_state == FSM_SW7_RE) ? 1'b1 : 1'b0;	
assign port8_req_done  = (curr_state == FSM_SW8_RE) ? 1'b1 : 1'b0;	
assign port9_req_done  = (curr_state == FSM_SW9_RE) ? 1'b1 : 1'b0;	
assign port10_req_done = (curr_state == FSM_SW10_RE) ? 1'b1 : 1'b0;	
assign port11_req_done = (curr_state == FSM_SW11_RE) ? 1'b1 : 1'b0;	
assign port12_req_done = (curr_state == FSM_SW12_RE) ? 1'b1 : 1'b0;	
assign port13_req_done = (curr_state == FSM_SW13_RE) ? 1'b1 : 1'b0;	
assign port14_req_done = (curr_state == FSM_SW14_RE) ? 1'b1 : 1'b0;	
assign port15_req_done = (curr_state == FSM_SW15_RE) ? 1'b1 : 1'b0;	

//请求读地址
assign rd0_req_done  = (curr_state == FSM_SR0_RE) ? 1'b1 : 1'b0;	
assign rd1_req_done  = (curr_state == FSM_SR1_RE) ? 1'b1 : 1'b0;	
assign rd2_req_done  = (curr_state == FSM_SR2_RE) ? 1'b1 : 1'b0;	
assign rd3_req_done  = (curr_state == FSM_SR3_RE) ? 1'b1 : 1'b0;	
assign rd4_req_done  = (curr_state == FSM_SR4_RE) ? 1'b1 : 1'b0;	
assign rd5_req_done  = (curr_state == FSM_SR5_RE) ? 1'b1 : 1'b0;	
assign rd6_req_done  = (curr_state == FSM_SR6_RE) ? 1'b1 : 1'b0;	
assign rd7_req_done  = (curr_state == FSM_SR7_RE) ? 1'b1 : 1'b0;	
assign rd8_req_done  = (curr_state == FSM_SR8_RE) ? 1'b1 : 1'b0;	
assign rd9_req_done  = (curr_state == FSM_SR9_RE) ? 1'b1 : 1'b0;	
assign rd10_req_done = (curr_state == FSM_SR10_RE) ? 1'b1 : 1'b0;	
assign rd11_req_done = (curr_state == FSM_SR11_RE) ? 1'b1 : 1'b0;	
assign rd12_req_done = (curr_state == FSM_SR12_RE) ? 1'b1 : 1'b0;	
assign rd13_req_done = (curr_state == FSM_SR13_RE) ? 1'b1 : 1'b0;	
assign rd14_req_done = (curr_state == FSM_SR14_RE) ? 1'b1 : 1'b0;	
assign rd15_req_done = (curr_state == FSM_SR15_RE) ? 1'b1 : 1'b0;	

//端口对列信息
always @ (posedge sys_clk)
begin
	if(sys_rst)
		port_que_info <= 34'd0;
	else
		case(curr_state)
		FSM_SW0_RE:  port_que_info <= {4'd0,port0_que_info[29:0]};
		FSM_SW1_RE:  port_que_info <= {4'd1,port1_que_info[29:0]};
		FSM_SW2_RE:  port_que_info <= {4'd2,port2_que_info[29:0]};
		FSM_SW3_RE:  port_que_info <= {4'd3,port3_que_info[29:0]};
		FSM_SW4_RE:  port_que_info <= {4'd4,port4_que_info[29:0]};  
		FSM_SW5_RE:  port_que_info <= {4'd5,port5_que_info[29:0]};  
		FSM_SW6_RE:  port_que_info <= {4'd6,port6_que_info[29:0]};  
		FSM_SW7_RE:  port_que_info <= {4'd7,port7_que_info[29:0]};  
		FSM_SW8_RE:  port_que_info <= {4'd8,port8_que_info[29:0]};  
		FSM_SW9_RE:  port_que_info <= {4'd9,port9_que_info[29:0]};  
		FSM_SW10_RE: port_que_info <= {4'd10,port10_que_info[29:0]};
		FSM_SW11_RE: port_que_info <= {4'd11,port11_que_info[29:0]};
		FSM_SW12_RE: port_que_info <= {4'd12,port12_que_info[29:0]};
		FSM_SW13_RE: port_que_info <= {4'd13,port13_que_info[29:0]};
		FSM_SW14_RE: port_que_info <= {4'd14,port14_que_info[29:0]};
		FSM_SW15_RE: port_que_info <= {4'd15,port15_que_info[29:0]};
		default:     port_que_info <= port_que_info;
		endcase
end	

//输出端口读取信息
always @ (posedge sys_clk)
begin
	if(sys_rst)
		port_rd_info <= 28'd0;
	else
		case(curr_state)
		FSM_SR0_RE:  port_rd_info <= port0_rd_info;
		FSM_SR1_RE:  port_rd_info <= port1_rd_info;
		FSM_SR2_RE:  port_rd_info <= port2_rd_info;
		FSM_SR3_RE:  port_rd_info <= port3_rd_info;
		FSM_SR4_RE:  port_rd_info <= port4_rd_info;
		FSM_SR5_RE:  port_rd_info <= port5_rd_info;
		FSM_SR6_RE:  port_rd_info <= port6_rd_info;
		FSM_SR7_RE:  port_rd_info <= port7_rd_info;
		FSM_SR8_RE:  port_rd_info <= port8_rd_info;
		FSM_SR9_RE:  port_rd_info <= port9_rd_info;
		FSM_SR10_RE: port_rd_info <= port10_rd_info;
		FSM_SR11_RE: port_rd_info <= port11_rd_info;
		FSM_SR12_RE: port_rd_info <= port12_rd_info;
		FSM_SR13_RE: port_rd_info <= port13_rd_info;
		FSM_SR14_RE: port_rd_info <= port14_rd_info;
		FSM_SR15_RE: port_rd_info <= port15_rd_info;
		default:     port_rd_info <= port_rd_info;
		endcase
end	

//读写控制标志位
always @ (posedge sys_clk)
begin
	if(sys_rst)
		ctrl_flag <= 5'd0;
	else
		case(curr_state)
		FSM_SW0_INFO:  ctrl_flag <= 5'h00;
		FSM_SW1_INFO:  ctrl_flag <= 5'h01;
		FSM_SW2_INFO:  ctrl_flag <= 5'h02;
		FSM_SW3_INFO:  ctrl_flag <= 5'h03;
		FSM_SW4_INFO:  ctrl_flag <= 5'h04;
		FSM_SW5_INFO:  ctrl_flag <= 5'h05;
		FSM_SW6_INFO:  ctrl_flag <= 5'h06;
		FSM_SW7_INFO:  ctrl_flag <= 5'h07;
		FSM_SW8_INFO:  ctrl_flag <= 5'h08;
		FSM_SW9_INFO:  ctrl_flag <= 5'h09;
		FSM_SW10_INFO: ctrl_flag <= 5'h0a;
		FSM_SW11_INFO: ctrl_flag <= 5'h0b;
		FSM_SW12_INFO: ctrl_flag <= 5'h0c;
		FSM_SW13_INFO: ctrl_flag <= 5'h0d;
		FSM_SW14_INFO: ctrl_flag <= 5'h0e;
		FSM_SW15_INFO: ctrl_flag <= 5'h0f;
		FSM_SR0_INFO:  ctrl_flag <= 5'h10;
		FSM_SR1_INFO:  ctrl_flag <= 5'h11;
		FSM_SR2_INFO:  ctrl_flag <= 5'h12;
		FSM_SR3_INFO:  ctrl_flag <= 5'h13;
		FSM_SR4_INFO:  ctrl_flag <= 5'h14;
		FSM_SR5_INFO:  ctrl_flag <= 5'h15;
		FSM_SR6_INFO:  ctrl_flag <= 5'h16;
		FSM_SR7_INFO:  ctrl_flag <= 5'h17;
		FSM_SR8_INFO:  ctrl_flag <= 5'h18;
		FSM_SR9_INFO:  ctrl_flag <= 5'h19;
		FSM_SR10_INFO: ctrl_flag <= 5'h1a;
		FSM_SR11_INFO: ctrl_flag <= 5'h1b;
		FSM_SR12_INFO: ctrl_flag <= 5'h1c;
		FSM_SR13_INFO: ctrl_flag <= 5'h1d;
		FSM_SR14_INFO: ctrl_flag <= 5'h1e;
		FSM_SR15_INFO: ctrl_flag <= 5'h1f;
		default:       ctrl_flag <= ctrl_flag;
		endcase
end	

endmodule
