module sram_ctrl 
(
    input           sys_clk         ,
    input           sys_rst         ,

	//写入端口
    input           port_req_done   ,
    input   [33:0]  port_que_info   ,

	//端口fifo数据读使能
    output  reg     wr_fifo_ren0	,
	output  reg     wr_fifo_ren1	,
	output  reg     wr_fifo_ren2	,
	output  reg     wr_fifo_ren3	,
    output  reg     wr_fifo_ren4	,
	output  reg     wr_fifo_ren5	,
	output  reg     wr_fifo_ren6	,
	output  reg     wr_fifo_ren7	,
    output  reg     wr_fifo_ren8	,
	output  reg     wr_fifo_ren9	,
	output  reg     wr_fifo_ren10	,
	output  reg     wr_fifo_ren11	,
    output  reg     wr_fifo_ren12	,
	output  reg     wr_fifo_ren13	,
	output  reg     wr_fifo_ren14	,
	output  reg     wr_fifo_ren15	,

	//写入数据
	input   [7:0]   wr_fifo_data0   ,
	input   [7:0]   wr_fifo_data1   ,
	input   [7:0]   wr_fifo_data2   ,
	input   [7:0]   wr_fifo_data3   ,
	input   [7:0]   wr_fifo_data4   ,
	input   [7:0]   wr_fifo_data5   ,
	input   [7:0]   wr_fifo_data6   ,
	input   [7:0]   wr_fifo_data7   ,
	input   [7:0]   wr_fifo_data8   ,
	input   [7:0]   wr_fifo_data9   ,
	input   [7:0]   wr_fifo_data10  ,
	input   [7:0]   wr_fifo_data11  ,
	input   [7:0]   wr_fifo_data12  ,
	input   [7:0]   wr_fifo_data13  ,
	input   [7:0]   wr_fifo_data14  ,
	input   [7:0]   wr_fifo_data15  ,

	//读取端口
    input           rd_req_done     ,
    input   [25:0]	port_rd_info    ,

	//读写地址
	input	[516:0]	port0_addr_use	,
	input	[516:0]	port1_addr_use	,
	input	[516:0]	port2_addr_use	,
	input	[516:0]	port3_addr_use	,
	input	[516:0]	port4_addr_use	,
	input	[516:0]	port5_addr_use	,
	input	[516:0]	port6_addr_use	,
	input	[516:0]	port7_addr_use	,
	input	[516:0]	port8_addr_use	,
	input	[516:0]	port9_addr_use	,
	input	[516:0]	port10_addr_use	,
	input	[516:0]	port11_addr_use	,
	input	[516:0]	port12_addr_use	,
	input	[516:0]	port13_addr_use	,
	input	[516:0]	port14_addr_use	,
	input	[516:0]	port15_addr_use	,
	
	input	[516:0]	rd0_addr_use	,
	input	[516:0]	rd1_addr_use	,
	input	[516:0]	rd2_addr_use	,
	input	[516:0]	rd3_addr_use	,
	input	[516:0]	rd4_addr_use	,
	input	[516:0]	rd5_addr_use	,
	input	[516:0]	rd6_addr_use	,
	input	[516:0]	rd7_addr_use	,
	input	[516:0]	rd8_addr_use	,
	input	[516:0]	rd9_addr_use	,
	input	[516:0]	rd10_addr_use	,
	input	[516:0]	rd11_addr_use	,
	input	[516:0]	rd12_addr_use	,
	input	[516:0]	rd13_addr_use	,
	input	[516:0]	rd14_addr_use	,
	input	[516:0]	rd15_addr_use	,

	//内存信息
    output  [9*32-1:0] sram_idle_cnt,
    output  [9*32-1:0] sram_addr    ,

	//sram读写完成信号
	output	[31:0]	sram_wr_re		,
	output	[31:0]	sram_rd_re		,

	//32个SRAM 控制信号
    output  [14:0]	sram0_addr_r	,
	inout   [7:0]	sram0_data		,
	output         	sram0_cs		,
	output          sram0_oe		,
	output          sram0_we	    ,	
	output  [14:0]	sram1_addr_r	,
	inout   [7:0]	sram1_data		,
	output         	sram1_cs		,
	output          sram1_oe		,
	output          sram1_we	    ,	
	output  [14:0]	sram2_addr_r	,
	inout   [7:0]	sram2_data		,
	output         	sram2_cs		,
	output          sram2_oe		,
	output          sram2_we	    ,
	output  [14:0]	sram3_addr_r	,
	inout   [7:0]	sram3_data		,
	output         	sram3_cs		,
	output          sram3_oe		,
	output          sram3_we	    ,
	output  [14:0]	sram4_addr_r	,
	inout   [7:0]	sram4_data		,
	output         	sram4_cs		,
	output          sram4_oe		,
	output          sram4_we	    ,
	output  [14:0]	sram5_addr_r	,
	inout   [7:0]	sram5_data		,
	output         	sram5_cs		,
	output          sram5_oe		,
	output          sram5_we	    ,
	output  [14:0]	sram6_addr_r	,
	inout   [7:0]	sram6_data		,
	output         	sram6_cs		,
	output          sram6_oe		,
	output          sram6_we	    ,
	output  [14:0]	sram7_addr_r	,
	inout   [7:0]	sram7_data		,
	output         	sram7_cs		,
	output          sram7_oe		,
	output          sram7_we	    ,
	output  [14:0]	sram8_addr_r	,
	inout   [7:0]	sram8_data		,
	output         	sram8_cs		,
	output          sram8_oe		,
	output          sram8_we	    ,
	output  [14:0]	sram9_addr_r	,
	inout   [7:0]	sram9_data		,
	output         	sram9_cs		,
	output          sram9_oe		,
	output          sram9_we	    ,
	output  [14:0]	sram10_addr_r	,
	inout   [7:0]	sram10_data		,
	output         	sram10_cs		,
	output          sram10_oe		,
	output          sram10_we	    ,
	output  [14:0]	sram11_addr_r	,
	inout   [7:0]	sram11_data		,
	output         	sram11_cs		,
	output          sram11_oe		,
	output          sram11_we	    ,
	output  [14:0]	sram12_addr_r	,
	inout   [7:0]	sram12_data		,
	output         	sram12_cs		,
	output          sram12_oe		,
	output          sram12_we	    ,
	output  [14:0]	sram13_addr_r	,
	inout   [7:0]	sram13_data		,
	output         	sram13_cs		,
	output          sram13_oe		,
	output          sram13_we	    ,
	output  [14:0]	sram14_addr_r	,
	inout   [7:0]	sram14_data		,
	output         	sram14_cs		,
	output          sram14_oe		,
	output          sram14_we	    ,
	output  [14:0]	sram15_addr_r	,
	inout   [7:0]	sram15_data		,
	output         	sram15_cs		,
	output          sram15_oe		,
	output          sram15_we	    ,
	output  [14:0]	sram16_addr_r	,
	inout   [7:0]	sram16_data		,
	output         	sram16_cs		,
	output          sram16_oe		,
	output          sram16_we	    ,
	output  [14:0]	sram17_addr_r	,
	inout   [7:0]	sram17_data		,
	output         	sram17_cs		,
	output          sram17_oe		,
	output          sram17_we	    ,
	output  [14:0]	sram18_addr_r	,
	inout   [7:0]	sram18_data		,
	output         	sram18_cs		,
	output          sram18_oe		,
	output          sram18_we	    ,
	output  [14:0]	sram19_addr_r	,
	inout   [7:0]	sram19_data		,
	output         	sram19_cs		,
	output          sram19_oe		,
	output          sram19_we	    ,	
	output  [14:0]	sram20_addr_r	,
	inout   [7:0]	sram20_data		,
	output         	sram20_cs		,
	output          sram20_oe		,
	output          sram20_we	    ,	
	output  [14:0]	sram21_addr_r	,
	inout   [7:0]	sram21_data		,
	output         	sram21_cs		,
	output          sram21_oe		,
	output          sram21_we	    ,	
	output  [14:0]	sram22_addr_r	,
	inout   [7:0]	sram22_data		,
	output         	sram22_cs		,
	output          sram22_oe		,
	output          sram22_we	    ,
	output  [14:0]	sram23_addr_r	,
	inout   [7:0]	sram23_data		,
	output         	sram23_cs		,
	output          sram23_oe		,
	output          sram23_we	    ,
	output  [14:0]	sram24_addr_r	,
	inout   [7:0]	sram24_data		,
	output         	sram24_cs		,
	output          sram24_oe		,
	output          sram24_we	    ,
	output  [14:0]	sram25_addr_r	,
	inout   [7:0]	sram25_data		,
	output         	sram25_cs		,
	output          sram25_oe		,
	output          sram25_we	    ,
	output  [14:0]	sram26_addr_r	,
	inout   [7:0]	sram26_data		,
	output         	sram26_cs		,
	output          sram26_oe		,
	output          sram26_we	    ,
	output  [14:0]	sram27_addr_r	,
	inout   [7:0]	sram27_data		,
	output         	sram27_cs		,
	output          sram27_oe		,
	output          sram27_we	    ,
	output  [14:0]	sram28_addr_r	,
	inout   [7:0]	sram28_data		,
	output         	sram28_cs		,
	output          sram28_oe		,
	output          sram28_we	    ,
	output  [14:0]	sram29_addr_r	,
	inout   [7:0]	sram29_data		,
	output         	sram29_cs		,
	output          sram29_oe		,
	output          sram29_we	    ,
	output  [14:0]	sram30_addr_r	,
	inout   [7:0]	sram30_data		,
	output         	sram30_cs		,
	output          sram30_oe		,
	output          sram30_we	    ,
	output  [14:0]	sram31_addr_r	,
	inout   [7:0]	sram31_data		,
	output         	sram31_cs		,
	output          sram31_oe		,
	output          sram31_we       ,

	output			rd_por_rd_sop 	,
	output			rd_por_rd_eop 	,
	output			rd_por_rd_vld 	,
	output	[7:0]	rd_por_rd_data	
);

