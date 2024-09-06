`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/14 20:32:09
// Design Name: 
// Module Name: tb_wr_sram
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


module tb_wr_sram( );
reg			sys_clk				;
reg			sys_rst				;
reg			port_req_done		;//可以写地址			
reg  [31:0]	port_que_info		;	
	
wire 		wr_fifo_ren			;
wire [7:0]  wr_fifo_data		;
wire	    port_wr_done		;//写ram完成信号	
wire	    port_wr_re			;//写端口ram更新完成信号	
wire  [14:0]sram0_addr			;
wire  [7:0]	sram0_data			;
wire          sram0_cs			; //低有效
wire          sram0_oe			; //低有效
wire          sram0_we			; //低有效
reg	 [15:0]	cnt				;

initial
begin
#0
sys_clk = 1'b1;
sys_rst = 1'b1;
#1000
sys_rst = 1'b0;
end

always #10 sys_clk = ~sys_clk;

always @ (posedge sys_clk)
begin
	if(sys_rst)
		cnt <= 16'd0;
	else
		cnt <= cnt + 1'b1;
end		

always @ (posedge sys_clk)
begin
	if(sys_rst)
	begin
		port_req_done <= 1'b0;
		port_que_info <= 32'h0;
	end
	else if(cnt == 10)
	begin
		port_req_done <= 1'b1;
		port_que_info <= 32'h10421;
	end
	else
	begin
		port_req_done <= 1'b0;
		port_que_info <= 32'h0;
	end
end	

wr_sram u_wr_sram(
    .sys_clk			(sys_clk		)	,
    .sys_rst			(sys_rst		)	,
    .port_req_done		(port_req_done	),//可以写地址			
    .port_que_info		(port_que_info	),	
    .wr_fifo_ren		(wr_fifo_ren	)	,
    .wr_fifo_data		(wr_fifo_data	),
    .port_wr_done		(port_wr_done	),//写ram完成信号	
    .port_wr_re			(port_wr_re		),//写端口ram更新完成信号	
    .sram0_addr			(sram0_addr		),
    .sram0_data			(sram0_data		),
    .sram0_cs			(sram0_cs		), //低有效
    .sram0_oe			(sram0_oe		), //低有效
    .sram0_we			(sram0_we		)  //低有效
  );



endmodule
