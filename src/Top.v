`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/30 21:05:46
// Design Name: 
// Module Name: Top
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

module Top #(
	parameter	PORT_NUM = 1
)
(
	input			sys_clk			,
	input			sys_rst			,

	//端口0-15
	input			port0_wr_sop	,
	input			port0_wr_eop	,
	input			port0_wr_vld	,
	input	[7:0]	port0_wr_data 	,
	output			port0_rd_sop	,
	output			port0_rd_eop	,
	output			port0_rd_vld	,
	output	[8:0]	port0_rd_data 	,	
	output			port0_ready	 	,//没有信号
	output			port0_full		,//没有信号

	input			port1_wr_sop	,
	input			port1_wr_eop	,
	input			port1_wr_vld	,
	input	[7:0]	port1_wr_data 	,
	output			port1_rd_sop	,
	output			port1_rd_eop	,
	output			port1_rd_vld	,
	output	[8:0]	port1_rd_data 	,	
	output			port1_ready	 	,	
	output			port1_full		,
	
	input			port2_wr_sop	,
	input			port2_wr_eop	,
	input			port2_wr_vld	,
	input	[7:0]	port2_wr_data 	,
	output			port2_rd_sop	,
	output			port2_rd_eop	,
	output			port2_rd_vld	,
	output	[8:0]	port2_rd_data 	,	
	output			port2_ready	 	,	
	output			port2_full		,

	input			port3_wr_sop	,
	input			port3_wr_eop	,
	input			port3_wr_vld	,
	input	[7:0]	port3_wr_data 	,
	output			port3_rd_sop	,
	output			port3_rd_eop	,
	output			port3_rd_vld	,
	output	[8:0]	port3_rd_data 	,	
	output			port3_ready	 	,	
	output			port3_full		,
	
	//32块sram接口
	output     	[14:0]	sram0_addr_r	,
	inout	   	[7:0]	sram0_data		,
	output             	sram0_cs		,
	output              sram0_oe		,
	output              sram0_we	    ,	
	output     	[14:0]	sram1_addr_r	,
	inout	   	[7:0]	sram1_data		,
	output             	sram1_cs		,
	output              sram1_oe		,
	output              sram1_we	    ,	
	output     	[14:0]	sram2_addr_r	,
	inout	   	[7:0]	sram2_data		,
	output             	sram2_cs		,
	output              sram2_oe		,
	output              sram2_we	    ,
	output     	[14:0]	sram3_addr_r	,
	inout	   	[7:0]	sram3_data		,
	output             	sram3_cs		,
	output              sram3_oe		,
	output              sram3_we	    ,
	output     	[14:0]	sram4_addr_r	,
	inout	   	[7:0]	sram4_data		,
	output             	sram4_cs		,
	output              sram4_oe		,
	output              sram4_we	    ,
	output     	[14:0]	sram5_addr_r	,
	inout	   	[7:0]	sram5_data		,
	output             	sram5_cs		,
	output              sram5_oe		,
	output              sram5_we	    ,
	output     	[14:0]	sram6_addr_r	,
	inout	   	[7:0]	sram6_data		,
	output             	sram6_cs		,
	output              sram6_oe		,
	output              sram6_we	    ,
	output     	[14:0]	sram7_addr_r	,
	inout	   	[7:0]	sram7_data		,
	output             	sram7_cs		,
	output              sram7_oe		,
	output              sram7_we	    ,
	output     	[14:0]	sram8_addr_r	,
	inout	   	[7:0]	sram8_data		,
	output             	sram8_cs		,
	output              sram8_oe		,
	output              sram8_we	    ,
	output     	[14:0]	sram9_addr_r	,
	inout	   	[7:0]	sram9_data		,
	output             	sram9_cs		,
	output              sram9_oe		,
	output              sram9_we	    ,
	output     	[14:0]	sram10_addr_r	,
	inout	   	[7:0]	sram10_data		,
	output             	sram10_cs		,
	output              sram10_oe		,
	output              sram10_we	    ,
	output     	[14:0]	sram11_addr_r	,
	inout	   	[7:0]	sram11_data		,
	output             	sram11_cs		,
	output              sram11_oe		,
	output              sram11_we	    ,
	output     	[14:0]	sram12_addr_r	,
	inout	   	[7:0]	sram12_data		,
	output             	sram12_cs		,
	output              sram12_oe		,
	output              sram12_we	    ,
	output     	[14:0]	sram13_addr_r	,
	inout	   	[7:0]	sram13_data		,
	output             	sram13_cs		,
	output              sram13_oe		,
	output              sram13_we	    ,
	output     	[14:0]	sram14_addr_r	,
	inout	   	[7:0]	sram14_data		,
	output             	sram14_cs		,
	output              sram14_oe		,
	output              sram14_we	    ,
	output     	[14:0]	sram15_addr_r	,
	inout	   	[7:0]	sram15_data		,
	output             	sram15_cs		,
	output              sram15_oe		,
	output              sram15_we	    ,
	output     	[14:0]	sram16_addr_r	,
	inout	   	[7:0]	sram16_data		,
	output             	sram16_cs		,
	output              sram16_oe		,
	output              sram16_we	    ,
	output     	[14:0]	sram17_addr_r	,
	inout	   	[7:0]	sram17_data		,
	output             	sram17_cs		,
	output              sram17_oe		,
	output              sram17_we	    ,
	output     	[14:0]	sram18_addr_r	,
	inout	   	[7:0]	sram18_data		,
	output             	sram18_cs		,
	output              sram18_oe		,
	output              sram18_we	    ,
	output     	[14:0]	sram19_addr_r	,
	inout	   	[7:0]	sram19_data		,
	output             	sram19_cs		,
	output              sram19_oe		,
	output              sram19_we	    ,	
	output     	[14:0]	sram20_addr_r	,
	inout	   	[7:0]	sram20_data		,
	output             	sram20_cs		,
	output              sram20_oe		,
	output              sram20_we	    ,	
	output     	[14:0]	sram21_addr_r	,
	inout	   	[7:0]	sram21_data		,
	output             	sram21_cs		,
	output              sram21_oe		,
	output              sram21_we	    ,	
	output     	[14:0]	sram22_addr_r	,
	inout	   	[7:0]	sram22_data		,
	output             	sram22_cs		,
	output              sram22_oe		,
	output              sram22_we	    ,
	output     	[14:0]	sram23_addr_r	,
	inout	   	[7:0]	sram23_data		,
	output             	sram23_cs		,
	output              sram23_oe		,
	output              sram23_we	    ,
	output     	[14:0]	sram24_addr_r	,
	inout	   	[7:0]	sram24_data		,
	output             	sram24_cs		,
	output              sram24_oe		,
	output              sram24_we	    ,
	output     	[14:0]	sram25_addr_r	,
	inout	   	[7:0]	sram25_data		,
	output             	sram25_cs		,
	output              sram25_oe		,
	output              sram25_we	    ,
	output     	[14:0]	sram26_addr_r	,
	inout	   	[7:0]	sram26_data		,
	output             	sram26_cs		,
	output              sram26_oe		,
	output              sram26_we	    ,
	output     	[14:0]	sram27_addr_r	,
	inout	   	[7:0]	sram27_data		,
	output             	sram27_cs		,
	output              sram27_oe		,
	output              sram27_we	    ,
	output     	[14:0]	sram28_addr_r	,
	inout	   	[7:0]	sram28_data		,
	output             	sram28_cs		,
	output              sram28_oe		,
	output              sram28_we	    ,
	output     	[14:0]	sram29_addr_r	,
	inout	   	[7:0]	sram29_data		,
	output             	sram29_cs		,
	output              sram29_oe		,
	output              sram29_we	    ,
	output     	[14:0]	sram30_addr_r	,
	inout	   	[7:0]	sram30_data		,
	output             	sram30_cs		,
	output              sram30_oe		,
	output              sram30_we	    ,
	output     	[14:0]	sram31_addr_r	,
	inout	   	[7:0]	sram31_data		,
	output             	sram31_cs		,
	output              sram31_oe		,
	output              sram31_we		
    );
	
wire  [8:0] 			sram0_addr		   		;    
wire  [8:0] 			sram1_addr		   		;    
wire  [8:0] 			sram2_addr		   		;    
wire  [8:0] 			sram3_addr		   		;    
wire  [8:0] 			sram4_addr		   		;    
wire  [8:0] 			sram5_addr		   		;    
wire  [8:0] 			sram6_addr		   		;    
wire  [8:0] 			sram7_addr		   		;    
wire  [8:0] 			sram8_addr		   		;    
wire  [8:0] 			sram9_addr		   		;    
wire  [8:0] 			sram10_addr		   		;    
wire  [8:0] 			sram11_addr		   		;    
wire  [8:0] 			sram12_addr		   		;    
wire  [8:0] 			sram13_addr		   		;    
wire  [8:0] 			sram14_addr		   		;    
wire  [8:0] 			sram15_addr		   		;    
wire  [8:0] 			sram16_addr		   		;    
wire  [8:0] 			sram17_addr		   		;    
wire  [8:0] 			sram18_addr		   		;    
wire  [8:0] 			sram19_addr		   		;    
wire  [8:0] 			sram20_addr		   		;    
wire  [8:0] 			sram21_addr		   		;    
wire  [8:0] 			sram22_addr		   		;    
wire  [8:0] 			sram23_addr		   		;    
wire  [8:0] 			sram24_addr		   		;    
wire  [8:0] 			sram25_addr		   		;    
wire  [8:0] 			sram26_addr		   		;    
wire  [8:0] 			sram27_addr		   		;    
wire  [8:0] 			sram28_addr		   		;    
wire  [8:0] 			sram29_addr		   		;    
wire  [8:0] 			sram30_addr		   		;    
wire  [8:0] 			sram31_addr		   		;    
  
wire  [8:0]				sram0_idle_cnt			; 
wire  [8:0]				sram1_idle_cnt			; 
wire  [8:0]				sram2_idle_cnt			; 
wire  [8:0]				sram3_idle_cnt			; 
wire  [8:0]				sram4_idle_cnt			; 
wire  [8:0]				sram5_idle_cnt			; 
wire  [8:0]				sram6_idle_cnt			; 
wire  [8:0]				sram7_idle_cnt			; 
wire  [8:0]				sram8_idle_cnt			; 
wire  [8:0]				sram9_idle_cnt			; 
wire  [8:0]				sram10_idle_cnt			; 
wire  [8:0]				sram11_idle_cnt			; 
wire  [8:0]				sram12_idle_cnt			; 
wire  [8:0]				sram13_idle_cnt			; 
wire  [8:0]				sram14_idle_cnt			; 
wire  [8:0]				sram15_idle_cnt			; 
wire  [8:0]				sram16_idle_cnt			; 
wire  [8:0]				sram17_idle_cnt			; 
wire  [8:0]				sram18_idle_cnt			; 
wire  [8:0]				sram19_idle_cnt			; 
wire  [8:0]				sram20_idle_cnt			; 
wire  [8:0]				sram21_idle_cnt			; 
wire  [8:0]				sram22_idle_cnt			; 
wire  [8:0]				sram23_idle_cnt			; 
wire  [8:0]				sram24_idle_cnt			; 
wire  [8:0]				sram25_idle_cnt			; 
wire  [8:0]				sram26_idle_cnt			; 
wire  [8:0]				sram27_idle_cnt			; 
wire  [8:0]				sram28_idle_cnt			; 
wire  [8:0]				sram29_idle_cnt			; 
wire  [8:0]				sram30_idle_cnt			; 
wire  [8:0]				sram31_idle_cnt			; 
  
wire  [9*32-1:0]		sram_idle_cnt			;  
wire  [9*32-1:0]		sram_addr				;  
wire  [15:0] 			dest_port_idle  		;

wire  		 			port0_idle  			;
wire  		 			port1_idle  			;
wire  		 			port2_idle  			;
wire  		 			port3_idle  			;
wire  		 			port4_idle  			;
wire  		 			port5_idle  			;
wire  		 			port6_idle  			;
wire  		 			port7_idle  			;
wire  		 			port8_idle  			;
wire  		 			port9_idle  			;
wire  		 			port10_idle  			;
wire  		 			port11_idle  			;
wire  		 			port12_idle  			;
wire  		 			port13_idle  			;
wire  		 			port14_idle  			;
wire  		 			port15_idle  			;

wire  [19:0]			port0_data_info         ;
wire  					port0_data_info_vld     ;
wire					port0_data_ren          ;
wire  [7:0]				port0_data_out          ;
wire					port0_req_addr          ;
wire					port0_req_done          ;
wire					port0_addr_done         ; 
wire  [516:0] 			port0_addr_use          ;
wire					port0_rd0_que_info_vld  ;
wire					port0_rd1_que_info_vld  ;
wire					port0_rd2_que_info_vld  ;
wire					port0_rd3_que_info_vld  ;
wire					port0_rd4_que_info_vld  ;
wire					port0_rd5_que_info_vld  ;
wire					port0_rd6_que_info_vld  ;
wire					port0_rd7_que_info_vld  ;
wire					port0_rd8_que_info_vld  ;
wire					port0_rd9_que_info_vld  ;
wire					port0_rd10_que_info_vld ;	
wire					port0_rd11_que_info_vld ;	
wire					port0_rd12_que_info_vld ;	
wire					port0_rd13_que_info_vld ;	
wire					port0_rd14_que_info_vld ;	
wire					port0_rd15_que_info_vld ;	
wire  [31:0]			port0_que_info	        ;   
wire					port0_queue_full		;
wire  [29:0]			port0_rd_info			;

wire  [19:0]			port1_data_info         ;
wire  					port1_data_info_vld     ;
wire					port1_data_ren          ;
wire  [7:0]				port1_data_out          ;
wire					port1_req_addr          ;
wire					port1_req_done          ;
wire					port1_addr_done         ; 
wire  [516:0] 			port1_addr_use          ;
wire					port1_rd0_que_info_vld  ;
wire					port1_rd1_que_info_vld  ;
wire					port1_rd2_que_info_vld  ;
wire					port1_rd3_que_info_vld  ;
wire					port1_rd4_que_info_vld  ;
wire					port1_rd5_que_info_vld  ;
wire					port1_rd6_que_info_vld  ;
wire					port1_rd7_que_info_vld  ;
wire					port1_rd8_que_info_vld  ;
wire					port1_rd9_que_info_vld  ;
wire					port1_rd10_que_info_vld ;	
wire					port1_rd11_que_info_vld ;	
wire					port1_rd12_que_info_vld ;	
wire					port1_rd13_que_info_vld ;	
wire					port1_rd14_que_info_vld ;	
wire					port1_rd15_que_info_vld ;	
wire  [31:0]			port1_que_info	        ;   
wire					port1_queue_full		;
wire  [31:0]			port1_rd_info			;

wire  [19:0]			port2_data_info         ;
wire  					port2_data_info_vld     ;
wire					port2_data_ren          ;
wire  [7:0]				port2_data_out          ;
wire					port2_req_addr          ;
wire					port2_req_done          ;
wire					port2_addr_done         ; 
wire  [516:0] 			port2_addr_use          ;
wire					port2_rd0_que_info_vld  ;
wire					port2_rd1_que_info_vld  ;
wire					port2_rd2_que_info_vld  ;
wire					port2_rd3_que_info_vld  ;
wire					port2_rd4_que_info_vld  ;
wire					port2_rd5_que_info_vld  ;
wire					port2_rd6_que_info_vld  ;
wire					port2_rd7_que_info_vld  ;
wire					port2_rd8_que_info_vld  ;
wire					port2_rd9_que_info_vld  ;
wire					port2_rd10_que_info_vld ;	
wire					port2_rd11_que_info_vld ;	
wire					port2_rd12_que_info_vld ;	
wire					port2_rd13_que_info_vld ;	
wire					port2_rd14_que_info_vld ;	
wire					port2_rd15_que_info_vld ;	
wire  [31:0]			port2_que_info	        ;   
wire					port2_queue_full		;
wire  [29:0]			port2_rd_info			;

wire  [19:0]			port3_data_info         ;
wire  					port3_data_info_vld     ;
wire					port3_data_ren          ;
wire  [7:0]				port3_data_out          ;
wire					port3_req_addr          ;
wire					port3_req_done          ;
wire					port3_addr_done         ; 
wire  [516:0] 			port3_addr_use          ;
wire					port3_rd0_que_info_vld  ;
wire					port3_rd1_que_info_vld  ;
wire					port3_rd2_que_info_vld  ;
wire					port3_rd3_que_info_vld  ;
wire					port3_rd4_que_info_vld  ;
wire					port3_rd5_que_info_vld  ;
wire					port3_rd6_que_info_vld  ;
wire					port3_rd7_que_info_vld  ;
wire					port3_rd8_que_info_vld  ;
wire					port3_rd9_que_info_vld  ;
wire					port3_rd10_que_info_vld ;	
wire					port3_rd11_que_info_vld ;	
wire					port3_rd12_que_info_vld ;	
wire					port3_rd13_que_info_vld ;	
wire					port3_rd14_que_info_vld ;	
wire					port3_rd15_que_info_vld ;	
wire  [31:0]			port3_que_info	        ;   
wire					port3_queue_full		;
wire  [29:0]			port3_rd_info			;

wire  [19:0]			port4_data_info         ;
wire  					port4_data_info_vld     ;
wire					port4_data_ren          ;
wire  [7:0]				port4_data_out          ;
wire					port4_req_addr          ;
wire					port4_req_done          ;
wire					port4_addr_done         ; 
wire  [516:0] 			port4_addr_use          ;
wire					port4_rd0_que_info_vld  ;
wire					port4_rd1_que_info_vld  ;
wire					port4_rd2_que_info_vld  ;
wire					port4_rd3_que_info_vld  ;
wire					port4_rd4_que_info_vld  ;
wire					port4_rd5_que_info_vld  ;
wire					port4_rd6_que_info_vld  ;
wire					port4_rd7_que_info_vld  ;
wire					port4_rd8_que_info_vld  ;
wire					port4_rd9_que_info_vld  ;
wire					port4_rd10_que_info_vld ;	
wire					port4_rd11_que_info_vld ;	
wire					port4_rd12_que_info_vld ;	
wire					port4_rd13_que_info_vld ;	
wire					port4_rd14_que_info_vld ;	
wire					port4_rd15_que_info_vld ;	
wire  [31:0]			port4_que_info	        ;   
wire					port4_queue_full		;
wire  [29:0]			port4_rd_info			;

wire  [19:0]			port5_data_info         ;
wire  					port5_data_info_vld     ;
wire					port5_data_ren          ;
wire  [7:0]				port5_data_out          ;
wire					port5_req_addr          ;
wire					port5_req_done          ;
wire					port5_addr_done         ; 
wire  [516:0] 			port5_addr_use          ;
wire					port5_rd0_que_info_vld  ;
wire					port5_rd1_que_info_vld  ;
wire					port5_rd2_que_info_vld  ;
wire					port5_rd3_que_info_vld  ;
wire					port5_rd4_que_info_vld  ;
wire					port5_rd5_que_info_vld  ;
wire					port5_rd6_que_info_vld  ;
wire					port5_rd7_que_info_vld  ;
wire					port5_rd8_que_info_vld  ;
wire					port5_rd9_que_info_vld  ;
wire					port5_rd10_que_info_vld ;	
wire					port5_rd11_que_info_vld ;	
wire					port5_rd12_que_info_vld ;	
wire					port5_rd13_que_info_vld ;	
wire					port5_rd14_que_info_vld ;	
wire					port5_rd15_que_info_vld ;	
wire  [31:0]			port5_que_info	        ;   
wire					port5_queue_full		;
wire  [29:0]			port5_rd_info			;

wire  [19:0]			port6_data_info         ;
wire  					port6_data_info_vld     ;
wire					port6_data_ren          ;
wire  [7:0]				port6_data_out          ;
wire					port6_req_addr          ;
wire					port6_req_done          ;
wire					port6_addr_done         ; 
wire  [516:0] 			port6_addr_use          ;
wire					port6_rd0_que_info_vld  ;
wire					port6_rd1_que_info_vld  ;
wire					port6_rd2_que_info_vld  ;
wire					port6_rd3_que_info_vld  ;
wire					port6_rd4_que_info_vld  ;
wire					port6_rd5_que_info_vld  ;
wire					port6_rd6_que_info_vld  ;
wire					port6_rd7_que_info_vld  ;
wire					port6_rd8_que_info_vld  ;
wire					port6_rd9_que_info_vld  ;
wire					port6_rd10_que_info_vld ;	
wire					port6_rd11_que_info_vld ;	
wire					port6_rd12_que_info_vld ;	
wire					port6_rd13_que_info_vld ;	
wire					port6_rd14_que_info_vld ;	
wire					port6_rd15_que_info_vld ;	
wire  [31:0]			port6_que_info	        ;   
wire					port6_queue_full		;
wire  [29:0]			port6_rd_info			;

wire  [19:0]			port7_data_info         ;
wire  					port7_data_info_vld     ;
wire					port7_data_ren          ;
wire  [7:0]				port7_data_out          ;
wire					port7_req_addr          ;
wire					port7_req_done          ;
wire					port7_addr_done         ; 
wire  [516:0] 			port7_addr_use          ;
wire					port7_rd0_que_info_vld  ;
wire					port7_rd1_que_info_vld  ;
wire					port7_rd2_que_info_vld  ;
wire					port7_rd3_que_info_vld  ;
wire					port7_rd4_que_info_vld  ;
wire					port7_rd5_que_info_vld  ;
wire					port7_rd6_que_info_vld  ;
wire					port7_rd7_que_info_vld  ;
wire					port7_rd8_que_info_vld  ;
wire					port7_rd9_que_info_vld  ;
wire					port7_rd10_que_info_vld ;	
wire					port7_rd11_que_info_vld ;	
wire					port7_rd12_que_info_vld ;	
wire					port7_rd13_que_info_vld ;	
wire					port7_rd14_que_info_vld ;	
wire					port7_rd15_que_info_vld ;	
wire  [31:0]			port7_que_info	        ;   
wire					port7_queue_full		;
wire  [29:0]			port7_rd_info			;

wire  [19:0]			port8_data_info         ;
wire  					port8_data_info_vld     ;
wire					port8_data_ren          ;
wire  [7:0]				port8_data_out          ;
wire					port8_req_addr          ;
wire					port8_req_done          ;
wire					port8_addr_done         ; 
wire  [516:0] 			port8_addr_use          ;
wire					port8_rd0_que_info_vld  ;
wire					port8_rd1_que_info_vld  ;
wire					port8_rd2_que_info_vld  ;
wire					port8_rd3_que_info_vld  ;
wire					port8_rd4_que_info_vld  ;
wire					port8_rd5_que_info_vld  ;
wire					port8_rd6_que_info_vld  ;
wire					port8_rd7_que_info_vld  ;
wire					port8_rd8_que_info_vld  ;
wire					port8_rd9_que_info_vld  ;
wire					port8_rd10_que_info_vld ;	
wire					port8_rd11_que_info_vld ;	
wire					port8_rd12_que_info_vld ;	
wire					port8_rd13_que_info_vld ;	
wire					port8_rd14_que_info_vld ;	
wire					port8_rd15_que_info_vld ;	
wire  [31:0]			port8_que_info	        ;   
wire					port8_queue_full		;
wire  [29:0]			port8_rd_info			;

wire  [19:0]			port9_data_info         ;
wire  					port9_data_info_vld     ;
wire					port9_data_ren          ;
wire  [7:0]				port9_data_out          ;
wire					port9_req_addr          ;
wire					port9_req_done          ;
wire					port9_addr_done         ; 
wire  [516:0] 			port9_addr_use          ;
wire					port9_rd0_que_info_vld  ;
wire					port9_rd1_que_info_vld  ;
wire					port9_rd2_que_info_vld  ;
wire					port9_rd3_que_info_vld  ;
wire					port9_rd4_que_info_vld  ;
wire					port9_rd5_que_info_vld  ;
wire					port9_rd6_que_info_vld  ;
wire					port9_rd7_que_info_vld  ;
wire					port9_rd8_que_info_vld  ;
wire					port9_rd9_que_info_vld  ;
wire					port9_rd10_que_info_vld ;	
wire					port9_rd11_que_info_vld ;	
wire					port9_rd12_que_info_vld ;	
wire					port9_rd13_que_info_vld ;	
wire					port9_rd14_que_info_vld ;	
wire					port9_rd15_que_info_vld ;	
wire  [31:0]			port9_que_info	        ;   
wire					port9_queue_full		;
wire  [29:0]			port9_rd_info			;

wire  [19:0]			port10_data_info         ;
wire  					port10_data_info_vld     ;
wire					port10_data_ren          ;
wire  [7:0]				port10_data_out          ;
wire					port10_req_addr          ;
wire					port10_req_done          ;
wire					port10_addr_done         ; 
wire  [516:0] 			port10_addr_use          ;
wire					port10_rd0_que_info_vld  ;
wire					port10_rd1_que_info_vld  ;
wire					port10_rd2_que_info_vld  ;
wire					port10_rd3_que_info_vld  ;
wire					port10_rd4_que_info_vld  ;
wire					port10_rd5_que_info_vld  ;
wire					port10_rd6_que_info_vld  ;
wire					port10_rd7_que_info_vld  ;
wire					port10_rd8_que_info_vld  ;
wire					port10_rd9_que_info_vld  ;
wire					port10_rd10_que_info_vld ;	
wire					port10_rd11_que_info_vld ;	
wire					port10_rd12_que_info_vld ;	
wire					port10_rd13_que_info_vld ;	
wire					port10_rd14_que_info_vld ;	
wire					port10_rd15_que_info_vld ;	
wire  [31:0]			port10_que_info	        ;   
wire					port10_queue_full		;
wire  [29:0]			port10_rd_info			;

wire  [19:0]			port11_data_info         ;
wire  					port11_data_info_vld     ;
wire					port11_data_ren          ;
wire  [7:0]				port11_data_out          ;
wire					port11_req_addr          ;
wire					port11_req_done          ;
wire					port11_addr_done         ; 
wire  [516:0] 			port11_addr_use          ;
wire					port11_rd0_que_info_vld  ;
wire					port11_rd1_que_info_vld  ;
wire					port11_rd2_que_info_vld  ;
wire					port11_rd3_que_info_vld  ;
wire					port11_rd4_que_info_vld  ;
wire					port11_rd5_que_info_vld  ;
wire					port11_rd6_que_info_vld  ;
wire					port11_rd7_que_info_vld  ;
wire					port11_rd8_que_info_vld  ;
wire					port11_rd9_que_info_vld  ;
wire					port11_rd10_que_info_vld ;	
wire					port11_rd11_que_info_vld ;	
wire					port11_rd12_que_info_vld ;	
wire					port11_rd13_que_info_vld ;	
wire					port11_rd14_que_info_vld ;	
wire					port11_rd15_que_info_vld ;	
wire  [31:0]			port11_que_info	        ;   
wire					port11_queue_full		;
wire  [29:0]			port11_rd_info			;

wire  [19:0]			port12_data_info         ;
wire  					port12_data_info_vld     ;
wire					port12_data_ren          ;
wire  [7:0]				port12_data_out          ;
wire					port12_req_addr          ;
wire					port12_req_done          ;
wire					port12_addr_done         ; 
wire  [516:0] 			port12_addr_use          ;
wire					port12_rd0_que_info_vld  ;
wire					port12_rd1_que_info_vld  ;
wire					port12_rd2_que_info_vld  ;
wire					port12_rd3_que_info_vld  ;
wire					port12_rd4_que_info_vld  ;
wire					port12_rd5_que_info_vld  ;
wire					port12_rd6_que_info_vld  ;
wire					port12_rd7_que_info_vld  ;
wire					port12_rd8_que_info_vld  ;
wire					port12_rd9_que_info_vld  ;
wire					port12_rd10_que_info_vld ;	
wire					port12_rd11_que_info_vld ;	
wire					port12_rd12_que_info_vld ;	
wire					port12_rd13_que_info_vld ;	
wire					port12_rd14_que_info_vld ;	
wire					port12_rd15_que_info_vld ;	
wire  [31:0]			port12_que_info	        ;   
wire					port12_queue_full		;
wire  [29:0]			port12_rd_info			;

wire  [19:0]			port13_data_info         ;
wire  					port13_data_info_vld     ;
wire					port13_data_ren          ;
wire  [7:0]				port13_data_out          ;
wire					port13_req_addr          ;
wire					port13_req_done          ;
wire					port13_addr_done         ; 
wire  [516:0] 			port13_addr_use          ;
wire					port13_rd0_que_info_vld  ;
wire					port13_rd1_que_info_vld  ;
wire					port13_rd2_que_info_vld  ;
wire					port13_rd3_que_info_vld  ;
wire					port13_rd4_que_info_vld  ;
wire					port13_rd5_que_info_vld  ;
wire					port13_rd6_que_info_vld  ;
wire					port13_rd7_que_info_vld  ;
wire					port13_rd8_que_info_vld  ;
wire					port13_rd9_que_info_vld  ;
wire					port13_rd10_que_info_vld ;	
wire					port13_rd11_que_info_vld ;	
wire					port13_rd12_que_info_vld ;	
wire					port13_rd13_que_info_vld ;	
wire					port13_rd14_que_info_vld ;	
wire					port13_rd15_que_info_vld ;	
wire  [31:0]			port13_que_info	        ;   
wire					port13_queue_full		;
wire  [29:0]			port13_rd_info			;

wire  [19:0]			port14_data_info         ;
wire  					port14_data_info_vld     ;
wire					port14_data_ren          ;
wire  [7:0]				port14_data_out          ;
wire					port14_req_addr          ;
wire					port14_req_done          ;
wire					port14_addr_done         ; 
wire  [516:0] 			port14_addr_use          ;
wire					port14_rd0_que_info_vld  ;
wire					port14_rd1_que_info_vld  ;
wire					port14_rd2_que_info_vld  ;
wire					port14_rd3_que_info_vld  ;
wire					port14_rd4_que_info_vld  ;
wire					port14_rd5_que_info_vld  ;
wire					port14_rd6_que_info_vld  ;
wire					port14_rd7_que_info_vld  ;
wire					port14_rd8_que_info_vld  ;
wire					port14_rd9_que_info_vld  ;
wire					port14_rd10_que_info_vld ;	
wire					port14_rd11_que_info_vld ;	
wire					port14_rd12_que_info_vld ;	
wire					port14_rd13_que_info_vld ;	
wire					port14_rd14_que_info_vld ;	
wire					port14_rd15_que_info_vld ;	
wire  [31:0]			port14_que_info	        ;   
wire					port14_queue_full		;
wire  [29:0]			port14_rd_info			;

wire  [19:0]			port15_data_info         ;
wire  					port15_data_info_vld     ;
wire					port15_data_ren          ;
wire  [7:0]				port15_data_out          ;
wire					port15_req_addr          ;
wire					port15_req_done          ;
wire					port15_addr_done         ; 
wire  [516:0] 			port15_addr_use          ;
wire					port15_rd0_que_info_vld  ;
wire					port15_rd1_que_info_vld  ;
wire					port15_rd2_que_info_vld  ;
wire					port15_rd3_que_info_vld  ;
wire					port15_rd4_que_info_vld  ;
wire					port15_rd5_que_info_vld  ;
wire					port15_rd6_que_info_vld  ;
wire					port15_rd7_que_info_vld  ;
wire					port15_rd8_que_info_vld  ;
wire					port15_rd9_que_info_vld  ;
wire					port15_rd10_que_info_vld ;	
wire					port15_rd11_que_info_vld ;	
wire					port15_rd12_que_info_vld ;	
wire					port15_rd13_que_info_vld ;	
wire					port15_rd14_que_info_vld ;	
wire					port15_rd15_que_info_vld ;	
wire  [31:0]			port15_que_info	        ;   
wire					port15_queue_full		;
wire  [29:0]			port15_rd_info			;

wire					rd0_req_addr            ;
wire					rd0_req_done            ;
wire					rd0_addr_done	        ;
wire  [516:0]			rd0_addr_use	        ;

wire					rd1_req_addr            ;
wire					rd1_req_done            ;
wire					rd1_addr_done	        ;
wire  [516:0]			rd1_addr_use	        ;

wire					rd2_req_addr            ;
wire					rd2_req_done            ;
wire					rd2_addr_done	        ;
wire  [516:0]			rd2_addr_use	        ;

wire					rd3_req_addr            ;
wire					rd3_req_done            ;
wire					rd3_addr_done	        ;
wire  [516:0]			rd3_addr_use	        ;

wire					rd4_req_addr            ;
wire					rd4_req_done            ;
wire					rd4_addr_done	        ;
wire  [516:0]			rd4_addr_use	        ;

wire					rd5_req_addr            ;
wire					rd5_req_done            ;
wire					rd5_addr_done	        ;
wire  [516:0]			rd5_addr_use	        ;

wire					rd6_req_addr            ;
wire					rd6_req_done            ;
wire					rd6_addr_done	        ;
wire  [516:0]			rd6_addr_use	        ;

wire					rd7_req_addr            ;
wire					rd7_req_done            ;
wire					rd7_addr_done	        ;
wire  [516:0]			rd7_addr_use	        ;

wire					rd8_req_addr            ;
wire					rd8_req_done            ;
wire					rd8_addr_done	        ;
wire  [516:0]			rd8_addr_use	        ;

wire					rd9_req_addr            ;
wire					rd9_req_done            ;
wire					rd9_addr_done	        ;
wire  [516:0]			rd9_addr_use	        ;

wire					rd10_req_addr            ;
wire					rd10_req_done            ;
wire					rd10_addr_done	        ;
wire  [516:0]			rd10_addr_use	        ;

wire					rd11_req_addr            ;
wire					rd11_req_done            ;
wire					rd11_addr_done	        ;
wire  [516:0]			rd11_addr_use	        ;

wire					rd12_req_addr            ;
wire					rd12_req_done            ;
wire					rd12_addr_done	        ;
wire  [516:0]			rd12_addr_use	        ;

wire					rd13_req_addr            ;
wire					rd13_req_done            ;
wire					rd13_addr_done	        ;
wire  [516:0]			rd13_addr_use	        ;

wire					rd14_req_addr            ;
wire					rd14_req_done            ;
wire					rd14_addr_done	        ;
wire  [516:0]			rd14_addr_use	        ;

wire					rd15_req_addr            ;
wire					rd15_req_done            ;
wire					rd15_addr_done	        ;
wire  [516:0]			rd15_addr_use	        ;

wire  [15:0]		wr_req_addr	        ;
wire  [15:0]		rd_req_addr	        ;
wire  [15:0]		port_wr_done	    ;
wire  [15:0]		port_rd_done	    ;
wire  [31:0]		sram_wr_re			;
wire  [31:0]		sram_rd_re			;

wire			port0_wr_done		;//写ram完成信号
wire			port1_wr_done		;	
wire			port2_wr_done		;	
wire			port3_wr_done		;	
wire			port4_wr_done		;	
wire			port5_wr_done		;	
wire			port6_wr_done		;	
wire			port7_wr_done		;	
wire			port8_wr_done		;	
wire			port9_wr_done		;	
wire			port10_wr_done	    ;	
wire			port11_wr_done	    ;	
wire			port12_wr_done	    ;	
wire			port13_wr_done	    ;	
wire			port14_wr_done	    ;	
wire			port15_wr_done	    ;		

wire			port0_wr_re			;//写端口ram更新完成信号
wire			port1_wr_re			;	
wire			port2_wr_re			;	
wire			port3_wr_re			;	
wire			port4_wr_re			;	
wire			port5_wr_re			;	
wire			port6_wr_re			;	
wire			port7_wr_re			;	
wire			port8_wr_re			;	
wire			port9_wr_re			;	
wire			port10_wr_re	    ;	
wire			port11_wr_re	    ;	
wire			port12_wr_re	    ;	
wire			port13_wr_re	    ;	
wire			port14_wr_re	    ;	
wire			port15_wr_re	    ;

wire			port0_rd_done		;//读ram完成信号
wire			port1_rd_done		;	
wire			port2_rd_done		;	
wire			port3_rd_done		;	
wire			port4_rd_done		;	
wire			port5_rd_done		;	
wire			port6_rd_done		;	
wire			port7_rd_done		;	
wire			port8_rd_done		;	
wire			port9_rd_done		;	
wire			port10_rd_done	    ;	
wire			port11_rd_done	    ;	
wire			port12_rd_done	    ;	
wire			port13_rd_done	    ;	
wire			port14_rd_done	    ;	
wire			port15_rd_done	    ;	
	
wire			port0_rd_re			;//读端口ram更新完成信号
wire			port1_rd_re			;	
wire			port2_rd_re			;	
wire			port3_rd_re			;	
wire			port4_rd_re			;	
wire			port5_rd_re			;	
wire			port6_rd_re			;	
wire			port7_rd_re			;	
wire			port8_rd_re			;	
wire			port9_rd_re			;	
wire			port10_rd_re	    ;	
wire			port11_rd_re	    ;	
wire			port12_rd_re	    ;	
wire			port13_rd_re	    ;	
wire			port14_rd_re	    ;	
wire			port15_rd_re	    ;		
	
wire  [31:0]    port_que_info		;
wire  [25:0]    port_rd_info		;	
wire  [4:0]     ctrl_flag		    ;

wire			port_req_done		;
wire			rd_req_done			;
	
wire            sram0_wr_fifo_ren	;
wire            sram1_wr_fifo_ren	;
wire            sram2_wr_fifo_ren	;
wire            sram3_wr_fifo_ren	;
wire            sram4_wr_fifo_ren	;
wire            sram5_wr_fifo_ren	;
wire            sram6_wr_fifo_ren	;
wire            sram7_wr_fifo_ren	;
wire            sram8_wr_fifo_ren	;
wire            sram9_wr_fifo_ren	;
wire            sram10_wr_fifo_ren	;
wire            sram11_wr_fifo_ren	;
wire            sram12_wr_fifo_ren	;
wire            sram13_wr_fifo_ren	;
wire            sram14_wr_fifo_ren	;
wire            sram15_wr_fifo_ren	;

wire  [7:0]    wr_fifo_data;
wire   sram_rd_fifo	;

wire   [3:0]    data_ren_port0;
wire   [3:0]    data_ren_port1;
wire   [3:0]    data_ren_port2;
wire   [3:0]    data_ren_port3;
wire   [3:0]    data_ren_port4;
wire   [3:0]    data_ren_port5;
wire   [3:0]    data_ren_port6;
wire   [3:0]    data_ren_port7;
wire   [3:0]    data_ren_port8;
wire   [3:0]    data_ren_port9;
wire   [3:0]    data_ren_port10;
wire   [3:0]    data_ren_port11;
wire   [3:0]    data_ren_port12;
wire   [3:0]    data_ren_port13;
wire   [3:0]    data_ren_port14;
wire   [3:0]    data_ren_port15;

wire           port0_por_rd_sop ;
wire           port0_por_rd_eop ;
wire           port0_por_rd_vld ;
wire   [7:0]   port0_por_rd_data;
wire           port1_por_rd_sop ;
wire           port1_por_rd_eop ;
wire           port1_por_rd_vld ;
wire   [7:0]   port1_por_rd_data;		
wire           port2_por_rd_sop ;
wire           port2_por_rd_eop ;
wire           port2_por_rd_vld ;
wire   [7:0]   port2_por_rd_data;		
wire           port3_por_rd_sop ;
wire           port3_por_rd_eop ;
wire           port3_por_rd_vld ;
wire   [7:0]   port3_por_rd_data;	
wire           port4_por_rd_sop ;
wire           port4_por_rd_eop ;
wire           port4_por_rd_vld ;
wire   [7:0]   port4_por_rd_data;
wire           port5_por_rd_sop ;
wire           port5_por_rd_eop ;
wire           port5_por_rd_vld ;
wire   [7:0]   port5_por_rd_data;
wire           port6_por_rd_sop ;
wire           port6_por_rd_eop ;
wire           port6_por_rd_vld ;
wire   [7:0]   port6_por_rd_data;
wire           port7_por_rd_sop ;
wire           port7_por_rd_eop ;
wire           port7_por_rd_vld ;
wire   [7:0]   port7_por_rd_data;
wire           port8_por_rd_sop ;
wire           port8_por_rd_eop ;
wire           port8_por_rd_vld ;
wire   [7:0]   port8_por_rd_data;
wire           port9_por_rd_sop ;
wire           port9_por_rd_eop ;
wire           port9_por_rd_vld ;
wire   [7:0]   port9_por_rd_data;
wire           port10_por_rd_sop ;
wire           port10_por_rd_eop ;
wire           port10_por_rd_vld ;
wire   [7:0]   port10_por_rd_data;
wire           port11_por_rd_sop ;
wire           port11_por_rd_eop ;
wire           port11_por_rd_vld ;
wire   [7:0]   port11_por_rd_data;
wire           port12_por_rd_sop ;
wire           port12_por_rd_eop ;
wire           port12_por_rd_vld ;
wire   [7:0]   port12_por_rd_data;
wire           port13_por_rd_sop ;
wire           port13_por_rd_eop ;
wire           port13_por_rd_vld ;
wire   [7:0]   port13_por_rd_data;
wire           port14_por_rd_sop ;
wire           port14_por_rd_eop ;
wire           port14_por_rd_vld ;
wire   [7:0]   port14_por_rd_data;
wire           port15_por_rd_sop ;
wire           port15_por_rd_eop ;
wire           port15_por_rd_vld ;
wire   [7:0]   port15_por_rd_data;
	
reg			rd0_por_rd_sop  ;
reg        	rd0_por_rd_eop  ;
reg        	rd0_por_rd_vld  ;
reg  [7:0]     rd0_por_rd_data ;
reg			rd1_por_rd_sop  ;
reg        	rd1_por_rd_eop  ;
reg        	rd1_por_rd_vld  ;
reg  [7:0]     rd1_por_rd_data ;
reg			rd2_por_rd_sop  ;
reg        	rd2_por_rd_eop  ;
reg        	rd2_por_rd_vld  ;
reg  [7:0]     rd2_por_rd_data ;
reg			rd3_por_rd_sop  ;
reg        	rd3_por_rd_eop  ;
reg        	rd3_por_rd_vld  ;
reg  [7:0]     rd3_por_rd_data ;
reg			rd4_por_rd_sop  ;
reg        	rd4_por_rd_eop  ;
reg        	rd4_por_rd_vld  ;
reg  [7:0]     rd4_por_rd_data ;
reg			rd5_por_rd_sop  ;
reg        	rd5_por_rd_eop  ;
reg        	rd5_por_rd_vld  ;
reg  [7:0]     rd5_por_rd_data ;
reg			rd6_por_rd_sop  ;
reg        	rd6_por_rd_eop  ;
reg        	rd6_por_rd_vld  ;
reg  [7:0]     rd6_por_rd_data ;
reg			rd7_por_rd_sop  ;
reg        	rd7_por_rd_eop  ;
reg        	rd7_por_rd_vld  ;
reg  [7:0]     rd7_por_rd_data ;
reg			rd8_por_rd_sop  ;
reg        	rd8_por_rd_eop  ;
reg        	rd8_por_rd_vld  ;
reg  [7:0]     rd8_por_rd_data ;
reg			rd9_por_rd_sop  ;
reg        	rd9_por_rd_eop  ;
reg        	rd9_por_rd_vld  ;
reg  [7:0]     rd9_por_rd_data ;
reg			rd10_por_rd_sop  ;
reg        	rd10_por_rd_eop  ;
reg        	rd10_por_rd_vld  ;
reg  [7:0]     rd10_por_rd_data ;
reg			rd11_por_rd_sop  ;
reg        	rd11_por_rd_eop  ;
reg        	rd11_por_rd_vld  ;
reg  [7:0]     rd11_por_rd_data ;
reg			rd12_por_rd_sop  ;
reg        	rd12_por_rd_eop  ;
reg        	rd12_por_rd_vld  ;
reg  [7:0]     rd12_por_rd_data ;
reg			rd13_por_rd_sop  ;
reg        	rd13_por_rd_eop  ;
reg        	rd13_por_rd_vld  ;
reg  [7:0]     rd13_por_rd_data ;
reg			rd14_por_rd_sop  ;
reg        	rd14_por_rd_eop  ;
reg        	rd14_por_rd_vld  ;
reg  [7:0]     rd14_por_rd_data ;
reg			rd15_por_rd_sop  ;
reg        	rd15_por_rd_eop  ;
reg        	rd15_por_rd_vld  ;
reg  [7:0]     rd15_por_rd_data ;

wire		rd_por_rd_sop	;
wire		rd_por_rd_eop	; 
wire		rd_por_rd_vld	; 
wire [7:0]	rd_por_rd_data	;


wire  wr_fifo_ren0;
wire  wr_fifo_ren1;
wire  wr_fifo_ren2;
wire  wr_fifo_ren3;
wire  wr_fifo_ren4;
wire  wr_fifo_ren5;
wire  wr_fifo_ren6;
wire  wr_fifo_ren7;
wire  wr_fifo_ren8;
wire  wr_fifo_ren9;
wire  wr_fifo_ren10;
wire  wr_fifo_ren11;
wire  wr_fifo_ren12;
wire  wr_fifo_ren13;
wire  wr_fifo_ren14;
wire  wr_fifo_ren15;

		
assign port0_idle  = ~rd0_por_rd_vld		;
assign port1_idle  = ~rd1_por_rd_vld		;
assign port2_idle  = ~rd2_por_rd_vld		;
assign port3_idle  = ~rd3_por_rd_vld		;
assign port4_idle  = ~rd4_por_rd_vld		;
assign port5_idle  = ~rd5_por_rd_vld		;
assign port6_idle  = ~rd6_por_rd_vld		;
assign port7_idle  = ~rd7_por_rd_vld		;
assign port8_idle  = ~rd8_por_rd_vld		;
assign port9_idle  = ~rd9_por_rd_vld		;
assign port10_idle = ~rd10_por_rd_vld		;
assign port11_idle = ~rd11_por_rd_vld		;
assign port12_idle = ~rd12_por_rd_vld		;
assign port13_idle = ~rd13_por_rd_vld		;
assign port14_idle = ~rd14_por_rd_vld		;
assign port15_idle = ~rd15_por_rd_vld		;
	
assign port_rd_done = {port15_rd_done,port14_rd_done,port13_rd_done,port12_rd_done,port11_rd_done,port10_rd_done,port9_rd_done,port8_rd_done,
                       port7_rd_done ,port6_rd_done ,port5_rd_done ,port4_rd_done ,port3_rd_done ,port2_rd_done ,port1_rd_done,port0_rd_done};
		
assign port_wr_done = {port15_wr_done,port14_wr_done,port13_wr_done,port12_wr_done,port11_wr_done,port10_wr_done,port9_wr_done,port8_wr_done,
                       port7_wr_done ,port6_wr_done ,port5_wr_done ,port4_wr_done ,port3_wr_done ,port2_wr_done ,port1_wr_done,port0_wr_done};
	
assign wr_req_addr = {port15_req_addr,port14_req_addr,port13_req_addr,port12_req_addr,port11_req_addr,port10_req_addr,port9_req_addr,port8_req_addr,
                      port7_req_addr ,port6_req_addr ,port5_req_addr ,port4_req_addr ,port3_req_addr ,port2_req_addr ,port1_req_addr,port0_req_addr};

assign rd_req_addr = {rd15_req_addr,rd14_req_addr,rd13_req_addr,rd12_req_addr,rd11_req_addr,rd10_req_addr,rd9_req_addr,rd8_req_addr,
                      rd7_req_addr ,rd6_req_addr ,rd5_req_addr ,rd4_req_addr ,rd3_req_addr ,rd2_req_addr ,rd1_req_addr,rd0_req_addr};	
					  
assign dest_port_idle = {port15_idle,port14_idle,port13_idle,port12_idle,port11_idle,port10_idle,port9_idle,port8_idle,
						 port7_idle,port6_idle,port5_idle,port4_idle,port3_idle,port2_idle,port1_idle,port0_idle};


//************************************* wr_lead ********************************************//

wr_lead u_wr_lead0(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port0_wr_sop		   ),
    .wr_eop			    (port0_wr_eop		   ),
    .wr_vld			    (port0_wr_vld		   ),
    .wr_data		    (port0_wr_data		   ),
    .data_info		    (port0_data_info	   ),//output
    .data_info_vld	    (port0_data_info_vld   ),//output
    .data_ren    	    (port0_data_ren | wr_fifo_ren0    	  ),
    .data_out     	    (port0_data_out    	   ),
    .full               (port0_port_full	   )
);

wr_lead u_wr_lead1(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port1_wr_sop		   ),
    .wr_eop			    (port1_wr_eop		   ),
    .wr_vld			    (port1_wr_vld		   ),
    .wr_data		    (port1_wr_data		   ),
    .data_info		    (port1_data_info	   ),//output
    .data_info_vld	    (port1_data_info_vld   ),//output
    .data_ren    	    (port1_data_ren | wr_fifo_ren1    	   ),
    .data_out     	    (port1_data_out    	   ),
    .full               (port1_port_full	   )
);

wr_lead u_wr_lead2(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port2_wr_sop		   ),
    .wr_eop			    (port2_wr_eop		   ),
    .wr_vld			    (port2_wr_vld		   ),
    .wr_data		    (port2_wr_data		   ),
    .data_info		    (port2_data_info	   ),//output
    .data_info_vld	    (port2_data_info_vld   ),//output
    .data_ren    	    (port2_data_ren | wr_fifo_ren2    	   ),
    .data_out     	    (port2_data_out    	   ),
    .full               (port2_port_full	   )
);

wr_lead u_wr_lead3(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port3_wr_sop		   ),
    .wr_eop			    (port3_wr_eop		   ),
    .wr_vld			    (port3_wr_vld		   ),
    .wr_data		    (port3_wr_data		   ),
    .data_info		    (port3_data_info	   ),//output
    .data_info_vld	    (port3_data_info_vld   ),//output
    .data_ren    	    (port3_data_ren | wr_fifo_ren3    	   ),
    .data_out     	    (port3_data_out    	   ),
    .full               (port3_port_full	   )
);

wr_lead u_wr_lead4(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port4_wr_sop		   ),
    .wr_eop			    (port4_wr_eop		   ),
    .wr_vld			    (port4_wr_vld		   ),
    .wr_data		    (port4_wr_data		   ),
    .data_info		    (port4_data_info	   ),//output
    .data_info_vld	    (port4_data_info_vld   ),//output
    .data_ren    	    (port4_data_ren | wr_fifo_ren4    	   ),
    .data_out     	    (port4_data_out    	   ),
    .full               (port4_port_full	   )
);

wr_lead u_wr_lead5(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port5_wr_sop		   ),
    .wr_eop			    (port5_wr_eop		   ),
    .wr_vld			    (port5_wr_vld		   ),
    .wr_data		    (port5_wr_data		   ),
    .data_info		    (port5_data_info	   ),//output
    .data_info_vld	    (port5_data_info_vld   ),//output
    .data_ren    	    (port5_data_ren | wr_fifo_ren5    	   ),
    .data_out     	    (port5_data_out    	   ),
    .full               (port5_port_full	   )
);

wr_lead u_wr_lead6(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port6_wr_sop		   ),
    .wr_eop			    (port6_wr_eop		   ),
    .wr_vld			    (port6_wr_vld		   ),
    .wr_data		    (port6_wr_data		   ),
    .data_info		    (port6_data_info	   ),//output
    .data_info_vld	    (port6_data_info_vld   ),//output
    .data_ren    	    (port6_data_ren | wr_fifo_ren6    	   ),
    .data_out     	    (port6_data_out    	   ),
    .full               (port6_port_full	   )
);

wr_lead u_wr_lead7(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port7_wr_sop		   ),
    .wr_eop			    (port7_wr_eop		   ),
    .wr_vld			    (port7_wr_vld		   ),
    .wr_data		    (port7_wr_data		   ),
    .data_info		    (port7_data_info	   ),//output
    .data_info_vld	    (port7_data_info_vld   ),//output
    .data_ren    	    (port7_data_ren | wr_fifo_ren7    	   ),
    .data_out     	    (port7_data_out    	   ),
    .full               (port7_port_full	   )
);

wr_lead u_wr_lead8(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port8_wr_sop		   ),
    .wr_eop			    (port8_wr_eop		   ),
    .wr_vld			    (port8_wr_vld		   ),
    .wr_data		    (port8_wr_data		   ),
    .data_info		    (port8_data_info	   ),//output
    .data_info_vld	    (port8_data_info_vld   ),//output
    .data_ren    	    (port8_data_ren | wr_fifo_ren8    	   ),
    .data_out     	    (port8_data_out    	   ),
    .full               (port8_port_full	   )
);

wr_lead u_wr_lead9(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port9_wr_sop		   ),
    .wr_eop			    (port9_wr_eop		   ),
    .wr_vld			    (port9_wr_vld		   ),
    .wr_data		    (port9_wr_data		   ),
    .data_info		    (port9_data_info	   ),//output
    .data_info_vld	    (port9_data_info_vld   ),//output
    .data_ren    	    (port9_data_ren | wr_fifo_ren9    	   ),
    .data_out     	    (port9_data_out    	   ),
    .full               (port9_port_full	   )
);

wr_lead u_wr_lead10(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port10_wr_sop		   ),
    .wr_eop			    (port10_wr_eop		   ),
    .wr_vld			    (port10_wr_vld		   ),
    .wr_data		    (port10_wr_data		   ),
    .data_info		    (port10_data_info	   ),//output
    .data_info_vld	    (port10_data_info_vld   ),//output
    .data_ren    	    (port10_data_ren | wr_fifo_ren10    	   ),
    .data_out     	    (port10_data_out    	   ),
    .full               (port10_port_full	   )
);

wr_lead u_wr_lead11(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port11_wr_sop		   ),
    .wr_eop			    (port11_wr_eop		   ),
    .wr_vld			    (port11_wr_vld		   ),
    .wr_data		    (port11_wr_data		   ),
    .data_info		    (port11_data_info	   ),//output
    .data_info_vld	    (port11_data_info_vld   ),//output
    .data_ren    	    (port11_data_ren | wr_fifo_ren11    	   ),
    .data_out     	    (port11_data_out    	   ),
    .full               (port11_port_full	   )
);

wr_lead u_wr_lead12(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port12_wr_sop		   ),
    .wr_eop			    (port12_wr_eop		   ),
    .wr_vld			    (port12_wr_vld		   ),
    .wr_data		    (port12_wr_data		   ),
    .data_info		    (port12_data_info	   ),//output
    .data_info_vld	    (port12_data_info_vld   ),//output
    .data_ren    	    (port12_data_ren | wr_fifo_ren12    	   ),
    .data_out     	    (port12_data_out    	   ),
    .full               (port12_port_full	   )
);

wr_lead u_wr_lead13(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port13_wr_sop		   ),
    .wr_eop			    (port13_wr_eop		   ),
    .wr_vld			    (port13_wr_vld		   ),
    .wr_data		    (port13_wr_data		   ),
    .data_info		    (port13_data_info	   ),//output
    .data_info_vld	    (port13_data_info_vld   ),//output
    .data_ren    	    (port13_data_ren | wr_fifo_ren13    	   ),
    .data_out     	    (port13_data_out    	   ),
    .full               (port13_port_full	   )
);

wr_lead u_wr_lead14(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port14_wr_sop		   ),
    .wr_eop			    (port14_wr_eop		   ),
    .wr_vld			    (port14_wr_vld		   ),
    .wr_data		    (port14_wr_data		   ),
    .data_info		    (port14_data_info	   ),//output
    .data_info_vld	    (port14_data_info_vld   ),//output
    .data_ren    	    (port14_data_ren | wr_fifo_ren14    	   ),
    .data_out     	    (port14_data_out    	   ),
    .full               (port14_port_full	   )
);

wr_lead u_wr_lead15(
    .sys_clk		    (sys_clk			   ),
    .sys_rst		    (sys_rst			   ),	
    .wr_sop			    (port15_wr_sop		   ),
    .wr_eop			    (port15_wr_eop		   ),
    .wr_vld			    (port15_wr_vld		   ),
    .wr_data		    (port15_wr_data		   ),
    .data_info		    (port15_data_info	   ),//output
    .data_info_vld	    (port15_data_info_vld   ),//output
    .data_ren    	    (port15_data_ren | wr_fifo_ren15    	   ),
    .data_out     	    (port15_data_out    	   ),
    .full               (port15_port_full	   )
);


//************************************* port output ********************************************//

//目的端口读取数据（1.dest端口空闲，直接送入dest端口；2.从SRAM中读取） 	
always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
        rd0_por_rd_sop  <= 1'd0;
        rd0_por_rd_eop  <= 1'd0;
        rd0_por_rd_vld  <= 1'd0;
        rd0_por_rd_data <= 8'd0;
	end
	//dest端口空闲，直接送入dest端口
	else if(data_ren_port0 == 4'd0)
	begin
        rd0_por_rd_sop  <= port0_por_rd_sop;
        rd0_por_rd_eop  <= port0_por_rd_eop;
        rd0_por_rd_vld  <= port0_por_rd_vld;
        rd0_por_rd_data <= port0_data_out;
	end	
	else if(data_ren_port1 == 4'd0)
	begin
        rd0_por_rd_sop  <= port1_por_rd_sop;
        rd0_por_rd_eop  <= port1_por_rd_eop;
        rd0_por_rd_vld  <= port1_por_rd_vld;
        rd0_por_rd_data <= port1_data_out;
	end	
	else if(data_ren_port2 == 4'd0)
	begin
        rd0_por_rd_sop  <= port2_por_rd_sop;
        rd0_por_rd_eop  <= port2_por_rd_eop;
        rd0_por_rd_vld  <= port2_por_rd_vld;
        rd0_por_rd_data <= port2_data_out;
	end	
	else if(data_ren_port3 == 4'd0)
	begin
        rd0_por_rd_sop  <= port3_por_rd_sop;
        rd0_por_rd_eop  <= port3_por_rd_eop;
        rd0_por_rd_vld  <= port3_por_rd_vld;
        rd0_por_rd_data <= port3_data_out;
	end	
	else if(data_ren_port4 == 4'd0)
	begin
        rd0_por_rd_sop  <= port4_por_rd_sop;
        rd0_por_rd_eop  <= port4_por_rd_eop;
        rd0_por_rd_vld  <= port4_por_rd_vld;
        rd0_por_rd_data <= port4_data_out;
	end	
	else if(data_ren_port5 == 4'd0)
	begin
        rd0_por_rd_sop  <= port5_por_rd_sop;
        rd0_por_rd_eop  <= port5_por_rd_eop;
        rd0_por_rd_vld  <= port5_por_rd_vld;
        rd0_por_rd_data <= port5_data_out;
	end	
	else if(data_ren_port6 == 4'd0)
	begin
        rd0_por_rd_sop  <= port6_por_rd_sop;
        rd0_por_rd_eop  <= port6_por_rd_eop;
        rd0_por_rd_vld  <= port6_por_rd_vld;
        rd0_por_rd_data <= port6_data_out;
	end	
	else if(data_ren_port7 == 4'd0)
	begin
        rd0_por_rd_sop  <= port7_por_rd_sop;
        rd0_por_rd_eop  <= port7_por_rd_eop;
        rd0_por_rd_vld  <= port7_por_rd_vld;
        rd0_por_rd_data <= port7_data_out;
	end	
	else if(data_ren_port8 == 4'd0)
	begin
        rd0_por_rd_sop  <= port8_por_rd_sop;
        rd0_por_rd_eop  <= port8_por_rd_eop;
        rd0_por_rd_vld  <= port8_por_rd_vld;
        rd0_por_rd_data <= port8_data_out;
	end	
	else if(data_ren_port9 == 4'd0)
	begin
        rd0_por_rd_sop  <= port9_por_rd_sop;
        rd0_por_rd_eop  <= port9_por_rd_eop;
        rd0_por_rd_vld  <= port9_por_rd_vld;
        rd0_por_rd_data <= port9_data_out;
	end	
	else if(data_ren_port10 == 4'd0)
	begin
        rd0_por_rd_sop  <= port10_por_rd_sop;
        rd0_por_rd_eop  <= port10_por_rd_eop;
        rd0_por_rd_vld  <= port10_por_rd_vld;
        rd0_por_rd_data <= port10_data_out;
	end	
	else if(data_ren_port11 == 4'd0)
	begin
        rd0_por_rd_sop  <= port11_por_rd_sop;
        rd0_por_rd_eop  <= port11_por_rd_eop;
        rd0_por_rd_vld  <= port11_por_rd_vld;
        rd0_por_rd_data <= port11_data_out;
	end	
	else if(data_ren_port12 == 4'd0)
	begin
        rd0_por_rd_sop  <= port12_por_rd_sop;
        rd0_por_rd_eop  <= port12_por_rd_eop;
        rd0_por_rd_vld  <= port12_por_rd_vld;
        rd0_por_rd_data <= port12_data_out;
	end	
	else if(data_ren_port13 == 4'd0)
	begin
        rd0_por_rd_sop  <= port13_por_rd_sop;
        rd0_por_rd_eop  <= port13_por_rd_eop;
        rd0_por_rd_vld  <= port13_por_rd_vld;
        rd0_por_rd_data <= port13_data_out;
	end	
	else if(data_ren_port14 == 4'd0)
	begin
        rd0_por_rd_sop  <= port14_por_rd_sop;
        rd0_por_rd_eop  <= port14_por_rd_eop;
        rd0_por_rd_vld  <= port14_por_rd_vld;
        rd0_por_rd_data <= port14_data_out;
	end	
	else if(data_ren_port15 == 4'd0)
	begin
        rd0_por_rd_sop  <= port15_por_rd_sop;
        rd0_por_rd_eop  <= port15_por_rd_eop;
        rd0_por_rd_vld  <= port15_por_rd_vld;
        rd0_por_rd_data <= port15_data_out;
	end
	//端口0从SRAM中读
	else if(ctrl_flag == 5'h10)
	begin
        rd0_por_rd_sop  <= rd_por_rd_sop ;
        rd0_por_rd_eop  <= rd_por_rd_eop ;
        rd0_por_rd_vld  <= rd_por_rd_vld ;
        rd0_por_rd_data <= rd_por_rd_data;
	end	
	else
	begin
        rd0_por_rd_sop  <= 1'd0;
        rd0_por_rd_eop  <= 1'd0;
        rd0_por_rd_vld  <= 1'd0;
        rd0_por_rd_data <= 8'd0;
	end	
end
	
	
always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
        rd1_por_rd_sop  <= 1'd0;
        rd1_por_rd_eop  <= 1'd0;
        rd1_por_rd_vld  <= 1'd0;
        rd1_por_rd_data <= 8'd0;
	end
	//dest端口空闲，直接送入dest端口	
	else if(data_ren_port0 == 4'd1)
	begin
        rd1_por_rd_sop  <= port0_por_rd_sop;
        rd1_por_rd_eop  <= port0_por_rd_eop;
        rd1_por_rd_vld  <= port0_por_rd_vld;
        rd1_por_rd_data <= port0_data_out;
	end	
	else if(data_ren_port1 == 4'd1)
	begin
        rd1_por_rd_sop  <= port1_por_rd_sop;
        rd1_por_rd_eop  <= port1_por_rd_eop;
        rd1_por_rd_vld  <= port1_por_rd_vld;
        rd1_por_rd_data <= port1_data_out;
	end	
	else if(data_ren_port2 == 4'd1)
	begin
        rd1_por_rd_sop  <= port2_por_rd_sop;
        rd1_por_rd_eop  <= port2_por_rd_eop;
        rd1_por_rd_vld  <= port2_por_rd_vld;
        rd1_por_rd_data <= port2_data_out;
	end	
	else if(data_ren_port3 == 4'd1)
	begin
        rd1_por_rd_sop  <= port3_por_rd_sop;
        rd1_por_rd_eop  <= port3_por_rd_eop;
        rd1_por_rd_vld  <= port3_por_rd_vld;
        rd1_por_rd_data <= port3_data_out;
	end	
	else if(data_ren_port4 == 4'd1)
	begin
        rd1_por_rd_sop  <= port4_por_rd_sop;
        rd1_por_rd_eop  <= port4_por_rd_eop;
        rd1_por_rd_vld  <= port4_por_rd_vld;
        rd1_por_rd_data <= port4_data_out;
	end	
	else if(data_ren_port5 == 4'd1)
	begin
        rd1_por_rd_sop  <= port5_por_rd_sop;
        rd1_por_rd_eop  <= port5_por_rd_eop;
        rd1_por_rd_vld  <= port5_por_rd_vld;
        rd1_por_rd_data <= port5_data_out;
	end	
	else if(data_ren_port6 == 4'd1)
	begin
        rd1_por_rd_sop  <= port6_por_rd_sop;
        rd1_por_rd_eop  <= port6_por_rd_eop;
        rd1_por_rd_vld  <= port6_por_rd_vld;
        rd1_por_rd_data <= port6_data_out;
	end	
	else if(data_ren_port7 == 4'd1)
	begin
        rd1_por_rd_sop  <= port7_por_rd_sop;
        rd1_por_rd_eop  <= port7_por_rd_eop;
        rd1_por_rd_vld  <= port7_por_rd_vld;
        rd1_por_rd_data <= port7_data_out;
	end	
	else if(data_ren_port8 == 4'd1)
	begin
        rd1_por_rd_sop  <= port8_por_rd_sop;
        rd1_por_rd_eop  <= port8_por_rd_eop;
        rd1_por_rd_vld  <= port8_por_rd_vld;
        rd1_por_rd_data <= port8_data_out;
	end	
	else if(data_ren_port9 == 4'd1)
	begin
        rd1_por_rd_sop  <= port9_por_rd_sop;
        rd1_por_rd_eop  <= port9_por_rd_eop;
        rd1_por_rd_vld  <= port9_por_rd_vld;
        rd1_por_rd_data <= port9_data_out;
	end	
	else if(data_ren_port10 == 4'd1)
	begin
        rd1_por_rd_sop  <= port10_por_rd_sop;
        rd1_por_rd_eop  <= port10_por_rd_eop;
        rd1_por_rd_vld  <= port10_por_rd_vld;
        rd1_por_rd_data <= port10_data_out;
	end	
	else if(data_ren_port11 == 4'd1)
	begin
        rd1_por_rd_sop  <= port11_por_rd_sop;
        rd1_por_rd_eop  <= port11_por_rd_eop;
        rd1_por_rd_vld  <= port11_por_rd_vld;
        rd1_por_rd_data <= port11_data_out;
	end	
	else if(data_ren_port12 == 4'd1)
	begin
        rd1_por_rd_sop  <= port12_por_rd_sop;
        rd1_por_rd_eop  <= port12_por_rd_eop;
        rd1_por_rd_vld  <= port12_por_rd_vld;
        rd1_por_rd_data <= port12_data_out;
	end	
	else if(data_ren_port13 == 4'd1)
	begin
        rd1_por_rd_sop  <= port13_por_rd_sop;
        rd1_por_rd_eop  <= port13_por_rd_eop;
        rd1_por_rd_vld  <= port13_por_rd_vld;
        rd1_por_rd_data <= port13_data_out;
	end	
	else if(data_ren_port14 == 4'd1)
	begin
        rd1_por_rd_sop  <= port14_por_rd_sop;
        rd1_por_rd_eop  <= port14_por_rd_eop;
        rd1_por_rd_vld  <= port14_por_rd_vld;
        rd1_por_rd_data <= port14_data_out;
	end	
	else if(data_ren_port15 == 4'd1)
	begin
        rd1_por_rd_sop  <= port15_por_rd_sop;
        rd1_por_rd_eop  <= port15_por_rd_eop;
        rd1_por_rd_vld  <= port15_por_rd_vld;
        rd1_por_rd_data <= port15_data_out;
	end	
	//端口1从SRAM中读
	else if(ctrl_flag == 5'h11)
	begin
        rd1_por_rd_sop  <= rd_por_rd_sop ;
        rd1_por_rd_eop  <= rd_por_rd_eop ;
        rd1_por_rd_vld  <= rd_por_rd_vld ;
        rd1_por_rd_data <= rd_por_rd_data;
	end	
	else
	begin
        rd1_por_rd_sop  <= 1'd0;
        rd1_por_rd_eop  <= 1'd0;
        rd1_por_rd_vld  <= 1'd0;
        rd1_por_rd_data <= 8'd0;
	end	
end

//端口2~15此处省略，如有需要仿照上面端口0,1复制即可。


//************************************* check ********************************************//

//数据校验
check u_check0(

    .sys_clk	  (sys_clk	),
    .sys_rst	  (sys_rst	),
    .por_rd_sop   (rd0_por_rd_sop ),
    .por_rd_eop   (rd0_por_rd_eop ),
    .por_rd_vld   (rd0_por_rd_vld ),
    .por_rd_data  (rd0_por_rd_data),
    .rd_sop       (port0_rd_sop     ),
    .rd_eop       (port0_rd_eop     ),
    .rd_vld       (port0_rd_vld     ),
    .rd_data      (port0_rd_data    )//端口0最终输出数据
    );
	
check u_check1(

    .sys_clk	  (sys_clk	),
    .sys_rst	  (sys_rst	),
    .por_rd_sop   (rd1_por_rd_sop ),
    .por_rd_eop   (rd1_por_rd_eop ),
    .por_rd_vld   (rd1_por_rd_vld ),
    .por_rd_data  (rd1_por_rd_data),
    .rd_sop       (port1_rd_sop     ),
    .rd_eop       (port1_rd_eop     ),
    .rd_vld       (port1_rd_vld     ),
    .rd_data      (port1_rd_data    )//端口1最终输出数据
    );

//读端口2~15此处省略，如有需要仿照上面端口0,1复制即可。


//************************************* addr_gen ********************************************//

//每个输入端口产生向dest输出端口的queue信息
addr_gen u_addr_gen0(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port0_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port0_data_info_vld	),    	
//    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
//    .port_idle			(16'h2			),//16个端口空闲标识信号,模块sim，dest端口空闲
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号,模块sim，dest端口忙
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port0_data_ren   		),
    .data_ren_port       (data_ren_port0   		),
    .req_addr	        (port0_req_addr   		),//请求写地址
    .req_done	        (port0_req_done   		),//请求写地址允许
//    .req_done	        (1'b1   		),//请求写地址允许
    .addr_done          (port0_addr_done		),//写地址完成
	.addr_use			(port0_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port0_rd0_que_info_vld ),	
	.queue_info_vld1	(port0_rd1_que_info_vld ),	
	.queue_info_vld2	(port0_rd2_que_info_vld ),	
	.queue_info_vld3	(port0_rd3_que_info_vld ),	
	.queue_info_vld4	(port0_rd4_que_info_vld ),	
	.queue_info_vld5	(port0_rd5_que_info_vld ),	
	.queue_info_vld6	(port0_rd6_que_info_vld ),	
	.queue_info_vld7	(port0_rd7_que_info_vld ),	
	.queue_info_vld8	(port0_rd8_que_info_vld ),	
	.queue_info_vld9	(port0_rd9_que_info_vld ),	
	.queue_info_vld10	(port0_rd10_que_info_vld),
	.queue_info_vld11	(port0_rd11_que_info_vld),
	.queue_info_vld12	(port0_rd12_que_info_vld),
	.queue_info_vld13	(port0_rd13_que_info_vld),
	.queue_info_vld14	(port0_rd14_que_info_vld),
	.queue_info_vld15	(port0_rd15_que_info_vld),
	.queue_info	        (port0_que_info	        ),

	.por_rd_sop         (port0_por_rd_sop		),
	.por_rd_eop         (port0_por_rd_eop		),
	.por_rd_vld         (port0_por_rd_vld		)
);	

addr_gen u_addr_gen1(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port1_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port1_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port1_data_ren   		),
    .data_ren_port      (data_ren_port1   		),
    .req_addr	        (port1_req_addr   		),//请求写地址
    .req_done	        (port1_req_done   		),//请求写地址允许
    .addr_done          (port1_addr_done		),//写地址完成
	.addr_use			(port1_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port1_rd0_que_info_vld ),	
	.queue_info_vld1	(port1_rd1_que_info_vld ),	
	.queue_info_vld2	(port1_rd2_que_info_vld ),	
	.queue_info_vld3	(port1_rd3_que_info_vld ),	
	.queue_info_vld4	(port1_rd4_que_info_vld ),	
	.queue_info_vld5	(port1_rd5_que_info_vld ),	
	.queue_info_vld6	(port1_rd6_que_info_vld ),	
	.queue_info_vld7	(port1_rd7_que_info_vld ),	
	.queue_info_vld8	(port1_rd8_que_info_vld ),	
	.queue_info_vld9	(port1_rd9_que_info_vld ),	
	.queue_info_vld10	(port1_rd10_que_info_vld),
	.queue_info_vld11	(port1_rd11_que_info_vld),
	.queue_info_vld12	(port1_rd12_que_info_vld),
	.queue_info_vld13	(port1_rd13_que_info_vld),
	.queue_info_vld14	(port1_rd14_que_info_vld),
	.queue_info_vld15	(port1_rd15_que_info_vld),
	.queue_info	        (port1_que_info	        )
);

addr_gen u_addr_gen2(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port2_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port2_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port2_data_ren   		),
    .data_ren_port       (data_ren_port2   		),
    .req_addr	        (port2_req_addr   		),//请求写地址
    .req_done	        (port2_req_done   		),//请求写地址允许
    .addr_done          (port2_addr_done		),//写地址完成
	.addr_use			(port2_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port2_rd0_que_info_vld ),	
	.queue_info_vld1	(port2_rd1_que_info_vld ),	
	.queue_info_vld2	(port2_rd2_que_info_vld ),	
	.queue_info_vld3	(port2_rd3_que_info_vld ),	
	.queue_info_vld4	(port2_rd4_que_info_vld ),	
	.queue_info_vld5	(port2_rd5_que_info_vld ),	
	.queue_info_vld6	(port2_rd6_que_info_vld ),	
	.queue_info_vld7	(port2_rd7_que_info_vld ),	
	.queue_info_vld8	(port2_rd8_que_info_vld ),	
	.queue_info_vld9	(port2_rd9_que_info_vld ),	
	.queue_info_vld10	(port2_rd10_que_info_vld),
	.queue_info_vld11	(port2_rd11_que_info_vld),
	.queue_info_vld12	(port2_rd12_que_info_vld),
	.queue_info_vld13	(port2_rd13_que_info_vld),
	.queue_info_vld14	(port2_rd14_que_info_vld),
	.queue_info_vld15	(port2_rd15_que_info_vld),
	.queue_info	        (port2_que_info	        )
);

addr_gen u_addr_gen3(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port3_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port3_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port3_data_ren   		),
    .data_ren_port       (data_ren_port3   		),
    .req_addr	        (port3_req_addr   		),//请求写地址
    .req_done	        (port3_req_done   		),//请求写地址允许
    .addr_done          (port3_addr_done		),//写地址完成
	.addr_use			(port3_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port3_rd0_que_info_vld ),	
	.queue_info_vld1	(port3_rd1_que_info_vld ),	
	.queue_info_vld2	(port3_rd2_que_info_vld ),	
	.queue_info_vld3	(port3_rd3_que_info_vld ),	
	.queue_info_vld4	(port3_rd4_que_info_vld ),	
	.queue_info_vld5	(port3_rd5_que_info_vld ),	
	.queue_info_vld6	(port3_rd6_que_info_vld ),	
	.queue_info_vld7	(port3_rd7_que_info_vld ),	
	.queue_info_vld8	(port3_rd8_que_info_vld ),	
	.queue_info_vld9	(port3_rd9_que_info_vld ),	
	.queue_info_vld10	(port3_rd10_que_info_vld),
	.queue_info_vld11	(port3_rd11_que_info_vld),
	.queue_info_vld12	(port3_rd12_que_info_vld),
	.queue_info_vld13	(port3_rd13_que_info_vld),
	.queue_info_vld14	(port3_rd14_que_info_vld),
	.queue_info_vld15	(port3_rd15_que_info_vld),
	.queue_info	        (port3_que_info	        )
);

addr_gen u_addr_gen4(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port4_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port4_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port4_data_ren   		),
    .data_ren_port       (data_ren_port4   		),
    .req_addr	        (port4_req_addr   		),//请求写地址
    .req_done	        (port4_req_done   		),//请求写地址允许
    .addr_done          (port4_addr_done		),//写地址完成
	.addr_use			(port4_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port4_rd0_que_info_vld ),	
	.queue_info_vld1	(port4_rd1_que_info_vld ),	
	.queue_info_vld2	(port4_rd2_que_info_vld ),	
	.queue_info_vld3	(port4_rd3_que_info_vld ),	
	.queue_info_vld4	(port4_rd4_que_info_vld ),	
	.queue_info_vld5	(port4_rd5_que_info_vld ),	
	.queue_info_vld6	(port4_rd6_que_info_vld ),	
	.queue_info_vld7	(port4_rd7_que_info_vld ),	
	.queue_info_vld8	(port4_rd8_que_info_vld ),	
	.queue_info_vld9	(port4_rd9_que_info_vld ),	
	.queue_info_vld10	(port4_rd10_que_info_vld),
	.queue_info_vld11	(port4_rd11_que_info_vld),
	.queue_info_vld12	(port4_rd12_que_info_vld),
	.queue_info_vld13	(port4_rd13_que_info_vld),
	.queue_info_vld14	(port4_rd14_que_info_vld),
	.queue_info_vld15	(port4_rd15_que_info_vld),
	.queue_info	        (port4_que_info	        )
);

addr_gen u_addr_gen5(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port5_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port5_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port5_data_ren   		),
    .data_ren_port       (data_ren_port5   		),
    .req_addr	        (port5_req_addr   		),//请求写地址
    .req_done	        (port5_req_done   		),//请求写地址允许
    .addr_done          (port5_addr_done		),//写地址完成
	.addr_use			(port5_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port5_rd0_que_info_vld ),	
	.queue_info_vld1	(port5_rd1_que_info_vld ),	
	.queue_info_vld2	(port5_rd2_que_info_vld ),	
	.queue_info_vld3	(port5_rd3_que_info_vld ),	
	.queue_info_vld4	(port5_rd4_que_info_vld ),	
	.queue_info_vld5	(port5_rd5_que_info_vld ),	
	.queue_info_vld6	(port5_rd6_que_info_vld ),	
	.queue_info_vld7	(port5_rd7_que_info_vld ),	
	.queue_info_vld8	(port5_rd8_que_info_vld ),	
	.queue_info_vld9	(port5_rd9_que_info_vld ),	
	.queue_info_vld10	(port5_rd10_que_info_vld),
	.queue_info_vld11	(port5_rd11_que_info_vld),
	.queue_info_vld12	(port5_rd12_que_info_vld),
	.queue_info_vld13	(port5_rd13_que_info_vld),
	.queue_info_vld14	(port5_rd14_que_info_vld),
	.queue_info_vld15	(port5_rd15_que_info_vld),
	.queue_info	        (port5_que_info	        )
);

addr_gen u_addr_gen6(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port6_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port6_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port6_data_ren   		),
    .data_ren_port       (data_ren_port6   		),
    .req_addr	        (port6_req_addr   		),//请求写地址
    .req_done	        (port6_req_done   		),//请求写地址允许
    .addr_done          (port6_addr_done		),//写地址完成
	.addr_use			(port6_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port6_rd0_que_info_vld ),	
	.queue_info_vld1	(port6_rd1_que_info_vld ),	
	.queue_info_vld2	(port6_rd2_que_info_vld ),	
	.queue_info_vld3	(port6_rd3_que_info_vld ),	
	.queue_info_vld4	(port6_rd4_que_info_vld ),	
	.queue_info_vld5	(port6_rd5_que_info_vld ),	
	.queue_info_vld6	(port6_rd6_que_info_vld ),	
	.queue_info_vld7	(port6_rd7_que_info_vld ),	
	.queue_info_vld8	(port6_rd8_que_info_vld ),	
	.queue_info_vld9	(port6_rd9_que_info_vld ),	
	.queue_info_vld10	(port6_rd10_que_info_vld),
	.queue_info_vld11	(port6_rd11_que_info_vld),
	.queue_info_vld12	(port6_rd12_que_info_vld),
	.queue_info_vld13	(port6_rd13_que_info_vld),
	.queue_info_vld14	(port6_rd14_que_info_vld),
	.queue_info_vld15	(port6_rd15_que_info_vld),
	.queue_info	        (port6_que_info	        )
);

addr_gen u_addr_gen7(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port7_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port7_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port7_data_ren   		),
    .data_ren_port       (data_ren_port7   		),
    .req_addr	        (port7_req_addr   		),//请求写地址
    .req_done	        (port7_req_done   		),//请求写地址允许
    .addr_done          (port7_addr_done		),//写地址完成
	.addr_use			(port7_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port7_rd0_que_info_vld ),	
	.queue_info_vld1	(port7_rd1_que_info_vld ),	
	.queue_info_vld2	(port7_rd2_que_info_vld ),	
	.queue_info_vld3	(port7_rd3_que_info_vld ),	
	.queue_info_vld4	(port7_rd4_que_info_vld ),	
	.queue_info_vld5	(port7_rd5_que_info_vld ),	
	.queue_info_vld6	(port7_rd6_que_info_vld ),	
	.queue_info_vld7	(port7_rd7_que_info_vld ),	
	.queue_info_vld8	(port7_rd8_que_info_vld ),	
	.queue_info_vld9	(port7_rd9_que_info_vld ),	
	.queue_info_vld10	(port7_rd10_que_info_vld),
	.queue_info_vld11	(port7_rd11_que_info_vld),
	.queue_info_vld12	(port7_rd12_que_info_vld),
	.queue_info_vld13	(port7_rd13_que_info_vld),
	.queue_info_vld14	(port7_rd14_que_info_vld),
	.queue_info_vld15	(port7_rd15_que_info_vld),
	.queue_info	        (port7_que_info	        )
);

addr_gen u_addr_gen8(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port8_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port8_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port8_data_ren   		),
    .data_ren_port       (data_ren_port8   		),
    .req_addr	        (port8_req_addr   		),//请求写地址
    .req_done	        (port8_req_done   		),//请求写地址允许
    .addr_done          (port8_addr_done		),//写地址完成
	.addr_use			(port8_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port8_rd0_que_info_vld ),	
	.queue_info_vld1	(port8_rd1_que_info_vld ),	
	.queue_info_vld2	(port8_rd2_que_info_vld ),	
	.queue_info_vld3	(port8_rd3_que_info_vld ),	
	.queue_info_vld4	(port8_rd4_que_info_vld ),	
	.queue_info_vld5	(port8_rd5_que_info_vld ),	
	.queue_info_vld6	(port8_rd6_que_info_vld ),	
	.queue_info_vld7	(port8_rd7_que_info_vld ),	
	.queue_info_vld8	(port8_rd8_que_info_vld ),	
	.queue_info_vld9	(port8_rd9_que_info_vld ),	
	.queue_info_vld10	(port8_rd10_que_info_vld),
	.queue_info_vld11	(port8_rd11_que_info_vld),
	.queue_info_vld12	(port8_rd12_que_info_vld),
	.queue_info_vld13	(port8_rd13_que_info_vld),
	.queue_info_vld14	(port8_rd14_que_info_vld),
	.queue_info_vld15	(port8_rd15_que_info_vld),
	.queue_info	        (port8_que_info	        )
);

addr_gen u_addr_gen9(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port9_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port9_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port9_data_ren   		),
    .data_ren_port       (data_ren_port9   		),
    .req_addr	        (port9_req_addr   		),//请求写地址
    .req_done	        (port9_req_done   		),//请求写地址允许
    .addr_done          (port9_addr_done		),//写地址完成
	.addr_use			(port9_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port9_rd0_que_info_vld ),	
	.queue_info_vld1	(port9_rd1_que_info_vld ),	
	.queue_info_vld2	(port9_rd2_que_info_vld ),	
	.queue_info_vld3	(port9_rd3_que_info_vld ),	
	.queue_info_vld4	(port9_rd4_que_info_vld ),	
	.queue_info_vld5	(port9_rd5_que_info_vld ),	
	.queue_info_vld6	(port9_rd6_que_info_vld ),	
	.queue_info_vld7	(port9_rd7_que_info_vld ),	
	.queue_info_vld8	(port9_rd8_que_info_vld ),	
	.queue_info_vld9	(port9_rd9_que_info_vld ),	
	.queue_info_vld10	(port9_rd10_que_info_vld),
	.queue_info_vld11	(port9_rd11_que_info_vld),
	.queue_info_vld12	(port9_rd12_que_info_vld),
	.queue_info_vld13	(port9_rd13_que_info_vld),
	.queue_info_vld14	(port9_rd14_que_info_vld),
	.queue_info_vld15	(port9_rd15_que_info_vld),
	.queue_info	        (port9_que_info	        )
);

addr_gen u_addr_gen10(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port10_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port10_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port10_data_ren   		),
    .data_ren_port       (data_ren_port10   		),
    .req_addr	        (port10_req_addr   		),//请求写地址
    .req_done	        (port10_req_done   		),//请求写地址允许
    .addr_done          (port10_addr_done		),//写地址完成
	.addr_use			(port10_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port10_rd0_que_info_vld ),	
	.queue_info_vld1	(port10_rd1_que_info_vld ),	
	.queue_info_vld2	(port10_rd2_que_info_vld ),	
	.queue_info_vld3	(port10_rd3_que_info_vld ),	
	.queue_info_vld4	(port10_rd4_que_info_vld ),	
	.queue_info_vld5	(port10_rd5_que_info_vld ),	
	.queue_info_vld6	(port10_rd6_que_info_vld ),	
	.queue_info_vld7	(port10_rd7_que_info_vld ),	
	.queue_info_vld8	(port10_rd8_que_info_vld ),	
	.queue_info_vld9	(port10_rd9_que_info_vld ),	
	.queue_info_vld10	(port10_rd10_que_info_vld),
	.queue_info_vld11	(port10_rd11_que_info_vld),
	.queue_info_vld12	(port10_rd12_que_info_vld),
	.queue_info_vld13	(port10_rd13_que_info_vld),
	.queue_info_vld14	(port10_rd14_que_info_vld),
	.queue_info_vld15	(port10_rd15_que_info_vld),
	.queue_info	        (port10_que_info	        )
);

addr_gen u_addr_gen11(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port11_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port11_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port11_data_ren   		),
    .data_ren_port       (data_ren_port11   		),
    .req_addr	        (port11_req_addr   		),//请求写地址
    .req_done	        (port11_req_done   		),//请求写地址允许
    .addr_done          (port11_addr_done		),//写地址完成
	.addr_use			(port11_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port11_rd0_que_info_vld ),	
	.queue_info_vld1	(port11_rd1_que_info_vld ),	
	.queue_info_vld2	(port11_rd2_que_info_vld ),	
	.queue_info_vld3	(port11_rd3_que_info_vld ),	
	.queue_info_vld4	(port11_rd4_que_info_vld ),	
	.queue_info_vld5	(port11_rd5_que_info_vld ),	
	.queue_info_vld6	(port11_rd6_que_info_vld ),	
	.queue_info_vld7	(port11_rd7_que_info_vld ),	
	.queue_info_vld8	(port11_rd8_que_info_vld ),	
	.queue_info_vld9	(port11_rd9_que_info_vld ),	
	.queue_info_vld10	(port11_rd10_que_info_vld),
	.queue_info_vld11	(port11_rd11_que_info_vld),
	.queue_info_vld12	(port11_rd12_que_info_vld),
	.queue_info_vld13	(port11_rd13_que_info_vld),
	.queue_info_vld14	(port11_rd14_que_info_vld),
	.queue_info_vld15	(port11_rd15_que_info_vld),
	.queue_info	        (port11_que_info	        )
);

addr_gen u_addr_gen12(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port12_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port12_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port12_data_ren   		),
    .data_ren_port       (data_ren_port12   		),
    .req_addr	        (port12_req_addr   		),//请求写地址
    .req_done	        (port12_req_done   		),//请求写地址允许
    .addr_done          (port12_addr_done		),//写地址完成
	.addr_use			(port12_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port12_rd0_que_info_vld ),	
	.queue_info_vld1	(port12_rd1_que_info_vld ),	
	.queue_info_vld2	(port12_rd2_que_info_vld ),	
	.queue_info_vld3	(port12_rd3_que_info_vld ),	
	.queue_info_vld4	(port12_rd4_que_info_vld ),	
	.queue_info_vld5	(port12_rd5_que_info_vld ),	
	.queue_info_vld6	(port12_rd6_que_info_vld ),	
	.queue_info_vld7	(port12_rd7_que_info_vld ),	
	.queue_info_vld8	(port12_rd8_que_info_vld ),	
	.queue_info_vld9	(port12_rd9_que_info_vld ),	
	.queue_info_vld10	(port12_rd10_que_info_vld),
	.queue_info_vld11	(port12_rd11_que_info_vld),
	.queue_info_vld12	(port12_rd12_que_info_vld),
	.queue_info_vld13	(port12_rd13_que_info_vld),
	.queue_info_vld14	(port12_rd14_que_info_vld),
	.queue_info_vld15	(port12_rd15_que_info_vld),
	.queue_info	        (port12_que_info	        )
);

addr_gen u_addr_gen13(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port13_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port13_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port13_data_ren   		),
    .data_ren_port      (data_ren_port13   		),
    .req_addr	        (port13_req_addr   		),//请求写地址
    .req_done	        (port13_req_done   		),//请求写地址允许
    .addr_done          (port13_addr_done		),//写地址完成
	.addr_use			(port13_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port13_rd0_que_info_vld ),	
	.queue_info_vld1	(port13_rd1_que_info_vld ),	
	.queue_info_vld2	(port13_rd2_que_info_vld ),	
	.queue_info_vld3	(port13_rd3_que_info_vld ),	
	.queue_info_vld4	(port13_rd4_que_info_vld ),	
	.queue_info_vld5	(port13_rd5_que_info_vld ),	
	.queue_info_vld6	(port13_rd6_que_info_vld ),	
	.queue_info_vld7	(port13_rd7_que_info_vld ),	
	.queue_info_vld8	(port13_rd8_que_info_vld ),	
	.queue_info_vld9	(port13_rd9_que_info_vld ),	
	.queue_info_vld10	(port13_rd10_que_info_vld),
	.queue_info_vld11	(port13_rd11_que_info_vld),
	.queue_info_vld12	(port13_rd12_que_info_vld),
	.queue_info_vld13	(port13_rd13_que_info_vld),
	.queue_info_vld14	(port13_rd14_que_info_vld),
	.queue_info_vld15	(port13_rd15_que_info_vld),
	.queue_info	        (port13_que_info	        )
);

addr_gen u_addr_gen14(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port14_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port14_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port14_data_ren   		),
    .data_ren_port       (data_ren_port14   		),
    .req_addr	        (port14_req_addr   		),//请求写地址
    .req_done	        (port14_req_done   		),//请求写地址允许
    .addr_done          (port14_addr_done		),//写地址完成
	.addr_use			(port14_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port14_rd0_que_info_vld ),	
	.queue_info_vld1	(port14_rd1_que_info_vld ),	
	.queue_info_vld2	(port14_rd2_que_info_vld ),	
	.queue_info_vld3	(port14_rd3_que_info_vld ),	
	.queue_info_vld4	(port14_rd4_que_info_vld ),	
	.queue_info_vld5	(port14_rd5_que_info_vld ),	
	.queue_info_vld6	(port14_rd6_que_info_vld ),	
	.queue_info_vld7	(port14_rd7_que_info_vld ),	
	.queue_info_vld8	(port14_rd8_que_info_vld ),	
	.queue_info_vld9	(port14_rd9_que_info_vld ),	
	.queue_info_vld10	(port14_rd10_que_info_vld),
	.queue_info_vld11	(port14_rd11_que_info_vld),
	.queue_info_vld12	(port14_rd12_que_info_vld),
	.queue_info_vld13	(port14_rd13_que_info_vld),
	.queue_info_vld14	(port14_rd14_que_info_vld),
	.queue_info_vld15	(port14_rd15_que_info_vld),
	.queue_info	        (port14_que_info	        )
);

addr_gen u_addr_gen15(
    .sys_clk			(sys_clk				),
    .sys_rst			(sys_rst				),
    .data_info			(port15_data_info		),//[19:8]:len;[7:4]:pri;[3:0]:dest_port
    .data_info_vld		(port15_data_info_vld	),    	
    .port_idle			(dest_port_idle			),//16个端口空闲标识信号，整体sim
    .sram_idle_cnt		(sram_idle_cnt			),//sram连续为0的计数,	
    .sram_addr   		(sram_addr				),//sram连续为0的初始地址(映射地址0~511)	
    .data_ren           (port15_data_ren   		),
    .data_ren_port       (data_ren_port15   		),
    .req_addr	        (port15_req_addr   		),//请求写地址
    .req_done	        (port15_req_done   		),//请求写地址允许
    .addr_done          (port15_addr_done		),//写地址完成
	.addr_use			(port15_addr_use			),//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	.queue_info_vld0	(port15_rd0_que_info_vld ),	
	.queue_info_vld1	(port15_rd1_que_info_vld ),	
	.queue_info_vld2	(port15_rd2_que_info_vld ),	
	.queue_info_vld3	(port15_rd3_que_info_vld ),	
	.queue_info_vld4	(port15_rd4_que_info_vld ),	
	.queue_info_vld5	(port15_rd5_que_info_vld ),	
	.queue_info_vld6	(port15_rd6_que_info_vld ),	
	.queue_info_vld7	(port15_rd7_que_info_vld ),	
	.queue_info_vld8	(port15_rd8_que_info_vld ),	
	.queue_info_vld9	(port15_rd9_que_info_vld ),	
	.queue_info_vld10	(port15_rd10_que_info_vld),
	.queue_info_vld11	(port15_rd11_que_info_vld),
	.queue_info_vld12	(port15_rd12_que_info_vld),
	.queue_info_vld13	(port15_rd13_que_info_vld),
	.queue_info_vld14	(port15_rd14_que_info_vld),
	.queue_info_vld15	(port15_rd15_que_info_vld),
	.queue_info	        (port15_que_info	        )
);


//************************************* rd_queue ********************************************//

//每个输出端口，接收16个输入端口的queue信息
rd_queue u_queue_gen0(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		(port0_rd0_que_info_vld 	),	
	.port1_info_vld		(port1_rd0_que_info_vld 	),	
	.port2_info_vld		(port2_rd0_que_info_vld 	),	
	.port3_info_vld		(port3_rd0_que_info_vld 	),	
	.port4_info_vld		(port4_rd0_que_info_vld 	),	
	.port5_info_vld		(port5_rd0_que_info_vld 	),	
	.port6_info_vld		(port6_rd0_que_info_vld 	),	
	.port7_info_vld		(port7_rd0_que_info_vld 	),	
	.port8_info_vld		(port8_rd0_que_info_vld 	),	
	.port9_info_vld		(port9_rd0_que_info_vld 	),	
	.port10_info_vld	(port10_rd0_que_info_vld	),	
	.port11_info_vld	(port11_rd0_que_info_vld	),	
	.port12_info_vld	(port12_rd0_que_info_vld	),	
	.port13_info_vld	(port13_rd0_que_info_vld	),	
	.port14_info_vld	(port14_rd0_que_info_vld	),	
	.port15_info_vld	(port15_rd0_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port0_queue_full			),
	.rd_info			(port0_rd_info				),
	.port_idle			( 					),
	
    .req_addr	        (rd0_req_addr   			),//请求du地址
    .req_done	        (rd0_req_done   			),//请求du地址允许
//    .req_done	        (1'b1   					),//请求du地址允许
    .addr_done          (rd0_addr_done				),//du地址完成
	.addr_use			(rd0_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
	
);	
	
rd_queue u_queue_gen1(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		(port0_rd1_que_info_vld 	),	
	.port1_info_vld		(port1_rd1_que_info_vld 	),	
	.port2_info_vld		(port2_rd1_que_info_vld 	),	
	.port3_info_vld		(port3_rd1_que_info_vld 	),	
	.port4_info_vld		(port4_rd1_que_info_vld 	),	
	.port5_info_vld		(port5_rd1_que_info_vld 	),	
	.port6_info_vld		(port6_rd1_que_info_vld 	),	
	.port7_info_vld		(port7_rd1_que_info_vld 	),	
	.port8_info_vld		(port8_rd1_que_info_vld 	),	
	.port9_info_vld		(port9_rd1_que_info_vld 	),	
	.port10_info_vld	(port10_rd1_que_info_vld	),	
	.port11_info_vld	(port11_rd1_que_info_vld	),	
	.port12_info_vld	(port12_rd1_que_info_vld	),	
	.port13_info_vld	(port13_rd1_que_info_vld	),	
	.port14_info_vld	(port14_rd1_que_info_vld	),	
	.port15_info_vld	(port15_rd1_que_info_vld	),	
	.port0_info	        ({2'd0,port0_que_info[29:0]}),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        ({2'd1,port1_que_info[29:0]}),
	.port2_info	        ({2'd2,port2_que_info[29:0]}),
	.port3_info	        ({2'd3,port3_que_info[29:0]}),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port1_queue_full			),
	.rd_info			(port1_rd_info				),
	.port_idle			( 							),
	
    .req_addr	        (rd1_req_addr   			),//请求du地址
    .req_done	        (|port_rd_re   				),//此处,其他模块需根据需要自行修改
//    .req_done	        (1'b1   					),//请求du地址允许
    .addr_done          (rd1_addr_done				),//du地址完成
	.addr_use			(rd1_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);		

rd_queue u_queue_gen2(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		(port0_rd2_que_info_vld 	),	
	.port1_info_vld		(port1_rd2_que_info_vld 	),	
	.port2_info_vld		(port2_rd2_que_info_vld 	),	
	.port3_info_vld		(port3_rd2_que_info_vld 	),	
	.port4_info_vld		(port4_rd2_que_info_vld 	),	
	.port5_info_vld		(port5_rd2_que_info_vld 	),	
	.port6_info_vld		(port6_rd2_que_info_vld 	),	
	.port7_info_vld		(port7_rd2_que_info_vld 	),	
	.port8_info_vld		(port8_rd2_que_info_vld 	),	
	.port9_info_vld		(port9_rd2_que_info_vld 	),	
	.port10_info_vld	(port10_rd2_que_info_vld	),	
	.port11_info_vld	(port11_rd2_que_info_vld	),	
	.port12_info_vld	(port12_rd2_que_info_vld	),	
	.port13_info_vld	(port13_rd2_que_info_vld	),	
	.port14_info_vld	(port14_rd2_que_info_vld	),	
	.port15_info_vld	(port15_rd2_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port2_queue_full			),
	.rd_info			(port2_rd_info				),
	.port_idle			( 					),
    .req_addr	        (rd2_req_addr   			),//请求du地址
    .req_done	        (rd2_req_done   			),//请求du地址允许
    .addr_done          (rd2_addr_done				),//du地址完成
	.addr_use			(rd2_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen3(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		(port0_rd3_que_info_vld 	),	
	.port1_info_vld		(port1_rd3_que_info_vld 	),	
	.port2_info_vld		(port2_rd3_que_info_vld 	),	
	.port3_info_vld		(port3_rd3_que_info_vld 	),	
	.port4_info_vld		(port4_rd3_que_info_vld 	),	
	.port5_info_vld		(port5_rd3_que_info_vld 	),	
	.port6_info_vld		(port6_rd3_que_info_vld 	),	
	.port7_info_vld		(port7_rd3_que_info_vld 	),	
	.port8_info_vld		(port8_rd3_que_info_vld 	),	
	.port9_info_vld		(port9_rd3_que_info_vld 	),	
	.port10_info_vld	(port10_rd3_que_info_vld	),	
	.port11_info_vld	(port11_rd3_que_info_vld	),	
	.port12_info_vld	(port12_rd3_que_info_vld	),	
	.port13_info_vld	(port13_rd3_que_info_vld	),	
	.port14_info_vld	(port14_rd3_que_info_vld	),	
	.port15_info_vld	(port15_rd3_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port3_queue_full			),
	.rd_info			(port3_rd_info				),
	.port_idle			( 					),
    .req_addr	        (rd3_req_addr   			),//请求du地址
    .req_done	        (rd3_req_done   			),//请求du地址允许
    .addr_done          (rd3_addr_done				),//du地址完成
	.addr_use			(rd3_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen4(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		(port0_rd4_que_info_vld 	),	
	.port1_info_vld		(port1_rd4_que_info_vld 	),	
	.port2_info_vld		(port2_rd4_que_info_vld 	),	
	.port3_info_vld		(port3_rd4_que_info_vld 	),	
	.port4_info_vld		(port4_rd4_que_info_vld 	),	
	.port5_info_vld		(port5_rd4_que_info_vld 	),	
	.port6_info_vld		(port6_rd4_que_info_vld 	),	
	.port7_info_vld		(port7_rd4_que_info_vld 	),	
	.port8_info_vld		(port8_rd4_que_info_vld 	),	
	.port9_info_vld		(port9_rd4_que_info_vld 	),	
	.port10_info_vld	(port10_rd4_que_info_vld	),	
	.port11_info_vld	(port11_rd4_que_info_vld	),	
	.port12_info_vld	(port12_rd4_que_info_vld	),	
	.port13_info_vld	(port13_rd4_que_info_vld	),	
	.port14_info_vld	(port14_rd4_que_info_vld	),	
	.port15_info_vld	(port15_rd4_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port4_queue_full			),
	.rd_info			(port4_rd_info				),
	.port_idle			( 					),
    .req_addr	        (rd4_req_addr   			),//请求du地址
    .req_done	        (rd4_req_done   			),//请求du地址允许
    .addr_done          (rd4_addr_done				),//du地址完成
	.addr_use			(rd4_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen5(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		(port0_rd5_que_info_vld 	),	
	.port1_info_vld		(port1_rd5_que_info_vld 	),	
	.port2_info_vld		(port2_rd5_que_info_vld 	),	
	.port3_info_vld		(port3_rd5_que_info_vld 	),	
	.port4_info_vld		(port4_rd5_que_info_vld 	),	
	.port5_info_vld		(port5_rd5_que_info_vld 	),	
	.port6_info_vld		(port6_rd5_que_info_vld 	),	
	.port7_info_vld		(port7_rd5_que_info_vld 	),	
	.port8_info_vld		(port8_rd5_que_info_vld 	),	
	.port9_info_vld		(port9_rd5_que_info_vld 	),	
	.port10_info_vld	(port10_rd5_que_info_vld	),	
	.port11_info_vld	(port11_rd5_que_info_vld	),	
	.port12_info_vld	(port12_rd5_que_info_vld	),	
	.port13_info_vld	(port13_rd5_que_info_vld	),	
	.port14_info_vld	(port14_rd5_que_info_vld	),	
	.port15_info_vld	(port15_rd5_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port5_queue_full			),
	.rd_info			(port5_rd_info				),
	.port_idle			( 					),
    .req_addr	        (rd5_req_addr   			),//请求du地址
    .req_done	        (rd5_req_done   			),//请求du地址允许
    .addr_done          (rd5_addr_done				),//du地址完成
	.addr_use			(rd5_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen6(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		(port0_rd6_que_info_vld 	),	
	.port1_info_vld		(port1_rd6_que_info_vld 	),	
	.port2_info_vld		(port2_rd6_que_info_vld 	),	
	.port3_info_vld		(port3_rd6_que_info_vld 	),	
	.port4_info_vld		(port4_rd6_que_info_vld 	),	
	.port5_info_vld		(port5_rd6_que_info_vld 	),	
	.port6_info_vld		(port6_rd6_que_info_vld 	),	
	.port7_info_vld		(port7_rd6_que_info_vld 	),	
	.port8_info_vld		(port8_rd6_que_info_vld 	),	
	.port9_info_vld		(port9_rd6_que_info_vld 	),	
	.port10_info_vld	(port10_rd6_que_info_vld	),	
	.port11_info_vld	(port11_rd6_que_info_vld	),	
	.port12_info_vld	(port12_rd6_que_info_vld	),	
	.port13_info_vld	(port13_rd6_que_info_vld	),	
	.port14_info_vld	(port14_rd6_que_info_vld	),	
	.port15_info_vld	(port15_rd6_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port6_queue_full			),
	.rd_info			(port6_rd_info				),
	.port_idle			( 					),
    .req_addr	        (rd6_req_addr   			),//请求du地址
    .req_done	        (rd6_req_done   			),//请求du地址允许
    .addr_done          (rd6_addr_done				),//du地址完成
	.addr_use			(rd6_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen7(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd7_que_info_vld 	),	
	.port1_info_vld		( port1_rd7_que_info_vld 	),	
	.port2_info_vld		( port2_rd7_que_info_vld 	),	
	.port3_info_vld		( port3_rd7_que_info_vld 	),	
	.port4_info_vld		( port4_rd7_que_info_vld 	),	
	.port5_info_vld		( port5_rd7_que_info_vld 	),	
	.port6_info_vld		( port6_rd7_que_info_vld 	),	
	.port7_info_vld		( port7_rd7_que_info_vld 	),	
	.port8_info_vld		( port8_rd7_que_info_vld 	),	
	.port9_info_vld		( port9_rd7_que_info_vld 	),	
	.port10_info_vld	(port10_rd7_que_info_vld	),	
	.port11_info_vld	(port11_rd7_que_info_vld	),	
	.port12_info_vld	(port12_rd7_que_info_vld	),	
	.port13_info_vld	(port13_rd7_que_info_vld	),	
	.port14_info_vld	(port14_rd7_que_info_vld	),	
	.port15_info_vld	(port15_rd7_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port7_queue_full			),
	.rd_info			(port7_rd_info				),
	.port_idle			( 					),
    .req_addr	        (  rd7_req_addr   			),//请求du地址
    .req_done	        (  rd7_req_done   			),//请求du地址允许
    .addr_done          (  rd7_addr_done			),//du地址完成
	.addr_use			(  rd7_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen8(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd8_que_info_vld 	),	
	.port1_info_vld		( port1_rd8_que_info_vld 	),	
	.port2_info_vld		( port2_rd8_que_info_vld 	),	
	.port3_info_vld		( port3_rd8_que_info_vld 	),	
	.port4_info_vld		( port4_rd8_que_info_vld 	),	
	.port5_info_vld		( port5_rd8_que_info_vld 	),	
	.port6_info_vld		( port6_rd8_que_info_vld 	),	
	.port7_info_vld		( port7_rd8_que_info_vld 	),	
	.port8_info_vld		( port8_rd8_que_info_vld 	),	
	.port9_info_vld		( port9_rd8_que_info_vld 	),	
	.port10_info_vld	(port10_rd8_que_info_vld	),	
	.port11_info_vld	(port11_rd8_que_info_vld	),	
	.port12_info_vld	(port12_rd8_que_info_vld	),	
	.port13_info_vld	(port13_rd8_que_info_vld	),	
	.port14_info_vld	(port14_rd8_que_info_vld	),	
	.port15_info_vld	(port15_rd8_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port8_queue_full			),
	.rd_info			(port8_rd_info				),
	.port_idle			( 					),
    .req_addr	        (  rd8_req_addr   			),//请求du地址
    .req_done	        (  rd8_req_done   			),//请求du地址允许
    .addr_done          (  rd8_addr_done			),//du地址完成
	.addr_use			(  rd8_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen9(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd9_que_info_vld 	),	
	.port1_info_vld		( port1_rd9_que_info_vld 	),	
	.port2_info_vld		( port2_rd9_que_info_vld 	),	
	.port3_info_vld		( port3_rd9_que_info_vld 	),	
	.port4_info_vld		( port4_rd9_que_info_vld 	),	
	.port5_info_vld		( port5_rd9_que_info_vld 	),	
	.port6_info_vld		( port6_rd9_que_info_vld 	),	
	.port7_info_vld		( port7_rd9_que_info_vld 	),	
	.port8_info_vld		( port8_rd9_que_info_vld 	),	
	.port9_info_vld		( port9_rd9_que_info_vld 	),	
	.port10_info_vld	(port10_rd9_que_info_vld	),	
	.port11_info_vld	(port11_rd9_que_info_vld	),	
	.port12_info_vld	(port12_rd9_que_info_vld	),	
	.port13_info_vld	(port13_rd9_que_info_vld	),	
	.port14_info_vld	(port14_rd9_que_info_vld	),	
	.port15_info_vld	(port15_rd9_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port9_queue_full			),
	.rd_info			(port9_rd_info				),
	.port_idle			( 					),
    .req_addr	        (  rd9_req_addr   			),//请求du地址
    .req_done	        (  rd9_req_done   			),//请求du地址允许
    .addr_done          (  rd9_addr_done			),//du地址完成
	.addr_use			(  rd9_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen10(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd10_que_info_vld 	),	
	.port1_info_vld		( port1_rd10_que_info_vld 	),	
	.port2_info_vld		( port2_rd10_que_info_vld 	),	
	.port3_info_vld		( port3_rd10_que_info_vld 	),	
	.port4_info_vld		( port4_rd10_que_info_vld 	),	
	.port5_info_vld		( port5_rd10_que_info_vld 	),	
	.port6_info_vld		( port6_rd10_que_info_vld 	),	
	.port7_info_vld		( port7_rd10_que_info_vld 	),	
	.port8_info_vld		( port8_rd10_que_info_vld 	),	
	.port9_info_vld		( port9_rd10_que_info_vld 	),	
	.port10_info_vld	(port10_rd10_que_info_vld	),	
	.port11_info_vld	(port11_rd10_que_info_vld	),	
	.port12_info_vld	(port12_rd10_que_info_vld	),	
	.port13_info_vld	(port13_rd10_que_info_vld	),	
	.port14_info_vld	(port14_rd10_que_info_vld	),	
	.port15_info_vld	(port15_rd10_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port10_queue_full			),
	.rd_info			(port10_rd_info				),
	.port_idle			( 					),
    .req_addr	        (  rd10_req_addr   			),//请求du地址
    .req_done	        (  rd10_req_done   			),//请求du地址允许
    .addr_done          (  rd10_addr_done			),//du地址完成
	.addr_use			(  rd10_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen11(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd11_que_info_vld 	),	
	.port1_info_vld		( port1_rd11_que_info_vld 	),	
	.port2_info_vld		( port2_rd11_que_info_vld 	),	
	.port3_info_vld		( port3_rd11_que_info_vld 	),	
	.port4_info_vld		( port4_rd11_que_info_vld 	),	
	.port5_info_vld		( port5_rd11_que_info_vld 	),	
	.port6_info_vld		( port6_rd11_que_info_vld 	),	
	.port7_info_vld		( port7_rd11_que_info_vld 	),	
	.port8_info_vld		( port8_rd11_que_info_vld 	),	
	.port9_info_vld		( port9_rd11_que_info_vld 	),	
	.port10_info_vld	(port10_rd11_que_info_vld	),	
	.port11_info_vld	(port11_rd11_que_info_vld	),	
	.port12_info_vld	(port12_rd11_que_info_vld	),	
	.port13_info_vld	(port13_rd11_que_info_vld	),	
	.port14_info_vld	(port14_rd11_que_info_vld	),	
	.port15_info_vld	(port15_rd11_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port11_queue_full			),
	.rd_info			(port11_rd_info				),
	.port_idle			( 					),
    .req_addr	        (  rd11_req_addr   			),//请求du地址
    .req_done	        (  rd11_req_done   			),//请求du地址允许
    .addr_done          (  rd11_addr_done			),//du地址完成
	.addr_use			(  rd11_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	
	
rd_queue u_queue_gen12(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd12_que_info_vld 	),	
	.port1_info_vld		( port1_rd12_que_info_vld 	),	
	.port2_info_vld		( port2_rd12_que_info_vld 	),	
	.port3_info_vld		( port3_rd12_que_info_vld 	),	
	.port4_info_vld		( port4_rd12_que_info_vld 	),	
	.port5_info_vld		( port5_rd12_que_info_vld 	),	
	.port6_info_vld		( port6_rd12_que_info_vld 	),	
	.port7_info_vld		( port7_rd12_que_info_vld 	),	
	.port8_info_vld		( port8_rd12_que_info_vld 	),	
	.port9_info_vld		( port9_rd12_que_info_vld 	),	
	.port10_info_vld	(port10_rd12_que_info_vld	),	
	.port11_info_vld	(port11_rd12_que_info_vld	),	
	.port12_info_vld	(port12_rd12_que_info_vld	),	
	.port13_info_vld	(port13_rd12_que_info_vld	),	
	.port14_info_vld	(port14_rd12_que_info_vld	),	
	.port15_info_vld	(port15_rd12_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port12_queue_full			),
	.rd_info			(port12_rd_info				),
	.port_idle			( 					),
    .req_addr	        (  rd12_req_addr   			),//请求du地址
    .req_done	        (  rd12_req_done   			),//请求du地址允许
    .addr_done          (  rd12_addr_done			),//du地址完成
	.addr_use			(  rd12_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);		
	
rd_queue u_queue_gen13(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd13_que_info_vld 	),	
	.port1_info_vld		( port1_rd13_que_info_vld 	),	
	.port2_info_vld		( port2_rd13_que_info_vld 	),	
	.port3_info_vld		( port3_rd13_que_info_vld 	),	
	.port4_info_vld		( port4_rd13_que_info_vld 	),	
	.port5_info_vld		( port5_rd13_que_info_vld 	),	
	.port6_info_vld		( port6_rd13_que_info_vld 	),	
	.port7_info_vld		( port7_rd13_que_info_vld 	),	
	.port8_info_vld		( port8_rd13_que_info_vld 	),	
	.port9_info_vld		( port9_rd13_que_info_vld 	),	
	.port10_info_vld	(port10_rd13_que_info_vld	),	
	.port11_info_vld	(port11_rd13_que_info_vld	),	
	.port12_info_vld	(port12_rd13_que_info_vld	),	
	.port13_info_vld	(port13_rd13_que_info_vld	),	
	.port14_info_vld	(port14_rd13_que_info_vld	),	
	.port15_info_vld	(port15_rd13_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port13_queue_full			),
	.rd_info			(port13_rd_info				),
	.port_idle			( 					),
    .req_addr	        (  rd13_req_addr   			),//请求du地址
    .req_done	        (  rd13_req_done   			),//请求du地址允许
    .addr_done          (  rd13_addr_done			),//du地址完成
	.addr_use			(  rd13_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen14(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd14_que_info_vld 	),	
	.port1_info_vld		( port1_rd14_que_info_vld 	),	
	.port2_info_vld		( port2_rd14_que_info_vld 	),	
	.port3_info_vld		( port3_rd14_que_info_vld 	),	
	.port4_info_vld		( port4_rd14_que_info_vld 	),	
	.port5_info_vld		( port5_rd14_que_info_vld 	),	
	.port6_info_vld		( port6_rd14_que_info_vld 	),	
	.port7_info_vld		( port7_rd14_que_info_vld 	),	
	.port8_info_vld		( port8_rd14_que_info_vld 	),	
	.port9_info_vld		( port9_rd14_que_info_vld 	),	
	.port10_info_vld	(port10_rd14_que_info_vld	),	
	.port11_info_vld	(port11_rd14_que_info_vld	),	
	.port12_info_vld	(port12_rd14_que_info_vld	),	
	.port13_info_vld	(port13_rd14_que_info_vld	),	
	.port14_info_vld	(port14_rd14_que_info_vld	),	
	.port15_info_vld	(port15_rd14_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port14_queue_full			),
	.rd_info			(port14_rd_info				),
	.port_idle			( 					),
    .req_addr	        (  rd14_req_addr   			),//请求du地址
    .req_done	        (  rd14_req_done   			),//请求du地址允许
    .addr_done          (  rd14_addr_done			),//du地址完成
	.addr_use			(  rd14_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	

rd_queue u_queue_gen15(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.port0_info_vld		( port0_rd15_que_info_vld 	),	
	.port1_info_vld		( port1_rd15_que_info_vld 	),	
	.port2_info_vld		( port2_rd15_que_info_vld 	),	
	.port3_info_vld		( port3_rd15_que_info_vld 	),	
	.port4_info_vld		( port4_rd15_que_info_vld 	),	
	.port5_info_vld		( port5_rd15_que_info_vld 	),	
	.port6_info_vld		( port6_rd15_que_info_vld 	),	
	.port7_info_vld		( port7_rd15_que_info_vld 	),	
	.port8_info_vld		( port8_rd15_que_info_vld 	),	
	.port9_info_vld		( port9_rd15_que_info_vld 	),	
	.port10_info_vld	(port10_rd15_que_info_vld	),	
	.port11_info_vld	(port11_rd15_que_info_vld	),	
	.port12_info_vld	(port12_rd15_que_info_vld	),	
	.port13_info_vld	(port13_rd15_que_info_vld	),	
	.port14_info_vld	(port14_rd15_que_info_vld	),	
	.port15_info_vld	(port15_rd15_que_info_vld	),	
	.port0_info	        (port0_que_info		        ),//[29:16]:addr_start;[15:4]:len;[3:0]:pri
	.port1_info	        (port1_que_info		        ),
	.port2_info	        (port2_que_info		        ),
	.port3_info	        (port3_que_info		        ),
	.port4_info	        (port4_que_info		        ),
	.port5_info	        (port5_que_info		        ),
	.port6_info	        (port6_que_info		        ),
	.port7_info	        (port7_que_info		        ),
	.port8_info	        (port8_que_info		        ),
	.port9_info	        (port9_que_info		        ),
	.port10_info	    (port10_que_info		    ),
	.port11_info	    (port11_que_info		    ),
	.port12_info	    (port12_que_info		    ),
	.port13_info	    (port13_que_info		    ),
	.port14_info	    (port14_que_info		    ),
	.port15_info	    (port15_que_info		    ),
	.queue_full			(port15_queue_full			),
	.rd_info			(port15_rd_info				),
	.port_idle			(port15_idle					),
    .req_addr	        (  rd15_req_addr   			),//请求du地址
    .req_done	        (  rd15_req_done   			),//请求du地址允许
    .addr_done          (  rd15_addr_done			),//du地址完成
	.addr_use			(  rd15_addr_use				)//具体使用的地址区间{5+512} [511:0]占用的地址，[516:512]32个SRAM的哪一个
);	


//************************************* mult_arbit ********************************************//	

mult_arbit u_mult_arbit(
    .sys_clk			(sys_clk					),
    .sys_rst			(sys_rst					),
	.wr_req_addr		(wr_req_addr				),//写端口请求写地址
	.rd_req_addr		(rd_req_addr				),//读端口请求读地址
	.port_wr_re			(|sram_wr_re				),//写端口ram更新完成信号
	.port_rd_re			(|sram_rd_re				),//读端口ram更新完成信号

    .port0_que_info	    (port0_que_info	            ),
    .port1_que_info	    (port1_que_info	            ),
    .port2_que_info	    (port2_que_info	            ),
    .port3_que_info	    (port3_que_info	            ),
    .port4_que_info	    (port4_que_info	            ),
    .port5_que_info	    (port5_que_info	            ),
    .port6_que_info	    (port6_que_info	            ),
    .port7_que_info	    (port7_que_info	            ),
    .port8_que_info	    (port8_que_info	            ),
    .port9_que_info	    (port9_que_info	            ),
    .port10_que_info	(port10_que_info            ),
    .port11_que_info	(port11_que_info            ),
    .port12_que_info	(port12_que_info            ),
    .port13_que_info	(port13_que_info            ),
    .port14_que_info	(port14_que_info            ),
    .port15_que_info	(port15_que_info            ),

    .port0_rd_info	    (port0_rd_info	            ),
    .port1_rd_info	    (port1_rd_info	            ),
    .port2_rd_info	    (port2_rd_info	            ),
    .port3_rd_info	    (port3_rd_info	            ),
    .port4_rd_info	    (port4_rd_info	            ),
    .port5_rd_info	    (port5_rd_info	            ),
    .port6_rd_info	    (port6_rd_info	            ),
    .port7_rd_info	    (port7_rd_info	            ),
    .port8_rd_info	    (port8_rd_info	            ),
    .port9_rd_info	    (port9_rd_info	            ),
    .port10_rd_info	    (port10_rd_info	            ),
    .port11_rd_info	    (port11_rd_info	            ),
    .port12_rd_info	    (port12_rd_info	            ),
    .port13_rd_info	    (port13_rd_info	            ),
    .port14_rd_info	    (port14_rd_info	            ),
    .port15_rd_info	    (port15_rd_info	            ),
		
	.port0_req_done		(port0_req_done				),//可以写地址
	.port1_req_done		(port1_req_done				),
	.port2_req_done		(port2_req_done				),
	.port3_req_done		(port3_req_done				),
	.port4_req_done		(port4_req_done				),
	.port5_req_done		(port5_req_done				),
	.port6_req_done		(port6_req_done				),
	.port7_req_done		(port7_req_done				),
	.port8_req_done		(port8_req_done				),
	.port9_req_done		(port9_req_done				),
	.port10_req_done	(port10_req_done			),
	.port11_req_done	(port11_req_done			),
	.port12_req_done	(port12_req_done			),
	.port13_req_done	(port13_req_done			),
	.port14_req_done	(port14_req_done			),
	.port15_req_done	(port15_req_done			),
	
	.rd0_req_done		(rd0_req_done				),//可以读地址
	.rd1_req_done		(rd1_req_done				),
	.rd2_req_done		(rd2_req_done				),
	.rd3_req_done		(rd3_req_done				),
	.rd4_req_done		(rd4_req_done				),
	.rd5_req_done		(rd5_req_done				),
	.rd6_req_done		(rd6_req_done				),
	.rd7_req_done		(rd7_req_done				),
	.rd8_req_done		(rd8_req_done				),
	.rd9_req_done		(rd9_req_done				),
	.rd10_req_done	    (rd10_req_done				),
	.rd11_req_done	    (rd11_req_done				),
	.rd12_req_done	    (rd12_req_done				),
	.rd13_req_done	    (rd13_req_done				),
	.rd14_req_done	    (rd14_req_done				),
	.rd15_req_done	    (rd15_req_done				),
	
	.port_que_info      (port_que_info				),
	.port_rd_info	    (port_rd_info				),
	.ctrl_flag	       	(ctrl_flag					)
);


//************************************* sram_ctrl ********************************************//

assign port_req_done = port0_req_done | port1_req_done | port2_req_done | port3_req_done | port4_req_done | port5_req_done | port6_req_done | port7_req_done |
                       port8_req_done | port9_req_done | port10_req_done | port11_req_done | port12_req_done | port13_req_done | port14_req_done | port15_req_done;
assign rd_req_done   = rd0_req_done | rd1_req_done | rd2_req_done | rd3_req_done | rd4_req_done | rd5_req_done | rd6_req_done | rd7_req_done | 
					   rd8_req_done | rd9_req_done | rd10_req_done | rd11_req_done | rd12_req_done | rd13_req_done | rd14_req_done | rd15_req_done;
/*
assign sram_rd_fifo = sram0_wr_fifo_ren | sram1_wr_fifo_ren | sram2_wr_fifo_ren | sram3_wr_fifo_ren | sram4_wr_fifo_ren | sram5_wr_fifo_ren |
                      sram6_wr_fifo_ren | sram7_wr_fifo_ren | sram8_wr_fifo_ren | sram9_wr_fifo_ren | sram10_wr_fifo_ren | sram11_wr_fifo_ren |
                      sram12_wr_fifo_ren | sram13_wr_fifo_ren | sram14_wr_fifo_ren | sram15_wr_fifo_ren | sram16_wr_fifo_ren | sram17_wr_fifo_ren |
                      sram18_wr_fifo_ren | sram19_wr_fifo_ren | sram20_wr_fifo_ren | sram21_wr_fifo_ren | sram22_wr_fifo_ren | sram23_wr_fifo_ren |
                      sram24_wr_fifo_ren | sram25_wr_fifo_ren | sram26_wr_fifo_ren | sram27_wr_fifo_ren | sram28_wr_fifo_ren | sram29_wr_fifo_ren |
                      sram30_wr_fifo_ren | sram31_wr_fifo_ren;
assign wr_fifo_data = port0_data_out | port1_data_out | port2_data_out | port3_data_out | port4_data_out | port5_data_out | port6_data_out |
                      port7_data_out | port8_data_out | port9_data_out | port10_data_out | port11_data_out | port12_data_out | port13_data_out |
                      port14_data_out | port15_data_out;	
*/
sram_ctrl u_sram_ctrl
(
    .sys_clk         	(sys_clk					),
    .sys_rst         	(sys_rst					),
	//写入端口
    .port_req_done   	(port_req_done				),
    .port_que_info   	(port_que_info				),
	//输出端口fifo数据读使能
    .wr_fifo_ren0	 	(wr_fifo_ren0				),
	.wr_fifo_ren1	 	(wr_fifo_ren1				),
	.wr_fifo_ren2	 	(wr_fifo_ren2				),
	.wr_fifo_ren3	 	(wr_fifo_ren3				),
    .wr_fifo_ren4	 	(wr_fifo_ren4				),
	.wr_fifo_ren5	 	(wr_fifo_ren5				),
	.wr_fifo_ren6	 	(wr_fifo_ren6				),
	.wr_fifo_ren7	 	(wr_fifo_ren7				),
    .wr_fifo_ren8	 	(wr_fifo_ren8				),
	.wr_fifo_ren9	 	(wr_fifo_ren9				),
	.wr_fifo_ren10 	 	(wr_fifo_ren10				),
	.wr_fifo_ren11 	 	(wr_fifo_ren11				),
    .wr_fifo_ren12 	 	(wr_fifo_ren12				),
	.wr_fifo_ren13 	 	(wr_fifo_ren13				),
	.wr_fifo_ren14 	 	(wr_fifo_ren14				),
	.wr_fifo_ren15 	 	(wr_fifo_ren15				),
	//写入数据
	.wr_fifo_data0   	(port0_data_out				),
	.wr_fifo_data1   	(port1_data_out				),
	.wr_fifo_data2   	(port2_data_out				),
	.wr_fifo_data3   	(port3_data_out				),
	.wr_fifo_data4   	(port4_data_out				),
	.wr_fifo_data5   	(port5_data_out				),
	.wr_fifo_data6   	(port6_data_out				),
	.wr_fifo_data7   	(port7_data_out				),
	.wr_fifo_data8   	(port8_data_out				),
	.wr_fifo_data9   	(port9_data_out				),
	.wr_fifo_data10  	(port10_data_out			),
	.wr_fifo_data11  	(port11_data_out			),
	.wr_fifo_data12  	(port12_data_out			),
	.wr_fifo_data13  	(port13_data_out			),
	.wr_fifo_data14  	(port14_data_out			),
	.wr_fifo_data15  	(port15_data_out			),
	//读取端口			
    .rd_req_done     	(rd_req_done				),
    .port_rd_info    	(port_rd_info				),
	//读写地址
	.port0_addr_use	 	(port0_addr_use				),
	.port1_addr_use	 	(port1_addr_use				),
	.port2_addr_use	 	(port2_addr_use				),
	.port3_addr_use	 	(port3_addr_use				),
	.port4_addr_use	 	(port4_addr_use				),
	.port5_addr_use	 	(port5_addr_use				),
	.port6_addr_use	 	(port6_addr_use				),
	.port7_addr_use	 	(port7_addr_use				),
	.port8_addr_use	 	(port8_addr_use				),
	.port9_addr_use	 	(port9_addr_use				),
	.port10_addr_use 	(port10_addr_use			),
	.port11_addr_use 	(port11_addr_use			),
	.port12_addr_use 	(port12_addr_use			),
	.port13_addr_use 	(port13_addr_use			),
	.port14_addr_use 	(port14_addr_use			),
	.port15_addr_use 	(port15_addr_use			),
	
	.rd0_addr_use 	 	(rd0_addr_use 				),
	.rd1_addr_use 	 	(rd1_addr_use 				),
	.rd2_addr_use 	 	(rd2_addr_use 				),
	.rd3_addr_use 	 	(rd3_addr_use 				),
	.rd4_addr_use 	 	(rd4_addr_use 				),
	.rd5_addr_use 	 	(rd5_addr_use 				),
	.rd6_addr_use 	 	(rd6_addr_use 				),
	.rd7_addr_use 	 	(rd7_addr_use 				),
	.rd8_addr_use 	 	(rd8_addr_use 				),
	.rd9_addr_use 	 	(rd9_addr_use 				),
	.rd10_addr_use	 	(rd10_addr_use				),
	.rd11_addr_use	 	(rd11_addr_use				),
	.rd12_addr_use	 	(rd12_addr_use				),
	.rd13_addr_use	 	(rd13_addr_use				),
	.rd14_addr_use	 	(rd14_addr_use				),
	.rd15_addr_use	 	(rd15_addr_use				),
	//输出内存信息
    .sram_idle_cnt	 	(sram_idle_cnt				),
    .sram_addr    	 	(sram_addr					),
	//输出sram读写完成信号
	.sram_wr_re		 	(sram_wr_re					),
	.sram_rd_re		 	(sram_rd_re					),
	//输出32个SRAM 控制信号
    .sram0_addr_r		(sram0_addr_r				),
	.sram0_data			(sram0_data					),
	.sram0_cs			(sram0_cs					),
	.sram0_oe			(sram0_oe					),
	.sram0_we	    	(sram0_we	  				),	
	.sram1_addr_r		(sram1_addr_r				),
	.sram1_data			(sram1_data					),
	.sram1_cs			(sram1_cs					),
	.sram1_oe			(sram1_oe					),
	.sram1_we	    	(sram1_we	  				),	
	.sram2_addr_r		(sram2_addr_r				),
	.sram2_data			(sram2_data					),
	.sram2_cs			(sram2_cs					),
	.sram2_oe			(sram2_oe					),
	.sram2_we	    	(sram2_we	  				),
	.sram3_addr_r		(sram3_addr_r				),
	.sram3_data			(sram3_data					),
	.sram3_cs			(sram3_cs					),
	.sram3_oe			(sram3_oe					),
	.sram3_we	    	(sram3_we	  				),
	.sram4_addr_r		(sram4_addr_r				),
	.sram4_data			(sram4_data					),
	.sram4_cs			(sram4_cs					),
	.sram4_oe			(sram4_oe					),
	.sram4_we	    	(sram4_we	  				),
	.sram5_addr_r		(sram5_addr_r				),
	.sram5_data			(sram5_data					),
	.sram5_cs			(sram5_cs					),
	.sram5_oe			(sram5_oe					),
	.sram5_we	    	(sram5_we	  				),
	.sram6_addr_r		(sram6_addr_r				),
	.sram6_data			(sram6_data					),
	.sram6_cs			(sram6_cs					),
	.sram6_oe			(sram6_oe					),
	.sram6_we	    	(sram6_we	  				),
	.sram7_addr_r		(sram7_addr_r				),
	.sram7_data			(sram7_data					),
	.sram7_cs			(sram7_cs					),
	.sram7_oe			(sram7_oe					),
	.sram7_we	    	(sram7_we	  				),
	.sram8_addr_r		(sram8_addr_r				),
	.sram8_data			(sram8_data					),
	.sram8_cs			(sram8_cs					),
	.sram8_oe			(sram8_oe					),
	.sram8_we	    	(sram8_we	  				),
	.sram9_addr_r		(sram9_addr_r				),
	.sram9_data			(sram9_data					),
	.sram9_cs			(sram9_cs					),
	.sram9_oe			(sram9_oe					),
	.sram9_we	    	(sram9_we	  				),
	.sram10_addr_r		(sram10_addr_r				),
	.sram10_data		(sram10_data				),
	.sram10_cs			(sram10_cs					),
	.sram10_oe			(sram10_oe					),
	.sram10_we	    	(sram10_we	  				),
	.sram11_addr_r		(sram11_addr_r				),
	.sram11_data		(sram11_data				),
	.sram11_cs			(sram11_cs					),
	.sram11_oe			(sram11_oe					),
	.sram11_we	    	(sram11_we	  				),
	.sram12_addr_r		(sram12_addr_r				),
	.sram12_data		(sram12_data				),
	.sram12_cs			(sram12_cs					),
	.sram12_oe			(sram12_oe					),
	.sram12_we	    	(sram12_we	  				),
	.sram13_addr_r		(sram13_addr_r				),
	.sram13_data		(sram13_data				),
	.sram13_cs			(sram13_cs					),
	.sram13_oe			(sram13_oe					),
	.sram13_we	    	(sram13_we	  				),
	.sram14_addr_r		(sram14_addr_r				),
	.sram14_data		(sram14_data				),
	.sram14_cs			(sram14_cs					),
	.sram14_oe			(sram14_oe					),
	.sram14_we	    	(sram14_we	  				),
	.sram15_addr_r		(sram15_addr_r				),
	.sram15_data		(sram15_data				),
	.sram15_cs			(sram15_cs					),
	.sram15_oe			(sram15_oe					),
	.sram15_we	    	(sram15_we	  				),
	.sram16_addr_r		(sram16_addr_r				),
	.sram16_data		(sram16_data				),
	.sram16_cs			(sram16_cs					),
	.sram16_oe			(sram16_oe					),
	.sram16_we	    	(sram16_we	  				),
	.sram17_addr_r		(sram17_addr_r				),
	.sram17_data		(sram17_data				),
	.sram17_cs			(sram17_cs					),
	.sram17_oe			(sram17_oe					),
	.sram17_we	    	(sram17_we	  				),
	.sram18_addr_r		(sram18_addr_r				),
	.sram18_data		(sram18_data				),
	.sram18_cs			(sram18_cs					),
	.sram18_oe			(sram18_oe					),
	.sram18_we	    	(sram18_we	  				),
	.sram19_addr_r		(sram19_addr_r				),
	.sram19_data		(sram19_data				),
	.sram19_cs			(sram19_cs					),
	.sram19_oe			(sram19_oe					),
	.sram19_we	    	(sram19_we	  				),	
	.sram20_addr_r		(sram20_addr_r				),
	.sram20_data		(sram20_data				),
	.sram20_cs			(sram20_cs					),
	.sram20_oe			(sram20_oe					),
	.sram20_we	    	(sram20_we	  				),	
	.sram21_addr_r		(sram21_addr_r				),
	.sram21_data		(sram21_data				),
	.sram21_cs			(sram21_cs					),
	.sram21_oe			(sram21_oe					),
	.sram21_we	    	(sram21_we	  				),	
	.sram22_addr_r		(sram22_addr_r				),
	.sram22_data		(sram22_data				),
	.sram22_cs			(sram22_cs					),
	.sram22_oe			(sram22_oe					),
	.sram22_we	    	(sram22_we	  				),
	.sram23_addr_r		(sram23_addr_r				),
	.sram23_data		(sram23_data				),
	.sram23_cs			(sram23_cs					),
	.sram23_oe			(sram23_oe					),
	.sram23_we	    	(sram23_we	  				),
	.sram24_addr_r		(sram24_addr_r				),
	.sram24_data		(sram24_data				),
	.sram24_cs			(sram24_cs					),
	.sram24_oe			(sram24_oe					),
	.sram24_we	    	(sram24_we	  				),
	.sram25_addr_r		(sram25_addr_r				),
	.sram25_data		(sram25_data				),
	.sram25_cs			(sram25_cs					),
	.sram25_oe			(sram25_oe					),
	.sram25_we	    	(sram25_we	  				),
	.sram26_addr_r		(sram26_addr_r				),
	.sram26_data		(sram26_data				),
	.sram26_cs			(sram26_cs					),
	.sram26_oe			(sram26_oe					),
	.sram26_we	    	(sram26_we	  				),
	.sram27_addr_r		(sram27_addr_r				),
	.sram27_data		(sram27_data				),
	.sram27_cs			(sram27_cs					),
	.sram27_oe			(sram27_oe					),
	.sram27_we	    	(sram27_we	  				),
	.sram28_addr_r		(sram28_addr_r				),
	.sram28_data		(sram28_data				),
	.sram28_cs			(sram28_cs					),
	.sram28_oe			(sram28_oe					),
	.sram28_we	    	(sram28_we	  				),
	.sram29_addr_r		(sram29_addr_r				),
	.sram29_data		(sram29_data				),
	.sram29_cs			(sram29_cs					),
	.sram29_oe			(sram29_oe					),
	.sram29_we	    	(sram29_we	  				),
	.sram30_addr_r		(sram30_addr_r				),
	.sram30_data		(sram30_data				),
	.sram30_cs			(sram30_cs					),
	.sram30_oe			(sram30_oe					),
	.sram30_we	    	(sram30_we	  				),
	.sram31_addr_r		(sram31_addr_r				),
	.sram31_data		(sram31_data				),
	.sram31_cs			(sram31_cs					),
	.sram31_oe			(sram31_oe					),
	.sram31_we      	(sram31_we    				),
	//输出数据控制控制信号
	.rd_por_rd_sop 		(rd_por_rd_sop				),
	.rd_por_rd_eop 		(rd_por_rd_eop 				),
	.rd_por_rd_vld 		(rd_por_rd_vld 				),
	.rd_por_rd_data		(rd_por_rd_data				)
);

endmodule