wire            		port_wr_done;
wire    [31:0]  		port_wr_re;

wire            		port_rd_done;
wire    [31:0]  		port_rd_re;

assign sram_wr_re = port_wr_re;
assign sram_rd_re = port_rd_re;

wire 			    	sram0_wr_fifo_ren      	;
wire 			    	sram1_wr_fifo_ren      	;
wire 					sram2_wr_fifo_ren		;
wire 			    	sram3_wr_fifo_ren      	;
wire 					sram4_wr_fifo_ren		;
wire 			    	sram5_wr_fifo_ren      	;
wire 					sram6_wr_fifo_ren		;
wire 			    	sram7_wr_fifo_ren      	;
wire 					sram8_wr_fifo_ren		;
wire 			    	sram9_wr_fifo_ren      	;
wire 					sram10_wr_fifo_ren		;
wire 			    	sram11_wr_fifo_ren      ;
wire 					sram12_wr_fifo_ren		;
wire 			    	sram13_wr_fifo_ren      ;
wire 					sram14_wr_fifo_ren		;
wire 			    	sram15_wr_fifo_ren      ;
wire 					sram16_wr_fifo_ren		;
wire 			    	sram17_wr_fifo_ren      ;
wire 			    	sram18_wr_fifo_ren      ;
wire 					sram19_wr_fifo_ren		;
wire 			    	sram20_wr_fifo_ren      ;
wire 					sram21_wr_fifo_ren		;
wire 			    	sram22_wr_fifo_ren      ;
wire 					sram23_wr_fifo_ren		;
wire 			    	sram24_wr_fifo_ren      ;
wire 					sram25_wr_fifo_ren		;
wire 			    	sram26_wr_fifo_ren      ;
wire 					sram27_wr_fifo_ren		;
wire 			    	sram28_wr_fifo_ren      ;
wire 					sram29_wr_fifo_ren		;
wire 			    	sram30_wr_fifo_ren      ;
wire 					sram31_wr_fifo_ren		;

reg   [7:0]			    sram0_wr_fifo_data      ;
reg   [7:0]			    sram1_wr_fifo_data      ;
reg   [7:0]				sram2_wr_fifo_data		;
reg   [7:0]			    sram3_wr_fifo_data      ;
reg   [7:0]				sram4_wr_fifo_data		;
reg   [7:0]			    sram5_wr_fifo_data      ;
reg   [7:0]				sram6_wr_fifo_data		;
reg   [7:0]			    sram7_wr_fifo_data      ;
reg   [7:0]				sram8_wr_fifo_data		;
reg   [7:0]			    sram9_wr_fifo_data      ;
reg   [7:0]				sram10_wr_fifo_data		;
reg   [7:0]			    sram11_wr_fifo_data     ;
reg   [7:0]				sram12_wr_fifo_data		;
reg   [7:0]			    sram13_wr_fifo_data     ;
reg   [7:0]				sram14_wr_fifo_data		;
reg   [7:0]			    sram15_wr_fifo_data     ;
reg   [7:0]				sram16_wr_fifo_data		;
reg   [7:0]			    sram17_wr_fifo_data     ;
reg   [7:0]			    sram18_wr_fifo_data     ;
reg   [7:0]				sram19_wr_fifo_data		;
reg   [7:0]			    sram20_wr_fifo_data     ;
reg   [7:0]				sram21_wr_fifo_data		;
reg   [7:0]			    sram22_wr_fifo_data     ;
reg   [7:0]				sram23_wr_fifo_data		;
reg   [7:0]			    sram24_wr_fifo_data     ;
reg   [7:0]				sram25_wr_fifo_data		;
reg   [7:0]			    sram26_wr_fifo_data     ;
reg   [7:0]				sram27_wr_fifo_data		;
reg   [7:0]			    sram28_wr_fifo_data     ;
reg   [7:0]				sram29_wr_fifo_data		;
reg   [7:0]			    sram30_wr_fifo_data     ;
reg   [7:0]				sram31_wr_fifo_data		;

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

wire  					sram0_rd_sop	;
wire  					sram0_rd_eop	;
wire  					sram0_rd_vld	;
wire  [7:0]				sram0_rd_data	;
wire  					sram1_rd_sop	;
wire  					sram1_rd_eop	;
wire  					sram1_rd_vld	;
wire  [7:0]				sram1_rd_data	;
wire  					sram2_rd_sop	;
wire  					sram2_rd_eop	;
wire  					sram2_rd_vld	;
wire  [7:0]				sram2_rd_data	;
wire  					sram3_rd_sop	;
wire  					sram3_rd_eop	;
wire  					sram3_rd_vld	;
wire  [7:0]				sram3_rd_data	;
wire  					sram4_rd_sop	;
wire  					sram4_rd_eop	;
wire  					sram4_rd_vld	;
wire  [7:0]				sram4_rd_data	;
wire  					sram5_rd_sop	;
wire  					sram5_rd_eop	;
wire  					sram5_rd_vld	;
wire  [7:0]				sram5_rd_data	;
wire  					sram6_rd_sop	;
wire  					sram6_rd_eop	;
wire  					sram6_rd_vld	;
wire  [7:0]				sram6_rd_data	;
wire  					sram7_rd_sop	;
wire  					sram7_rd_eop	;
wire  					sram7_rd_vld	;
wire  [7:0]				sram7_rd_data	;
wire  					sram8_rd_sop	;
wire  					sram8_rd_eop	;
wire  					sram8_rd_vld	;
wire  [7:0]				sram8_rd_data	;
wire  					sram9_rd_sop	;
wire  					sram9_rd_eop	;
wire  					sram9_rd_vld	;
wire  [7:0]				sram9_rd_data	;
wire  					sram10_rd_sop	;
wire  					sram10_rd_eop	;
wire  					sram10_rd_vld	;
wire  [7:0]				sram10_rd_data	;
wire  					sram11_rd_sop	;
wire  					sram11_rd_eop	;
wire  					sram11_rd_vld	;
wire  [7:0]				sram11_rd_data	;
wire  					sram12_rd_sop	;
wire  					sram12_rd_eop	;
wire  					sram12_rd_vld	;
wire  [7:0]				sram12_rd_data	;
wire  					sram13_rd_sop	;
wire  					sram13_rd_eop	;
wire  					sram13_rd_vld	;
wire  [7:0]				sram13_rd_data	;
wire  					sram14_rd_sop	;
wire  					sram14_rd_eop	;
wire  					sram14_rd_vld	;
wire  [7:0]				sram14_rd_data	;
wire  					sram15_rd_sop	;
wire  					sram15_rd_eop	;
wire  					sram15_rd_vld	;
wire  [7:0]				sram15_rd_data	;
wire  					sram16_rd_sop	;
wire  					sram16_rd_eop	;
wire  					sram16_rd_vld	;
wire  [7:0]				sram16_rd_data	;
wire  					sram17_rd_sop	;
wire  					sram17_rd_eop	;
wire  					sram17_rd_vld	;
wire  [7:0]				sram17_rd_data	;
wire  					sram18_rd_sop	;
wire  					sram18_rd_eop	;
wire  					sram18_rd_vld	;
wire  [7:0]				sram18_rd_data	;
wire  					sram19_rd_sop	;
wire  					sram19_rd_eop	;
wire  					sram19_rd_vld	;
wire  [7:0]				sram19_rd_data	;
wire  					sram20_rd_sop	;
wire  					sram20_rd_eop	;
wire  					sram20_rd_vld	;
wire  [7:0]				sram20_rd_data	;
wire  					sram21_rd_sop	;
wire  					sram21_rd_eop	;
wire  					sram21_rd_vld	;
wire  [7:0]				sram21_rd_data	;
wire  					sram22_rd_sop	;
wire  					sram22_rd_eop	;
wire  					sram22_rd_vld	;
wire  [7:0]				sram22_rd_data	;
wire  					sram23_rd_sop	;
wire  					sram23_rd_eop	;
wire  					sram23_rd_vld	;
wire  [7:0]				sram23_rd_data	;
wire  					sram24_rd_sop	;
wire  					sram24_rd_eop	;
wire  					sram24_rd_vld	;
wire  [7:0]				sram24_rd_data	;
wire  					sram25_rd_sop	;
wire  					sram25_rd_eop	;
wire  					sram25_rd_vld	;
wire  [7:0]				sram25_rd_data	;
wire  					sram26_rd_sop	;
wire  					sram26_rd_eop	;
wire  					sram26_rd_vld	;
wire  [7:0]				sram26_rd_data	;
wire  					sram27_rd_sop	;
wire  					sram27_rd_eop	;
wire  					sram27_rd_vld	;
wire  [7:0]				sram27_rd_data	;
wire  					sram28_rd_sop	;
wire  					sram28_rd_eop	;
wire  					sram28_rd_vld	;
wire  [7:0]				sram28_rd_data	;
wire  					sram29_rd_sop	;
wire  					sram29_rd_eop	;
wire  					sram29_rd_vld	;
wire  [7:0]				sram29_rd_data	;
wire  					sram30_rd_sop	;
wire  					sram30_rd_eop	;
wire  					sram30_rd_vld	;
wire  [7:0]				sram30_rd_data	;
wire  					sram31_rd_sop	;
wire  					sram31_rd_eop	;
wire  					sram31_rd_vld	;
wire  [7:0]				sram31_rd_data	;

