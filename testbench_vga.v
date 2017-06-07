`timescale 1ps / 1ps
module testbench_vga();
	reg	clk,rst;
	wire clock_segundo;
	wire [25:0] contador_segundo;
	//vga
	
	wire [7:0] R_in, G_in, B_in;
	
	wire [7:0] R, G, B;
	wire HS, VS;
	wire BLANK;
	wire VGA_SYNC, VGA_CLK;

	wire [9:0] h_pos, v_pos;

	//gpu
	wire [7:0] indice, R_out_gpu, G_out_gpu, B_out_gpu;
	
	VGA_Interface_block duv_vga( clk,
	rst,
	R_in,
	G_in,
	B_in,
	R,G,B,
	HS,VS,
	BLANK,
	VGA_SYNC,
	VGA_CLK,
	h_pos,
	v_pos);
	
	GPU_processador duv_gpu(
	h_pos,
	v_pos,
	clk,
	rst,
	//RGB_in,
	
	//addr,
	indice,
	R_out_gpu,
	G_out_gpu,
	B_out_gpu,clock_segundo,contador_segundo
	
);

sprites_controlador duv_sprites(
	
	clk,
	rst,
	indice,
	R_out_gpu,
	G_out_gpu,
	B_out_gpu,
	R_in,
	G_in,
	B_in


);

	
	initial begin
		clk = 0;	
		rst = 1; 
	end
	
	
	always begin
		#10;
		clk <= !clk; 
	end
	
	always @(posedge rst) begin
		#17; 
		rst <= 0;
	end


endmodule