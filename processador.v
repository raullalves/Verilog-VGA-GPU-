module GPU_processador(
	h_pos,
	v_pos,
	clk,
	rst,
	//RGB_in,
	
	//addr,
	indice,
	R_out,
	G_out,
	B_out,
	clock_segundo,contador_segundo
	
);
//obtem as posicoes atuais do controlador vga
//obtem o pixel background atual da memoria, relativo à essa posicao
//envia o pixel atual com o indice sprite relacionado para o modulo sprite
	
	input clk, rst;
	input [9:0] h_pos, v_pos;
	//input [23:0] RGB_in;
	output reg [7:0] R_out, G_out, B_out;
	output reg [7:0] indice;
	output reg [25:0] contador_segundo;
	output reg clock_segundo;
	//output reg [10:0] addr;
	reg [9:0] h_pos_minimo, h_pos_maximo, v_pos_minimo, v_pos_maximo, h_pos_minimo2, h_pos_maximo2, v_pos_minimo2, v_pos_maximo2;
	
	
	always @(posedge clk)
	begin
	
		if (rst == 1'b1)
		begin
			//contador <= 4'b0000;
			indice <= 8'h00;
			R_out <= 8'b11111100;
			G_out <= 8'b11111100;
			B_out <= 8'b00000000;
			clock_segundo <= 0;
			contador_segundo <= 0;
			h_pos_minimo <= 140;
			h_pos_maximo <= 190;
			h_pos_minimo2 <= 540;
			h_pos_maximo2 <= 580;
			v_pos_minimo <= 80;
			v_pos_maximo <= 120;
			v_pos_minimo2 <= 360;
			v_pos_maximo2 <= 400;
			
		end
		
		else
		begin
		
			if(contador_segundo == 12999999 ) begin
					clock_segundo <= !clock_segundo;
					contador_segundo <= 0;
				
					v_pos_minimo <= v_pos_minimo + 20;
					v_pos_maximo <= v_pos_maximo + 20;
				
					v_pos_minimo2 <= v_pos_minimo2 - 20;
					v_pos_maximo2 <= v_pos_maximo2 - 20;
				
					if (v_pos_maximo > 400) begin
						v_pos_minimo <= 80;
						v_pos_maximo <= 120;
					end
				
					if (v_pos_maximo2 < 100) begin
						v_pos_minimo2 <= 360;
						v_pos_maximo2 <= 400;
					end
				
				
				end
				else contador_segundo <= contador_segundo + 1;
			
			//testando sprites
			if ( (v_pos > v_pos_minimo ) && (v_pos < v_pos_maximo) && (h_pos > h_pos_minimo) && (h_pos < h_pos_maximo))
					indice <= 25;
			else
			begin
				if ( (v_pos > v_pos_minimo2 ) && (v_pos < v_pos_maximo2) && (h_pos > h_pos_minimo2) && (h_pos < h_pos_maximo2))
					indice <= 52;
				else	indice <= 8'b00000000;
			end
				
			R_out <= 8'b11111100;
			G_out <= 8'b11111100;
			B_out <= 8'b00000000;
			
		end
		
	end
	
	

endmodule