reg						sram_wr_fifo_ren		;
reg	  [7:0]				wr_fifo_data			;

always @(posedge sys_clk) begin
	if(sys_rst) begin
		wr_fifo_ren0  <= 1'b0;
		wr_fifo_ren1  <= 1'b0;
		wr_fifo_ren2  <= 1'b0;
		wr_fifo_ren3  <= 1'b0;
		wr_fifo_ren4  <= 1'b0;
		wr_fifo_ren5  <= 1'b0;
		wr_fifo_ren6  <= 1'b0;
		wr_fifo_ren7  <= 1'b0;
		wr_fifo_ren8  <= 1'b0;
		wr_fifo_ren9  <= 1'b0;
		wr_fifo_ren10 <= 1'b0;
		wr_fifo_ren11 <= 1'b0;
		wr_fifo_ren12 <= 1'b0;
		wr_fifo_ren13 <= 1'b0;
		wr_fifo_ren14 <= 1'b0;
		wr_fifo_ren15 <= 1'b0;
	end
	else
		case (port_que_info[33:30])
			4'd0 : wr_fifo_ren0 <= sram_wr_fifo_ren;
			4'd1 : wr_fifo_ren1 <= sram_wr_fifo_ren;
			4'd2 : wr_fifo_ren2 <= sram_wr_fifo_ren;
			4'd3 : wr_fifo_ren3 <= sram_wr_fifo_ren;
			4'd4 : wr_fifo_ren4 <= sram_wr_fifo_ren;
			4'd5 : wr_fifo_ren5 <= sram_wr_fifo_ren;
			4'd6 : wr_fifo_ren6 <= sram_wr_fifo_ren;
			4'd7 : wr_fifo_ren7 <= sram_wr_fifo_ren;
			4'd8 : wr_fifo_ren8 <= sram_wr_fifo_ren;
			4'd9 : wr_fifo_ren9 <= sram_wr_fifo_ren;
			4'd10: wr_fifo_ren10<= sram_wr_fifo_ren;
			4'd11: wr_fifo_ren11<= sram_wr_fifo_ren;
			4'd12: wr_fifo_ren12<= sram_wr_fifo_ren;
			4'd13: wr_fifo_ren13<= sram_wr_fifo_ren;
			4'd14: wr_fifo_ren14<= sram_wr_fifo_ren;
			4'd15: wr_fifo_ren15<= sram_wr_fifo_ren;
			default: ;
		endcase
end

always @(posedge sys_clk) begin
	if(sys_rst)
		sram_wr_fifo_ren <= 1'b0;
	else
		case (port_que_info[29:25])
			5'd0 : sram_wr_fifo_ren <= sram0_wr_fifo_ren;
			5'd1 : sram_wr_fifo_ren <= sram1_wr_fifo_ren;
			5'd2 : sram_wr_fifo_ren <= sram2_wr_fifo_ren;
			5'd3 : sram_wr_fifo_ren <= sram3_wr_fifo_ren;
			5'd4 : sram_wr_fifo_ren <= sram4_wr_fifo_ren;
			5'd5 : sram_wr_fifo_ren <= sram5_wr_fifo_ren;
			5'd6 : sram_wr_fifo_ren <= sram6_wr_fifo_ren;
			5'd7 : sram_wr_fifo_ren <= sram7_wr_fifo_ren;
			5'd8 : sram_wr_fifo_ren <= sram8_wr_fifo_ren;
			5'd9 : sram_wr_fifo_ren <= sram9_wr_fifo_ren;
			5'd10: sram_wr_fifo_ren <= sram10_wr_fifo_ren;
			5'd11: sram_wr_fifo_ren <= sram11_wr_fifo_ren;
			5'd12: sram_wr_fifo_ren <= sram12_wr_fifo_ren;
			5'd13: sram_wr_fifo_ren <= sram13_wr_fifo_ren;
			5'd14: sram_wr_fifo_ren <= sram14_wr_fifo_ren;
			5'd15: sram_wr_fifo_ren <= sram15_wr_fifo_ren;
			5'd16: sram_wr_fifo_ren <= sram16_wr_fifo_ren;
			5'd17: sram_wr_fifo_ren <= sram17_wr_fifo_ren;
			5'd18: sram_wr_fifo_ren <= sram18_wr_fifo_ren;
			5'd19: sram_wr_fifo_ren <= sram19_wr_fifo_ren;
			5'd20: sram_wr_fifo_ren <= sram20_wr_fifo_ren;
			5'd21: sram_wr_fifo_ren <= sram21_wr_fifo_ren;
			5'd22: sram_wr_fifo_ren <= sram22_wr_fifo_ren;
			5'd23: sram_wr_fifo_ren <= sram23_wr_fifo_ren;
			5'd24: sram_wr_fifo_ren <= sram24_wr_fifo_ren;
			5'd25: sram_wr_fifo_ren <= sram25_wr_fifo_ren;
			5'd26: sram_wr_fifo_ren <= sram26_wr_fifo_ren;
			5'd27: sram_wr_fifo_ren <= sram27_wr_fifo_ren;
			5'd28: sram_wr_fifo_ren <= sram28_wr_fifo_ren;
			5'd29: sram_wr_fifo_ren <= sram29_wr_fifo_ren;
			5'd30: sram_wr_fifo_ren <= sram30_wr_fifo_ren;
			5'd31: sram_wr_fifo_ren <= sram31_wr_fifo_ren;
			default: sram_wr_fifo_ren <= sram_wr_fifo_ren;
		endcase
end

