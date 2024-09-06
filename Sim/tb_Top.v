`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/01 10:47:36
// Design Name: 
// Module Name: tb_Top
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

module tb_Top();

reg			sys_clk			;
reg			sys_rst			;
	
reg			port0_wr_sop	;
reg			port0_wr_eop	;
reg			port0_wr_vld	;
reg	 [7:0]	port0_wr_data	;	
wire		port0_rd_sop	;
wire		port0_rd_eop	;
wire		port0_rd_vld	;
wire [7:0]	port0_rd_data	;
wire		port0_ready	    ;
wire		port0_full		;

reg			port1_wr_sop	;
reg			port1_wr_eop	;
reg			port1_wr_vld	;
reg	 [7:0]	port1_wr_data	;	
wire		port1_rd_sop	;
wire		port1_rd_eop	;
wire		port1_rd_vld	;
wire [7:0]	port1_rd_data	;
wire		port1_ready	    ;
wire		port1_full		;

reg			port2_wr_sop	;
reg			port2_wr_eop	;
reg			port2_wr_vld	;
reg	 [7:0]	port2_wr_data	;	
wire		port2_rd_sop	;
wire		port2_rd_eop	;
wire		port2_rd_vld	;
wire [7:0]	port2_rd_data	;
wire		port2_ready	    ;
wire		port2_full		;


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
		port0_wr_sop <= 1'b0;
	else if(cnt == 10)
		port0_wr_sop <= 1'b1;
	else
		port0_wr_sop <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port0_wr_eop <= 1'b0;
	else if(cnt == 76)
		port0_wr_eop <= 1'b1;
	else
		port0_wr_eop <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port0_wr_vld <= 1'b0;
	else if(cnt >= 10 && cnt < 77)
		port0_wr_vld <= 1'b1;
	else
		port0_wr_vld <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port0_wr_data <= 8'd0;
	else if(cnt == 10)
		port0_wr_data <= 8'h11;//[7:4]:pri;[3:0]:dest_port
	else if(cnt == 11)
		port0_wr_data <= 8'h0;		
	else if(port0_wr_vld)
		port0_wr_data <= port0_wr_data + 1'b1;
	else
		port0_wr_data <= 8'd0;
end

//--------------------------------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		port1_wr_sop <= 1'b0;
	else if(cnt == 20)
		port1_wr_sop <= 1'b1;
	else
		port1_wr_sop <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port1_wr_eop <= 1'b0;
	else if(cnt == 86)
		port1_wr_eop <= 1'b1;
	else
		port1_wr_eop <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port1_wr_vld <= 1'b0;
	else if(cnt >= 20 && cnt < 87)
		port1_wr_vld <= 1'b1;
	else
		port1_wr_vld <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port1_wr_data <= 8'd0;
	else if(cnt == 20)
		port1_wr_data <= 8'h21;//[7:4]:pri;[3:0]:dest_port
	else if(cnt == 21)
		port1_wr_data <= 8'h0;		
	else if(port1_wr_vld)
		port1_wr_data <= port1_wr_data + 1'b1;
	else
		port1_wr_data <= 8'd0;
end

//--------------------------------------
always @ (posedge sys_clk)
begin
	if(sys_rst)
		port2_wr_sop <= 1'b0;
	else if(cnt == 20)
		port2_wr_sop <= 1'b1;
	else
		port2_wr_sop <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port2_wr_eop <= 1'b0;
	else if(cnt == 86)
		port2_wr_eop <= 1'b1;
	else
		port2_wr_eop <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port2_wr_vld <= 1'b0;
	else if(cnt >= 20 && cnt < 87)
		port2_wr_vld <= 1'b1;
	else
		port2_wr_vld <= 1'b0;
end	

always @ (posedge sys_clk)
begin
	if(sys_rst)
		port2_wr_data <= 8'd0;
	else if(cnt == 20)
		port2_wr_data <= 8'h31;//[7:4]:pri;[3:0]:dest_port
	else if(cnt == 21)
		port2_wr_data <= 8'h0;		
	else if(port2_wr_vld)
		port2_wr_data <= port2_wr_data + 1'b1;
	else
		port2_wr_data <= 8'd0;
end

Top u_Top(
    .sys_clk			(sys_clk		),
    .sys_rst			(sys_rst		),
    .port0_wr_sop		(port0_wr_sop	),
    .port0_wr_eop		(port0_wr_eop	),
    .port0_wr_vld		(port0_wr_vld	),
    .port0_wr_data		(port0_wr_data	),
    .port0_rd_sop		(port0_rd_sop	),
    .port0_rd_eop		(port0_rd_eop	),
    .port0_rd_vld		(port0_rd_vld	),
    .port0_rd_data		(port0_rd_data	),	
    .port0_ready		(port0_ready	),	
    .port0_full		    (port0_full		),
    .port1_wr_sop		(port1_wr_sop	),
    .port1_wr_eop		(port1_wr_eop	),
    .port1_wr_vld		(port1_wr_vld	),
    .port1_wr_data		(port1_wr_data	),
    .port1_rd_sop		(port1_rd_sop	),
    .port1_rd_eop		(port1_rd_eop	),
    .port1_rd_vld		(port1_rd_vld	),
    .port1_rd_data		(port1_rd_data	),	
    .port1_ready		(port1_ready	),	
    .port1_full		    (port1_full		),	
    .port2_wr_sop		(port2_wr_sop	),
    .port2_wr_eop		(port2_wr_eop	),
    .port2_wr_vld		(port2_wr_vld	),
    .port2_wr_data		(port2_wr_data	),
    .port2_rd_sop		(port2_rd_sop	),
    .port2_rd_eop		(port2_rd_eop	),
    .port2_rd_vld		(port2_rd_vld	),
    .port2_rd_data		(port2_rd_data	),	
    .port2_ready		(port2_ready	),	
    .port2_full		    (port2_full		)	

);

endmodule
