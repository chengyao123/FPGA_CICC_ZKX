`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/19 09:13:20
// Design Name: 
// Module Name: tb_check
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


module tb_check();

reg				sys_clk		;
reg				sys_rst		;
reg          	por_rd_sop  ;
reg           	por_rd_eop  ;
reg           	por_rd_vld  ;
reg  [7:0]    	por_rd_data ;
wire           	rd_sop      ;
wire           	rd_eop      ;
wire           	rd_vld      ;
wire  [8:0]    	rd_data     ;

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
		por_rd_sop <= 1'b0;
	else if(cnt == 10)
		por_rd_sop <= 1'b1;
	else
		por_rd_sop <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		por_rd_eop <= 1'b0;
	else if(cnt == 76)
		por_rd_eop <= 1'b1;
	else
		por_rd_eop <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		por_rd_vld <= 1'b0;
	else if(cnt >= 10 && cnt < 77)
		por_rd_vld <= 1'b1;
	else
		por_rd_vld <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		por_rd_data <= 8'd0;
	else if(cnt == 10)
		por_rd_data <= 8'h11;//[7:4]:pri;[3:0]:dest_port
	else if(cnt == 11)
		por_rd_data <= 8'h0;		
	else if(por_rd_vld)
		por_rd_data <= por_rd_data + 1'b1;
	else
		por_rd_data <= 8'd0;
end



check u_check(

    .sys_clk	  (sys_clk	),
    .sys_rst	  (sys_rst	),
    .por_rd_sop   (por_rd_sop ),
    .por_rd_eop   (por_rd_eop ),
    .por_rd_vld   (por_rd_vld ),
    .por_rd_data  (por_rd_data),
    .rd_sop       (rd_sop     ),
    .rd_eop       (rd_eop     ),
    .rd_vld       (rd_vld     ),
    .rd_data      (rd_data    )

    );




endmodule