always @(posedge sys_clk) begin
	if(sys_rst)
		wr_fifo_data <= 8'd0;
	else
		case (port_que_info[33:30])
			4'd0 : wr_fifo_data <= wr_fifo_data0 ;
			4'd1 : wr_fifo_data <= wr_fifo_data1 ;
			4'd2 : wr_fifo_data <= wr_fifo_data2 ;
			4'd3 : wr_fifo_data <= wr_fifo_data3 ;
			4'd4 : wr_fifo_data <= wr_fifo_data4 ;
			4'd5 : wr_fifo_data <= wr_fifo_data5 ;
			4'd6 : wr_fifo_data <= wr_fifo_data6 ;
			4'd7 : wr_fifo_data <= wr_fifo_data7 ;
			4'd8 : wr_fifo_data <= wr_fifo_data8 ;
			4'd9 : wr_fifo_data <= wr_fifo_data9 ;
			4'd10: wr_fifo_data <= wr_fifo_data10;
			4'd11: wr_fifo_data <= wr_fifo_data11;
			4'd12: wr_fifo_data <= wr_fifo_data12;
			4'd13: wr_fifo_data <= wr_fifo_data13;
			4'd14: wr_fifo_data <= wr_fifo_data14;
			4'd15: wr_fifo_data <= wr_fifo_data15;
			default: ;
		endcase
end

always @(posedge sys_clk) begin
	if(sys_rst) begin
		sram0_wr_fifo_data  <= 8'd0;
		sram1_wr_fifo_data  <= 8'd0;
		sram2_wr_fifo_data  <= 8'd0;
		sram3_wr_fifo_data  <= 8'd0;
		sram4_wr_fifo_data  <= 8'd0;
		sram5_wr_fifo_data  <= 8'd0;
		sram6_wr_fifo_data  <= 8'd0;
		sram7_wr_fifo_data  <= 8'd0;
		sram8_wr_fifo_data  <= 8'd0;
		sram9_wr_fifo_data  <= 8'd0;
		sram10_wr_fifo_data <= 8'd0;
		sram11_wr_fifo_data <= 8'd0;
		sram12_wr_fifo_data <= 8'd0;
		sram13_wr_fifo_data <= 8'd0;
		sram14_wr_fifo_data <= 8'd0;
		sram15_wr_fifo_data <= 8'd0;
		sram16_wr_fifo_data <= 8'd0;
		sram17_wr_fifo_data <= 8'd0;
		sram18_wr_fifo_data <= 8'd0;
		sram19_wr_fifo_data <= 8'd0;
		sram20_wr_fifo_data <= 8'd0;
		sram21_wr_fifo_data <= 8'd0;
		sram22_wr_fifo_data <= 8'd0;
		sram23_wr_fifo_data <= 8'd0;
		sram24_wr_fifo_data <= 8'd0;
		sram25_wr_fifo_data <= 8'd0;
		sram26_wr_fifo_data <= 8'd0;
		sram27_wr_fifo_data <= 8'd0;
		sram28_wr_fifo_data <= 8'd0;
		sram29_wr_fifo_data <= 8'd0;
		sram30_wr_fifo_data <= 8'd0;
		sram31_wr_fifo_data <= 8'd0;
	end
	else
		case (port_que_info[29:25])
			5'd0 : sram0_wr_fifo_data  <= wr_fifo_data;
			5'd1 : sram1_wr_fifo_data  <= wr_fifo_data;
			5'd2 : sram2_wr_fifo_data  <= wr_fifo_data;
			5'd3 : sram3_wr_fifo_data  <= wr_fifo_data;
			5'd4 : sram4_wr_fifo_data  <= wr_fifo_data;
			5'd5 : sram5_wr_fifo_data  <= wr_fifo_data;
			5'd6 : sram6_wr_fifo_data  <= wr_fifo_data;
			5'd7 : sram7_wr_fifo_data  <= wr_fifo_data;
			5'd8 : sram8_wr_fifo_data  <= wr_fifo_data;
			5'd9 : sram9_wr_fifo_data  <= wr_fifo_data;
			5'd10: sram10_wr_fifo_data <= wr_fifo_data;
			5'd11: sram11_wr_fifo_data <= wr_fifo_data;
			5'd12: sram12_wr_fifo_data <= wr_fifo_data;
			5'd13: sram13_wr_fifo_data <= wr_fifo_data;
			5'd14: sram14_wr_fifo_data <= wr_fifo_data;
			5'd15: sram15_wr_fifo_data <= wr_fifo_data;
			5'd16: sram16_wr_fifo_data <= wr_fifo_data;
			5'd17: sram17_wr_fifo_data <= wr_fifo_data;
			5'd18: sram18_wr_fifo_data <= wr_fifo_data;
			5'd19: sram19_wr_fifo_data <= wr_fifo_data;
			5'd20: sram20_wr_fifo_data <= wr_fifo_data;
			5'd21: sram21_wr_fifo_data <= wr_fifo_data;
			5'd22: sram22_wr_fifo_data <= wr_fifo_data;
			5'd23: sram23_wr_fifo_data <= wr_fifo_data;
			5'd24: sram24_wr_fifo_data <= wr_fifo_data;
			5'd25: sram25_wr_fifo_data <= wr_fifo_data;
			5'd26: sram26_wr_fifo_data <= wr_fifo_data;
			5'd27: sram27_wr_fifo_data <= wr_fifo_data;
			5'd28: sram28_wr_fifo_data <= wr_fifo_data;
			5'd29: sram29_wr_fifo_data <= wr_fifo_data;
			5'd30: sram30_wr_fifo_data <= wr_fifo_data;
			5'd31: sram31_wr_fifo_data <= wr_fifo_data;
			default: ;
		endcase
end

// assign sram_wr_fifo_ren = sram0_wr_fifo_ren | sram1_wr_fifo_ren | sram2_wr_fifo_ren | sram3_wr_fifo_ren | sram4_wr_fifo_ren | sram5_wr_fifo_ren | sram6_wr_fifo_ren | sram7_wr_fifo_ren | 
// 		sram8_wr_fifo_ren | sram9_wr_fifo_ren | sram10_wr_fifo_ren | sram11_wr_fifo_ren | sram12_wr_fifo_ren | sram13_wr_fifo_ren | sram14_wr_fifo_ren | sram15_wr_fifo_ren | 
// 		sram16_wr_fifo_ren | sram17_wr_fifo_ren | sram18_wr_fifo_ren | sram19_wr_fifo_ren | sram20_wr_fifo_ren | sram21_wr_fifo_ren | sram22_wr_fifo_ren | sram23_wr_fifo_ren | 
// 		sram24_wr_fifo_ren | sram25_wr_fifo_ren | sram26_wr_fifo_ren | sram27_wr_fifo_ren | sram28_wr_fifo_ren | sram29_wr_fifo_ren | sram30_wr_fifo_ren | sram31_wr_fifo_ren;

assign sram_idle_cnt = {sram31_idle_cnt,sram30_idle_cnt,sram29_idle_cnt,sram28_idle_cnt,sram27_idle_cnt,sram26_idle_cnt,sram25_idle_cnt,sram24_idle_cnt,
					    sram23_idle_cnt,sram22_idle_cnt,sram21_idle_cnt,sram20_idle_cnt,sram19_idle_cnt,sram18_idle_cnt,sram17_idle_cnt,sram16_idle_cnt,
						sram15_idle_cnt,sram14_idle_cnt,sram13_idle_cnt,sram12_idle_cnt,sram11_idle_cnt,sram10_idle_cnt,sram9_idle_cnt,sram8_idle_cnt,
						sram7_idle_cnt,sram6_idle_cnt,sram5_idle_cnt,sram4_idle_cnt,sram3_idle_cnt,sram2_idle_cnt,sram1_idle_cnt,sram0_idle_cnt};

assign sram_addr = {sram31_addr,sram30_addr,sram29_addr,sram28_addr,sram27_addr,sram26_addr,sram25_addr,sram24_addr,sram23_addr,sram22_addr,sram21_addr,
                    sram20_addr,sram19_addr,sram18_addr,sram17_addr,sram16_addr,sram15_addr,sram14_addr,sram13_addr,sram12_addr,sram11_addr,sram10_addr,
					sram9_addr,sram8_addr,sram7_addr,sram6_addr,sram5_addr,sram4_addr,sram3_addr,sram2_addr,sram1_addr,sram0_addr};

// 定义 wr_use 和 rd_use
reg [511:0] wr_use [31:0];
reg [511:0] rd_use [31:0];

