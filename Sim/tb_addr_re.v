`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/12 14:57:28
// Design Name: 
// Module Name: tb_addr_re
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


module tb_addr_re();

reg			sys_clk			;
reg			sys_rst			;

reg			wr_start		;
reg			rd_start		;
reg	[511:0] wr_use			;
reg	[511:0] rd_use			;
	
wire		done			;
wire  [8:0]	sram_idle_cnt	; 
wire  [8:0]	sram_addr	    ;
	
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
		wr_start <= 1'b0;
		wr_use   <= 512'h0;
	end
	else if(cnt == 10)
	begin
		wr_start <= 1'b1;
		wr_use   <= 512'hbffd;
	end
	else
	begin
		wr_start <= 1'b0;
		wr_use   <= 512'h0;
	end
end		
	
addr_re u_addr_re(
    .sys_clk			(sys_clk		),
    .sys_rst			(sys_rst		),
    .wr_start			(wr_start		),
    .rd_start			(rd_start		),
    .wr_use				(wr_use			),
    .rd_use				(rd_use			),
    .done				(done			),
    .sram_idle_cnt		(sram_idle_cnt	), 
    .sram_addr			(sram_addr		)
);	

endmodule