genvar i;
generate
    for (i = 0; i <= 31; i = i + 1) begin : wr_use_block
        always @ (posedge sys_clk)
        begin
            if (sys_rst)
                wr_use[i] <= 512'd0;
            else if (port0_addr_use[516:512] == i)
                wr_use[i] <= port0_addr_use[511:0];
            else if (port1_addr_use[516:512] == i)
                wr_use[i] <= port1_addr_use[511:0];
            else if (port2_addr_use[516:512] == i)
                wr_use[i] <= port2_addr_use[511:0];
            else if (port3_addr_use[516:512] == i)
                wr_use[i] <= port3_addr_use[511:0];
            else if (port4_addr_use[516:512] == i)
                wr_use[i] <= port4_addr_use[511:0];
            else if (port5_addr_use[516:512] == i)
                wr_use[i] <= port5_addr_use[511:0];
            else if (port6_addr_use[516:512] == i)
                wr_use[i] <= port6_addr_use[511:0];
            else if (port7_addr_use[516:512] == i)
                wr_use[i] <= port7_addr_use[511:0];
            else if (port8_addr_use[516:512] == i)
                wr_use[i] <= port8_addr_use[511:0];
            else if (port9_addr_use[516:512] == i)
                wr_use[i] <= port9_addr_use[511:0];
            else if (port10_addr_use[516:512] == i)
                wr_use[i] <= port10_addr_use[511:0];
            else if (port11_addr_use[516:512] == i)
                wr_use[i] <= port11_addr_use[511:0];
            else if (port12_addr_use[516:512] == i)
                wr_use[i] <= port12_addr_use[511:0];
            else if (port13_addr_use[516:512] == i)
                wr_use[i] <= port13_addr_use[511:0];
            else if (port14_addr_use[516:512] == i)
                wr_use[i] <= port14_addr_use[511:0];
            else if (port15_addr_use[516:512] == i)
                wr_use[i] <= port15_addr_use[511:0];
            else
                wr_use[i] <= wr_use[i];
        end
    end
endgenerate

generate
    for (i = 0; i <= 31; i = i + 1) begin : rd_use_block
        always @ (posedge sys_clk)
        begin
            if (sys_rst)
                rd_use[i] <= 512'd0;
            else if (rd0_addr_use[516:512] == i)
                rd_use[i] <= rd0_addr_use[511:0];
            else if (rd1_addr_use[516:512] == i)
                rd_use[i] <= rd1_addr_use[511:0];
            else if (rd2_addr_use[516:512] == i)
                rd_use[i] <= rd2_addr_use[511:0];
            else if (rd3_addr_use[516:512] == i)
                rd_use[i] <= rd3_addr_use[511:0];
            else if (rd4_addr_use[516:512] == i)
                rd_use[i] <= rd4_addr_use[511:0];
            else if (rd5_addr_use[516:512] == i)
                rd_use[i] <= rd5_addr_use[511:0];
            else if (rd6_addr_use[516:512] == i)
                rd_use[i] <= rd6_addr_use[511:0];
            else if (rd7_addr_use[516:512] == i)
                rd_use[i] <= rd7_addr_use[511:0];
            else if (rd8_addr_use[516:512] == i)
                rd_use[i] <= rd8_addr_use[511:0];
            else if (rd9_addr_use[516:512] == i)
                rd_use[i] <= rd9_addr_use[511:0];
            else if (rd10_addr_use[516:512] == i)
                rd_use[i] <= rd10_addr_use[511:0];
            else if (rd11_addr_use[516:512] == i)
                rd_use[i] <= rd11_addr_use[511:0];
            else if (rd12_addr_use[516:512] == i)
                rd_use[i] <= rd12_addr_use[511:0];
            else if (rd13_addr_use[516:512] == i)
                rd_use[i] <= rd13_addr_use[511:0];
            else if (rd14_addr_use[516:512] == i)
                rd_use[i] <= rd14_addr_use[511:0];
            else if (rd15_addr_use[516:512] == i)
                rd_use[i] <= rd15_addr_use[511:0];
            else
                rd_use[i] <= rd_use[i];
        end
    end
endgenerate

assign	rd_por_rd_sop = sram0_rd_sop | sram1_rd_sop	 | sram2_rd_sop	 | sram3_rd_sop	 | sram4_rd_sop	 | sram5_rd_sop	 | sram6_rd_sop	 | sram7_rd_sop	 | sram8_rd_sop	 | sram9_rd_sop	 | sram10_rd_sop  | sram11_rd_sop  | sram12_rd_sop  | sram13_rd_sop  | sram14_rd_sop  | sram15_rd_sop  | sram16_rd_sop  | sram17_rd_sop  | sram18_rd_sop  | sram19_rd_sop  | sram20_rd_sop  | sram21_rd_sop  | sram22_rd_sop  | sram23_rd_sop  | sram24_rd_sop  | sram25_rd_sop  | sram26_rd_sop  | sram27_rd_sop  | sram28_rd_sop  | sram29_rd_sop  | sram30_rd_sop  | sram31_rd_sop ;                                                                   
assign  rd_por_rd_eop = sram0_rd_eop | sram1_rd_eop	 | sram2_rd_eop	 | sram3_rd_eop	 | sram4_rd_eop	 | sram5_rd_eop	 | sram6_rd_eop	 | sram7_rd_eop	 | sram8_rd_eop	 | sram9_rd_eop	 | sram10_rd_eop  | sram11_rd_eop  | sram12_rd_eop  | sram13_rd_eop  | sram14_rd_eop  | sram15_rd_eop  | sram16_rd_eop  | sram17_rd_eop  | sram18_rd_eop  | sram19_rd_eop  | sram20_rd_eop  | sram21_rd_eop  | sram22_rd_eop  | sram23_rd_eop  | sram24_rd_eop  | sram25_rd_eop  | sram26_rd_eop  | sram27_rd_eop  | sram28_rd_eop  | sram29_rd_eop  | sram30_rd_eop  | sram31_rd_eop ;
assign  rd_por_rd_vld = sram0_rd_vld | sram1_rd_vld	 | sram2_rd_vld	 | sram3_rd_vld	 | sram4_rd_vld	 | sram5_rd_vld	 | sram6_rd_vld	 | sram7_rd_vld	 | sram8_rd_vld	 | sram9_rd_vld	 | sram10_rd_vld  | sram11_rd_vld  | sram12_rd_vld  | sram13_rd_vld  | sram14_rd_vld  | sram15_rd_vld  | sram16_rd_vld  | sram17_rd_vld  | sram18_rd_vld  | sram19_rd_vld  | sram20_rd_vld  | sram21_rd_vld  | sram22_rd_vld  | sram23_rd_vld  | sram24_rd_vld  | sram25_rd_vld  | sram26_rd_vld  | sram27_rd_vld  | sram28_rd_vld  | sram29_rd_vld  | sram30_rd_vld  | sram31_rd_vld ;
assign  rd_por_rd_data = sram0_rd_data | sram1_rd_data | sram2_rd_data | sram3_rd_data | sram4_rd_data | sram5_rd_data | sram6_rd_data | sram7_rd_data | sram8_rd_data | sram9_rd_data | sram10_rd_data | sram11_rd_data | sram12_rd_data | sram13_rd_data | sram14_rd_data | sram15_rd_data | sram16_rd_data | sram17_rd_data | sram18_rd_data | sram19_rd_data | sram20_rd_data | sram21_rd_data | sram22_rd_data | sram23_rd_data | sram24_rd_data | sram25_rd_data | sram26_rd_data | sram27_rd_data | sram28_rd_data | sram29_rd_data | sram30_rd_data | sram31_rd_data;


wr_sram #(
     .SRAM_INDEX   (0)
)
u_sram0(
	.sys_clk			(sys_clk			),
	.sys_rst			(sys_rst			),

	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram0_wr_fifo_ren	),//output
	.wr_fifo_data0		(sram0_wr_fifo_data	),//input
	
	.port_wr_done		(		            ),//写ram完成信号	
	.port_wr_re			(port_wr_re[0]		),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		),//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		            ),//duram完成信号	
	.port_rd_re			(port_rd_re[0]		),//du端口ram更新完成信号		
	.wr_use				(wr_use[0] 			), //如有需要，后面该位置需自行修改
	.rd_use				(rd_use[0]			), //如有需要，后面该位置需自行修改
	.sram_idle_cnt		(sram0_idle_cnt		), 
	.sram_addr			(sram0_addr			),

	.sram_addr_r		(sram0_addr_r		),
	.sram_data			(sram0_data			),
	.sram_cs			(sram0_cs			), //低有效
	.sram_oe			(sram0_oe			), //低有效
	.sram_we			(sram0_we			), //低有效

	.port_rd_sop		(sram0_rd_sop		),
	.port_rd_eop		(sram0_rd_eop		),
	.port_rd_vld		(sram0_rd_vld		),
	.port_rd_data 		(sram0_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (1)
)
u_sram1(
	.sys_clk			(sys_clk			),
	.sys_rst			(sys_rst			),

	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram1_wr_fifo_ren	),
	.wr_fifo_data0		(sram1_wr_fifo_data	),

	.port_wr_done		(		            ),//写ram完成信号	
	.port_wr_re			(port_wr_re[1]		),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		),//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		            ),//duram完成信号	
	.port_rd_re			(port_rd_re[1]		),//du端口ram更新完成信号		
	.wr_use				(wr_use[1] 		    ),
	.rd_use				(rd_use[1]		        ),
	.sram_idle_cnt		(sram1_idle_cnt		), 
	.sram_addr			(sram1_addr			),

	.sram_addr_r		(sram1_addr_r		),
	.sram_data			(sram1_data			),
	.sram_cs			(sram1_cs			), //低有效
	.sram_oe			(sram1_oe			), //低有效
	.sram_we			(sram1_we			), //低有效

	.port_rd_sop		(sram1_rd_sop		),
	.port_rd_eop		(sram1_rd_eop		),
	.port_rd_vld		(sram1_rd_vld		),
	.port_rd_data 		(sram1_rd_data 		)
  );
  
wr_sram #(
     .SRAM_INDEX   (2)
)
u_sram2(
	.sys_clk			(sys_clk			),
	.sys_rst			(sys_rst			),

	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram2_wr_fifo_ren	),
	.wr_fifo_data0		(sram2_wr_fifo_data	),

	.port_wr_done		(		            ),//写ram完成信号	
	.port_wr_re			(port_wr_re[2]		),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		),//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		            ),//duram完成信号	
	.port_rd_re			(port_rd_re[2]		),//du端口ram更新完成信号		
	.wr_use				(wr_use[2] 		    ),
	.rd_use				(rd_use[2]		        ),
	.sram_idle_cnt		(sram2_idle_cnt		), 
	.sram_addr			(sram2_addr			),

	.sram_addr_r		(sram2_addr_r		),
	.sram_data			(sram2_data			),
	.sram_cs			(sram2_cs			), //低有效
	.sram_oe			(sram2_oe			), //低有效
	.sram_we			(sram2_we			), //低有效

	.port_rd_sop		(sram2_rd_sop		),
	.port_rd_eop		(sram2_rd_eop		),
	.port_rd_vld		(sram2_rd_vld		),
	.port_rd_data 		(sram2_rd_data 		)
  ); 

// sram*_wr_fifo_data...
wr_sram #(
     .SRAM_INDEX   (3)
)
u_sram3(
	.sys_clk			(sys_clk			),
	.sys_rst			(sys_rst			),

	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram3_wr_fifo_ren	),
	.wr_fifo_data0		(sram3_wr_fifo_data	),

	.port_wr_done		(					),//写ram完成信号	
	.port_wr_re			(port_wr_re[3]		),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		),//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(					),//duram完成信号	
	.port_rd_re			(port_rd_re[3]		),//du端口ram更新完成信号		
	.wr_use				(wr_use[3] 			),
	.rd_use				(rd_use[3]				),
	.sram_idle_cnt		(sram3_idle_cnt		), 
	.sram_addr			(sram3_addr			),

	.sram_addr_r		(sram3_addr_r		),
	.sram_data			(sram3_data			),
	.sram_cs			(sram3_cs			), //低有效
	.sram_oe			(sram3_oe			), //低有效
	.sram_we			(sram3_we			), //低有效

	.port_rd_sop		(sram3_rd_sop		),
	.port_rd_eop		(sram3_rd_eop		),
	.port_rd_vld		(sram3_rd_vld		),
	.port_rd_data 		(sram3_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (4)
)
u_sram4(
	.sys_clk			(sys_clk			),
	.sys_rst			(sys_rst			),

	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram4_wr_fifo_ren	),
	.wr_fifo_data0		(sram4_wr_fifo_data	),

	.port_wr_done		(					),//写ram完成信号	
	.port_wr_re			(port_wr_re[4]		),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		),//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(					),//duram完成信号	
	.port_rd_re			(port_rd_re[4]		),//du端口ram更新完成信号		
	.wr_use				(wr_use[4] 			),
	.rd_use				(rd_use[4]				),
	.sram_idle_cnt		(sram4_idle_cnt		), 
	.sram_addr			(sram4_addr			),

	.sram_addr_r		(sram4_addr_r		),
	.sram_data			(sram4_data			),
	.sram_cs			(sram4_cs			), //低有效
	.sram_oe			(sram4_oe			), //低有效
	.sram_we			(sram4_we			), //低有效

	.port_rd_sop		(sram4_rd_sop		),
	.port_rd_eop		(sram4_rd_eop		),
	.port_rd_vld		(sram4_rd_vld		),
	.port_rd_data 		(sram4_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (5)
)
u_sram5(
	.sys_clk			(sys_clk			),
	.sys_rst			(sys_rst			),

	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram5_wr_fifo_ren	),
	.wr_fifo_data0		(sram5_wr_fifo_data	),

	.port_wr_done		(					),//写ram完成信号	
	.port_wr_re			(port_wr_re[5]		),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		),//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(					),//duram完成信号	
	.port_rd_re			(port_rd_re[5]		),//du端口ram更新完成信号		
	.wr_use				(wr_use[5] 			),
	.rd_use				(rd_use[5]				),
	.sram_idle_cnt		(sram5_idle_cnt		), 
	.sram_addr			(sram5_addr			),

	.sram_addr_r		(sram5_addr_r		),
	.sram_data			(sram5_data			),
	.sram_cs			(sram5_cs			), //低有效
	.sram_oe			(sram5_oe			), //低有效
	.sram_we			(sram5_we			), //低有效

	.port_rd_sop		(sram5_rd_sop		),
	.port_rd_eop		(sram5_rd_eop		),
	.port_rd_vld		(sram5_rd_vld		),
	.port_rd_data 		(sram5_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (6)
)
u_sram6(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram6_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram6_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[6]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[6]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[6] 			),
	.rd_use				(rd_use[6]				),
	.sram_idle_cnt		(sram6_idle_cnt		), 
	.sram_addr			(sram6_addr			),
	.sram_addr_r		(sram6_addr_r		)	,
	.sram_data			(sram6_data			),
	.sram_cs			(sram6_cs			), //低有效
	.sram_oe			(sram6_oe			), //低有效
	.sram_we			(sram6_we			) , //低有效
	.port_rd_sop		(sram6_rd_sop		),
	.port_rd_eop		(sram6_rd_eop		),
	.port_rd_vld		(sram6_rd_vld		),
	.port_rd_data 		(sram6_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (7)
)
u_sram7(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram7_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram7_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[7]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[7]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[7] 			),
	.rd_use				(rd_use[7]				),
	.sram_idle_cnt		(sram7_idle_cnt		), 
	.sram_addr			(sram7_addr			),
	.sram_addr_r		(sram7_addr_r		)	,
	.sram_data			(sram7_data			),
	.sram_cs			(sram7_cs			), //低有效
	.sram_oe			(sram7_oe			), //低有效
	.sram_we			(sram7_we			) , //低有效
	.port_rd_sop		(sram7_rd_sop		),
	.port_rd_eop		(sram7_rd_eop		),
	.port_rd_vld		(sram7_rd_vld		),
	.port_rd_data 		(sram7_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (8)
)
u_sram8(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram8_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram8_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[8]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[8]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[8] 			),
	.rd_use				(rd_use[8]				),
	.sram_idle_cnt		(sram8_idle_cnt		), 
	.sram_addr			(sram8_addr			),
	.sram_addr_r		(sram8_addr_r		)	,
	.sram_data			(sram8_data			),
	.sram_cs			(sram8_cs			), //低有效
	.sram_oe			(sram8_oe			), //低有效
	.sram_we			(sram8_we			) , //低有效
	.port_rd_sop		(sram8_rd_sop		),
	.port_rd_eop		(sram8_rd_eop		),
	.port_rd_vld		(sram8_rd_vld		),
	.port_rd_data 		(sram8_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (9)
)
u_sram9(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram9_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram9_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[9]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[9]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[9] 			),
	.rd_use				(rd_use[9]				),
	.sram_idle_cnt		(sram9_idle_cnt		), 
	.sram_addr			(sram9_addr			),
	.sram_addr_r		(sram9_addr_r		)	,
	.sram_data			(sram9_data			),
	.sram_cs			(sram9_cs			), //低有效
	.sram_oe			(sram9_oe			), //低有效
	.sram_we			(sram9_we			) , //低有效
	.port_rd_sop		(sram9_rd_sop		),
	.port_rd_eop		(sram9_rd_eop		),
	.port_rd_vld		(sram9_rd_vld		),
	.port_rd_data 		(sram9_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (10)
)
u_sram10(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram10_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram10_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[10]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[10]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[10] 			),
	.rd_use				(rd_use[10]				),
	.sram_idle_cnt		(sram10_idle_cnt		), 
	.sram_addr			(sram10_addr			),
	.sram_addr_r		(sram10_addr_r		)	,
	.sram_data			(sram10_data			),
	.sram_cs			(sram10_cs			), //低有效
	.sram_oe			(sram10_oe			), //低有效
	.sram_we			(sram10_we			) , //低有效
	.port_rd_sop		(sram10_rd_sop		),
	.port_rd_eop		(sram10_rd_eop		),
	.port_rd_vld		(sram10_rd_vld		),
	.port_rd_data 		(sram10_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (11)
)
u_sram11(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram11_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram11_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[11]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[11]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[11] 			),
	.rd_use				(rd_use[11]				),
	.sram_idle_cnt		(sram11_idle_cnt		), 
	.sram_addr			(sram11_addr			),
	.sram_addr_r		(sram11_addr_r		)	,
	.sram_data			(sram11_data			),
	.sram_cs			(sram11_cs			), //低有效
	.sram_oe			(sram11_oe			), //低有效
	.sram_we			(sram11_we			) , //低有效
	.port_rd_sop		(sram11_rd_sop		),
	.port_rd_eop		(sram11_rd_eop		),
	.port_rd_vld		(sram11_rd_vld		),
	.port_rd_data 		(sram11_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (12)
)
u_sram12(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram12_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram12_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[12]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[12]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[12] 			),
	.rd_use				(rd_use[12]				),
	.sram_idle_cnt		(sram12_idle_cnt		), 
	.sram_addr			(sram12_addr			),
	.sram_addr_r		(sram12_addr_r		)	,
	.sram_data			(sram12_data			),
	.sram_cs			(sram12_cs			), //低有效
	.sram_oe			(sram12_oe			), //低有效
	.sram_we			(sram12_we			) , //低有效
	.port_rd_sop		(sram12_rd_sop		),
	.port_rd_eop		(sram12_rd_eop		),
	.port_rd_vld		(sram12_rd_vld		),
	.port_rd_data 		(sram12_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (13)
)
u_sram13(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram13_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram13_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[13]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[13]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[13] 			),
	.rd_use				(rd_use[13]				),
	.sram_idle_cnt		(sram13_idle_cnt		), 
	.sram_addr			(sram13_addr			),
	.sram_addr_r		(sram13_addr_r		)	,
	.sram_data			(sram13_data			),
	.sram_cs			(sram13_cs			), //低有效
	.sram_oe			(sram13_oe			), //低有效
	.sram_we			(sram13_we			) , //低有效
	.port_rd_sop		(sram13_rd_sop		),
	.port_rd_eop		(sram13_rd_eop		),
	.port_rd_vld		(sram13_rd_vld		),
	.port_rd_data 		(sram13_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (14)
)
u_sram14(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram14_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram14_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[14]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[14]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[14] 			),
	.rd_use				(rd_use[14]				),
	.sram_idle_cnt		(sram14_idle_cnt		), 
	.sram_addr			(sram14_addr			),
	.sram_addr_r		(sram14_addr_r		)	,
	.sram_data			(sram14_data			),
	.sram_cs			(sram14_cs			), //低有效
	.sram_oe			(sram14_oe			), //低有效
	.sram_we			(sram14_we			) , //低有效
	.port_rd_sop		(sram14_rd_sop		),
	.port_rd_eop		(sram14_rd_eop		),
	.port_rd_vld		(sram14_rd_vld		),
	.port_rd_data 		(sram14_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (15)
)
u_sram15(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram15_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram15_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[15]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[15]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[15] 			),
	.rd_use				(rd_use[15]				),
	.sram_idle_cnt		(sram15_idle_cnt		), 
	.sram_addr			(sram15_addr			),
	.sram_addr_r		(sram15_addr_r		)	,
	.sram_data			(sram15_data			),
	.sram_cs			(sram15_cs			), //低有效
	.sram_oe			(sram15_oe			), //低有效
	.sram_we			(sram15_we			) , //低有效
	.port_rd_sop		(sram15_rd_sop		),
	.port_rd_eop		(sram15_rd_eop		),
	.port_rd_vld		(sram15_rd_vld		),
	.port_rd_data 		(sram15_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (16)
)
u_sram16(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram16_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram16_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[16]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[16]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[16] 			),
	.rd_use				(rd_use[16]				),
	.sram_idle_cnt		(sram16_idle_cnt		), 
	.sram_addr			(sram16_addr			),
	.sram_addr_r		(sram16_addr_r		)	,
	.sram_data			(sram16_data			),
	.sram_cs			(sram16_cs			), //低有效
	.sram_oe			(sram16_oe			), //低有效
	.sram_we			(sram16_we			) , //低有效
	.port_rd_sop		(sram16_rd_sop		),
	.port_rd_eop		(sram16_rd_eop		),
	.port_rd_vld		(sram16_rd_vld		),
	.port_rd_data 		(sram16_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (17)
)
u_sram17(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram17_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram17_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[17]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[17]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[17] 			),
	.rd_use				(rd_use[17]				),
	.sram_idle_cnt		(sram17_idle_cnt		), 
	.sram_addr			(sram17_addr			),
	.sram_addr_r		(sram17_addr_r		)	,
	.sram_data			(sram17_data			),
	.sram_cs			(sram17_cs			), //低有效
	.sram_oe			(sram17_oe			), //低有效
	.sram_we			(sram17_we			) , //低有效
	.port_rd_sop		(sram17_rd_sop		),
	.port_rd_eop		(sram17_rd_eop		),
	.port_rd_vld		(sram17_rd_vld		),
	.port_rd_data 		(sram17_rd_data 		)
  );
 
wr_sram #(
     .SRAM_INDEX   (18)
)
u_sram18(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram18_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram18_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[18]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[18]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[18] 			),
	.rd_use				(rd_use[18]				),
	.sram_idle_cnt		(sram18_idle_cnt		), 
	.sram_addr			(sram18_addr			),
	.sram_addr_r		(sram18_addr_r		)	,
	.sram_data			(sram18_data			),
	.sram_cs			(sram18_cs			), //低有效
	.sram_oe			(sram18_oe			), //低有效
	.sram_we			(sram18_we			) , //低有效
	.port_rd_sop		(sram18_rd_sop		),
	.port_rd_eop		(sram18_rd_eop		),
	.port_rd_vld		(sram18_rd_vld		),
	.port_rd_data 		(sram18_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (19)
)
u_sram19(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram19_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram19_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[19]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[19]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[19] 			),
	.rd_use				(rd_use[19]				),
	.sram_idle_cnt		(sram19_idle_cnt		), 
	.sram_addr			(sram19_addr			),
	.sram_addr_r		(sram19_addr_r		)	,
	.sram_data			(sram19_data			),
	.sram_cs			(sram19_cs			), //低有效
	.sram_oe			(sram19_oe			), //低有效
	.sram_we			(sram19_we			) , //低有效
	.port_rd_sop		(sram19_rd_sop		),
	.port_rd_eop		(sram19_rd_eop		),
	.port_rd_vld		(sram19_rd_vld		),
	.port_rd_data 		(sram19_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (20)
)
u_sram20(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram20_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram20_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[20]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[20]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[20] 			),
	.rd_use				(rd_use[20]				),
	.sram_idle_cnt		(sram20_idle_cnt		), 
	.sram_addr			(sram20_addr			),
	.sram_addr_r		(sram20_addr_r		)	,
	.sram_data			(sram20_data			),
	.sram_cs			(sram20_cs			), //低有效
	.sram_oe			(sram20_oe			), //低有效
	.sram_we			(sram20_we			) , //低有效
	.port_rd_sop		(sram20_rd_sop		),
	.port_rd_eop		(sram20_rd_eop		),
	.port_rd_vld		(sram20_rd_vld		),
	.port_rd_data 		(sram20_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (21)
)
u_sram21(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram21_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram21_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[21]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[21]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[21] 			),
	.rd_use				(rd_use[21]				),
	.sram_idle_cnt		(sram21_idle_cnt		), 
	.sram_addr			(sram21_addr			),
	.sram_addr_r		(sram21_addr_r		)	,
	.sram_data			(sram21_data			),
	.sram_cs			(sram21_cs			), //低有效
	.sram_oe			(sram21_oe			), //低有效
	.sram_we			(sram21_we			) , //低有效
	.port_rd_sop		(sram21_rd_sop		),
	.port_rd_eop		(sram21_rd_eop		),
	.port_rd_vld		(sram21_rd_vld		),
	.port_rd_data 		(sram21_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (22)
)
u_sram22(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram22_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram22_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[22]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[22]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[22] 			),
	.rd_use				(rd_use[22]				),
	.sram_idle_cnt		(sram22_idle_cnt		), 
	.sram_addr			(sram22_addr			),
	.sram_addr_r		(sram22_addr_r		)	,
	.sram_data			(sram22_data			),
	.sram_cs			(sram22_cs			), //低有效
	.sram_oe			(sram22_oe			), //低有效
	.sram_we			(sram22_we			) , //低有效
	.port_rd_sop		(sram22_rd_sop		),
	.port_rd_eop		(sram22_rd_eop		),
	.port_rd_vld		(sram22_rd_vld		),
	.port_rd_data 		(sram22_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (23)
)
u_sram23(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram23_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram23_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[23]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[23]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[23] 			),
	.rd_use				(rd_use[23]				),
	.sram_idle_cnt		(sram23_idle_cnt		), 
	.sram_addr			(sram23_addr			),
	.sram_addr_r		(sram23_addr_r		)	,
	.sram_data			(sram23_data			),
	.sram_cs			(sram23_cs			), //低有效
	.sram_oe			(sram23_oe			), //低有效
	.sram_we			(sram23_we			) , //低有效
	.port_rd_sop		(sram23_rd_sop		),
	.port_rd_eop		(sram23_rd_eop		),
	.port_rd_vld		(sram23_rd_vld		),
	.port_rd_data 		(sram23_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (24)
)
u_sram24(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram24_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram24_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[24]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[24]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[24] 			),
	.rd_use				(rd_use[24]				),
	.sram_idle_cnt		(sram24_idle_cnt		), 
	.sram_addr			(sram24_addr			),
	.sram_addr_r		(sram24_addr_r		)	,
	.sram_data			(sram24_data			),
	.sram_cs			(sram24_cs			), //低有效
	.sram_oe			(sram24_oe			), //低有效
	.sram_we			(sram24_we			) , //低有效
	.port_rd_sop		(sram24_rd_sop		),
	.port_rd_eop		(sram24_rd_eop		),
	.port_rd_vld		(sram24_rd_vld		),
	.port_rd_data 		(sram24_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (25)
)
u_sram25(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram25_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram25_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[25]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[25]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[25] 			),
	.rd_use				(rd_use[25]				),
	.sram_idle_cnt		(sram25_idle_cnt		), 
	.sram_addr			(sram25_addr			),
	.sram_addr_r		(sram25_addr_r		)	,
	.sram_data			(sram25_data			),
	.sram_cs			(sram25_cs			), //低有效
	.sram_oe			(sram25_oe			), //低有效
	.sram_we			(sram25_we			) , //低有效
	.port_rd_sop		(sram25_rd_sop		),
	.port_rd_eop		(sram25_rd_eop		),
	.port_rd_vld		(sram25_rd_vld		),
	.port_rd_data 		(sram25_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (26)
)
u_sram26(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram26_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram26_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[26]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[26]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[26] 			),
	.rd_use				(rd_use[26]				),
	.sram_idle_cnt		(sram26_idle_cnt		), 
	.sram_addr			(sram26_addr			),
	.sram_addr_r		(sram26_addr_r		)	,
	.sram_data			(sram26_data			),
	.sram_cs			(sram26_cs			), //低有效
	.sram_oe			(sram26_oe			), //低有效
	.sram_we			(sram26_we			) , //低有效
	.port_rd_sop		(sram26_rd_sop		),
	.port_rd_eop		(sram26_rd_eop		),
	.port_rd_vld		(sram26_rd_vld		),
	.port_rd_data 		(sram26_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (27)
)
u_sram27(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram27_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram27_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[27]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[27]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[27] 			),
	.rd_use				(rd_use[27]				),
	.sram_idle_cnt		(sram27_idle_cnt		), 
	.sram_addr			(sram27_addr			),
	.sram_addr_r		(sram27_addr_r		)	,
	.sram_data			(sram27_data			),
	.sram_cs			(sram27_cs			), //低有效
	.sram_oe			(sram27_oe			), //低有效
	.sram_we			(sram27_we			) , //低有效
	.port_rd_sop		(sram27_rd_sop		),
	.port_rd_eop		(sram27_rd_eop		),
	.port_rd_vld		(sram27_rd_vld		),
	.port_rd_data 		(sram27_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (28)
)
u_sram28(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram28_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram28_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[28]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[28]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[28] 			),
	.rd_use				(rd_use[28]				),
	.sram_idle_cnt		(sram28_idle_cnt		), 
	.sram_addr			(sram28_addr			),
	.sram_addr_r		(sram28_addr_r		)	,
	.sram_data			(sram28_data			),
	.sram_cs			(sram28_cs			), //低有效
	.sram_oe			(sram28_oe			), //低有效
	.sram_we			(sram28_we			) , //低有效
	.port_rd_sop		(sram28_rd_sop		),
	.port_rd_eop		(sram28_rd_eop		),
	.port_rd_vld		(sram28_rd_vld		),
	.port_rd_data 		(sram28_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (29)
)
u_sram29(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram29_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram29_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[29]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[29]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[29] 			),
	.rd_use				(rd_use[29]				),
	.sram_idle_cnt		(sram29_idle_cnt		), 
	.sram_addr			(sram29_addr			),
	.sram_addr_r		(sram29_addr_r		)	,
	.sram_data			(sram29_data			),
	.sram_cs			(sram29_cs			), //低有效
	.sram_oe			(sram29_oe			), //低有效
	.sram_we			(sram29_we			) , //低有效
	.port_rd_sop		(sram29_rd_sop		),
	.port_rd_eop		(sram29_rd_eop		),
	.port_rd_vld		(sram29_rd_vld		),
	.port_rd_data 		(sram29_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (30)
)
u_sram30(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram30_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram30_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[30]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[30]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[30] 			),
	.rd_use				(rd_use[30]				),
	.sram_idle_cnt		(sram30_idle_cnt		), 
	.sram_addr			(sram30_addr			),
	.sram_addr_r		(sram30_addr_r		)	,
	.sram_data			(sram30_data			),
	.sram_cs			(sram30_cs			), //低有效
	.sram_oe			(sram30_oe			), //低有效
	.sram_we			(sram30_we			) , //低有效
	.port_rd_sop		(sram30_rd_sop		),
	.port_rd_eop		(sram30_rd_eop		),
	.port_rd_vld		(sram30_rd_vld		),
	.port_rd_data 		(sram30_rd_data 		)
  );

wr_sram #(
     .SRAM_INDEX   (31)
)
u_sram31(
	.sys_clk			(sys_clk			)	,
	.sys_rst			(sys_rst			)	,
	.port_req_done		(port_req_done		),			
	.port_que_info		(port_que_info		),	
	.wr_fifo_ren0		(sram31_wr_fifo_ren		)	,
	.wr_fifo_data0		(sram31_wr_fifo_data		),
	.port_wr_done		(		),//写ram完成信号	
	.port_wr_re			(port_wr_re[31]			),//写端口ram更新完成信号	
	.rd_req_done		(rd_req_done		)	,//可以读地址	
	.rd_info	        (port_rd_info		),
	.port_rd_done		(		),//duram完成信号	
	.port_rd_re			(port_rd_re[31]			),//du端口ram更新完成信号		
	.wr_use				(wr_use[31] 			),
	.rd_use				(rd_use[31]				),
	.sram_idle_cnt		(sram31_idle_cnt		), 
	.sram_addr			(sram31_addr			),
	.sram_addr_r		(sram31_addr_r		)	,
	.sram_data			(sram31_data			),
	.sram_cs			(sram31_cs			), //低有效
	.sram_oe			(sram31_oe			), //低有效
	.sram_we			(sram31_we			) , //低有效
	.port_rd_sop		(sram31_rd_sop		),
	.port_rd_eop		(sram31_rd_eop		),
	.port_rd_vld		(sram31_rd_vld		),
	.port_rd_data 		(sram31_rd_data 		)
  );


  endmodule