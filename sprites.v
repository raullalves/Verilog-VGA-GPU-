//lab 4

module sprites_controlador(
	
	clk,
	rst,
	 indice,
	R_in,
	G_in,
	B_in,
	R_out,
	G_out,
	B_out


);

	input clk, rst;
	input [7:0] indice, R_in, G_in, B_in;
	output reg [7:0] R_out, G_out, B_out;
	
	
//definção de 256 combinacoes rgb diferentes

	wire [23:0] sprites[0:255];
	
	assign sprites[0] = 24'h000000;  
	assign sprites[1] = 24'h800000;
	assign sprites[2] = 24'h008000;
	assign sprites[3] = 24'h808000;  
	assign sprites[4] = 24'h000080;
	assign sprites[5] = 24'h800080;
	assign sprites[6] = 24'h008080;
	assign sprites[7] = 24'hc0c0c0;
	assign sprites[8] = 24'h808080;
	assign sprites[9] = 24'hff0000;
	assign sprites[10] = 24'h00ff00;
	assign sprites[11] = 24'hffff00;
	assign sprites[12] = 24'h0000ff;
	assign sprites[13] = 24'hff00ff;
	assign sprites[14] = 24'h00ffff;
	assign sprites[15] = 24'hffffff;
	assign sprites[16] = 24'h000000;
	assign sprites[17] = 24'h00005f;
	assign sprites[18] = 24'h000087;
	assign sprites[19] = 24'h0000af;
	assign sprites[20] = 24'h0000d7;
	assign sprites[21] = 24'h0000ff;
	assign sprites[22] = 24'h005f00;
	assign sprites[23] = 24'h005f5f;
	assign sprites[24] = 24'h005f87;
	assign sprites[25] = 24'h005faf;
	assign sprites[26] = 24'h005fd7;
	assign sprites[27] = 24'h005fff;
	assign sprites[28] = 24'h008700;
	assign sprites[29] = 24'h00875f; 
	assign sprites[30] = 24'h008787;
	assign sprites[31] = 24'h0087af;
	assign sprites[32] = 24'h0087d7;
	assign sprites[33] = 24'h0087ff;
	assign sprites[34] = 24'h00af00; 
	assign sprites[35] = 24'h00af5f;
	assign sprites[36] = 24'h00af87;
	assign sprites[37] = 24'h00afaf;
	assign sprites[38] = 24'h00afd7;
	assign sprites[39] = 24'h00afff;
	assign sprites[40] = 24'h00d700; 
	assign sprites[41] = 24'h00d75f;
	assign sprites[42] = 24'h00d787;
	assign sprites[43] = 24'h00d7af;
	assign sprites[44] = 24'h00d7d7;
	assign sprites[45] = 24'h00d7ff;
	assign sprites[46] = 24'h00ff00; 
	assign sprites[47] = 24'h00ff5f;
	assign sprites[48] = 24'h00ff87;
	assign sprites[49] = 24'h00ffaf;
	assign sprites[50] = 24'h00ffd7;
	assign sprites[51] = 24'h00ffff;
	assign sprites[52] = 24'h5f0000; 
	assign sprites[53] = 24'h5f005f;
	assign sprites[54] = 24'h5f0087;
	assign sprites[55] = 24'h5f00af;
	assign sprites[56] = 24'h5f00d7;
	assign sprites[57] = 24'h5f00ff;
	assign sprites[58] = 24'h5f5f00; 
	assign sprites[59] = 24'h5f5f5f;
	assign sprites[60] = 24'h5f5f87;
	assign sprites[61] = 24'h5f5faf;
	assign sprites[62] = 24'h5f5fd7;
	assign sprites[63] = 24'h5f5fff;
	assign sprites[64] = 24'h5f8700; 
	assign sprites[65] = 24'h5f875f;
	assign sprites[66] = 24'h5f8787;
	assign sprites[67] = 24'h5f87af;
	assign sprites[68] = 24'h5f87d7;
	assign sprites[69] = 24'h5f87ff;
	assign sprites[70] = 24'h5faf00; 
	assign sprites[71] = 24'h5faf5f;
	assign sprites[72] = 24'h5faf87;
	assign sprites[73] = 24'h5fafaf;
	assign sprites[74] = 24'h5fafd7;
	assign sprites[75] = 24'h5fafff;
	assign sprites[76] = 24'h5fd700; 
	assign sprites[77] = 24'h5fd75f;
	assign sprites[78] = 24'h5fd787;
	assign sprites[79] = 24'h5fd7af;
	assign sprites[80] = 24'h5fd7d7;
	assign sprites[81] = 24'h5fd7ff;
	assign sprites[82] = 24'h5fff00; 
	assign sprites[83] = 24'h5fff5f;
	assign sprites[84] = 24'h5fff87;
	assign sprites[85] = 24'h5fffaf;
	assign sprites[86] = 24'h5fffd7;
	assign sprites[87] = 24'h5fffff;
	assign sprites[88] = 24'h870000; 
	assign sprites[89] = 24'h87005f;
	assign sprites[90] = 24'h870087;
	assign sprites[91] = 24'h8700af;
	assign sprites[92] = 24'h8700d7;
	assign sprites[93] = 24'h8700ff;
	assign sprites[94] = 24'h875f00; 
	assign sprites[95] = 24'h875f5f;
	assign sprites[96] = 24'h875f87;
	assign sprites[97] = 24'h875faf;
	assign sprites[98] = 24'h875fd7;
	assign sprites[99] = 24'h875fff;
	assign sprites[100] = 24'h878700;
	assign sprites[101] = 24'h87875f;
	assign sprites[102] = 24'h878787;
	assign sprites[103] = 24'h8787af;
	assign sprites[104] = 24'h8787d7;
	assign sprites[105] = 24'h8787ff;
	assign sprites[106] = 24'h87af00;
	assign sprites[107] = 24'h87af5f;
	assign sprites[108] = 24'h87af87;
	assign sprites[109] = 24'h87afaf;
	assign sprites[110] = 24'h87afd7;
	assign sprites[111] = 24'h87afff;
	assign sprites[112] = 24'h87d700;
	assign sprites[113] = 24'h87d75f;
	assign sprites[114] = 24'h87d787;
	assign sprites[115] = 24'h87d7af;
	assign sprites[116] = 24'h87d7d7;
	assign sprites[117] = 24'h87d7ff;
	assign sprites[118] = 24'h87ff00;
	assign sprites[119] = 24'h87ff5f;
	assign sprites[120] = 24'h87ff87;
	assign sprites[121] = 24'h87ffaf;
	assign sprites[122] = 24'h87ffd7;
	assign sprites[123] = 24'h87ffff;
	assign sprites[124] = 24'haf0000;
	assign sprites[125] = 24'haf005f;
	assign sprites[126] = 24'haf0087;
	assign sprites[127] = 24'haf00af;
	assign sprites[128] = 24'haf00d7;
	assign sprites[129] = 24'haf00ff;
	assign sprites[130] = 24'haf5f00;
	assign sprites[131] = 24'haf5f5f;
	assign sprites[132] = 24'haf5f87;
	assign sprites[133] = 24'haf5faf;
	assign sprites[134] = 24'haf5fd7;
	assign sprites[135] = 24'haf5fff;
	assign sprites[136] = 24'haf8700;
	assign sprites[137] = 24'haf875f;
	assign sprites[138] = 24'haf8787;
	assign sprites[139] = 24'haf87af;
	assign sprites[140] = 24'haf87d7;
	assign sprites[141] = 24'haf87ff;
	assign sprites[142] = 24'hafaf00;
	assign sprites[143] = 24'hafaf5f;
	assign sprites[144] = 24'hafaf87;
	assign sprites[145] = 24'hafafaf;
	assign sprites[146] = 24'hafafd7;
	assign sprites[147] = 24'hafafff;
	assign sprites[148] = 24'hafd700;
	assign sprites[149] = 24'hafd75f;
	assign sprites[150] = 24'hafd787;
	assign sprites[151] = 24'hafd7af;
	assign sprites[152] = 24'hafd7d7;
	assign sprites[153] = 24'hafd7ff;
	assign sprites[154] = 24'hafff00;
	assign sprites[155] = 24'hafff5f;
	assign sprites[156] = 24'hafff87;
	assign sprites[157] = 24'hafffaf;
	assign sprites[158] = 24'hafffd7;
	assign sprites[159] = 24'hafffff;
	assign sprites[160] = 24'hd70000;
	assign sprites[161] = 24'hd7005f;
	assign sprites[162] = 24'hd70087;
	assign sprites[163] = 24'hd700af;
	assign sprites[164] = 24'hd700d7;
	assign sprites[165] = 24'hd700ff;
	assign sprites[166] = 24'hd75f00;
	assign sprites[167] = 24'hd75f5f;
	assign sprites[168] = 24'hd75f87;
	assign sprites[169] = 24'hd75faf;
	assign sprites[170] = 24'hd75fd7;
	assign sprites[171] = 24'hd75fff;
	assign sprites[172] = 24'hd78700;
	assign sprites[173] = 24'hd7875f;
	assign sprites[174] = 24'hd78787;
	assign sprites[175] = 24'hd787af;
	assign sprites[176] = 24'hd787d7;
	assign sprites[177] = 24'hd787ff;
	assign sprites[178] = 24'hd7af00;
	assign sprites[179] = 24'hd7af5f;
	assign sprites[180] = 24'hd7af87;
	assign sprites[181] = 24'hd7afaf;
	assign sprites[182] = 24'hd7afd7;
	assign sprites[183] = 24'hd7afff;
	assign sprites[184] = 24'hd7d700;
	assign sprites[185] = 24'hd7d75f;
	assign sprites[186] = 24'hd7d787;
	assign sprites[187] = 24'hd7d7af;
	assign sprites[188] = 24'hd7d7d7;
	assign sprites[189] = 24'hd7d7ff;
	assign sprites[190] = 24'hd7ff00;
	assign sprites[191] = 24'hd7ff5f;
	assign sprites[192] = 24'hd7ff87;
	assign sprites[193] = 24'hd7ffaf;
	assign sprites[194] = 24'hd7ffd7;
	assign sprites[195] = 24'hd7ffff;
	assign sprites[196] = 24'hff0000;
	assign sprites[197] = 24'hff005f;
	assign sprites[198] = 24'hff0087;
	assign sprites[199] = 24'hff00af;
	assign sprites[200] = 24'hff00d7;
	assign sprites[201] = 24'hff00ff;
	assign sprites[202] = 24'hff5f00;
	assign sprites[203] = 24'hff5f5f;
	assign sprites[204] = 24'hff5f87;
	assign sprites[205] = 24'hff5faf;
	assign sprites[206] = 24'hff5fd7;
	assign sprites[207] = 24'hff5fff;
	assign sprites[208] = 24'hff8700;
	assign sprites[209] = 24'hff875f;
	assign sprites[210] = 24'hff8787;
	assign sprites[211] = 24'hff87af;
	assign sprites[212] = 24'hff87d7;
	assign sprites[213] = 24'hff87ff;
	assign sprites[214] = 24'hffaf00;
	assign sprites[215] = 24'hffaf5f;
	assign sprites[216] = 24'hffaf87;
	assign sprites[217] = 24'hffafaf;
	assign sprites[218] = 24'hffafd7;
	assign sprites[219] = 24'hffafff;
	assign sprites[220] = 24'hffd700;
	assign sprites[221] = 24'hffd75f;
	assign sprites[222] = 24'hffd787;
	assign sprites[223] = 24'hffd7af;
	assign sprites[224] = 24'hffd7d7;
	assign sprites[225] = 24'hffd7ff;
	assign sprites[226] = 24'hffff00;
	assign sprites[227] = 24'hffff5f;
	assign sprites[228] = 24'hffff87;
	assign sprites[229] = 24'hffffaf;
	assign sprites[230] = 24'hffffd7;
	assign sprites[231] = 24'hffffff;
	assign sprites[232] = 24'h080808;
	assign sprites[233] = 24'h121212;
	assign sprites[234] = 24'h1c1c1c;
	assign sprites[235] = 24'h262626;
	assign sprites[236] = 24'h303030;
	assign sprites[237] = 24'h3a3a3a;
	assign sprites[238] = 24'h444444;
	assign sprites[239] = 24'h4e4e4e;
	assign sprites[240] = 24'h585858;
	assign sprites[241] = 24'h606060;
	assign sprites[242] = 24'h666666;
	assign sprites[243] = 24'h767676;
	assign sprites[244] = 24'h808080;
	assign sprites[245] = 24'h8a8a8a;
	assign sprites[246] = 24'h949494;
	assign sprites[247] = 24'h9e9e9e;
	assign sprites[248] = 24'ha8a8a8;
	assign sprites[249] = 24'hb2b2b2;
	assign sprites[250] = 24'hbcbcbc;
	assign sprites[251] = 24'hc6c6c6;
	assign sprites[252] = 24'hd0d0d0;
	assign sprites[253] = 24'hdadada;
	assign sprites[254] = 24'he4e4e4;
	assign sprites[255] = 24'heeeeee;
	
	
	always @(posedge clk)
	begin
	
		if (rst == 1'b1)
		begin
			
			R_out <= R_in;
			G_out <= G_in;
			B_out <= B_in;
			
		end
		else begin
			if (indice > 0)
			begin
				
				R_out <= sprites[indice][23:16];
				G_out <= sprites[indice][15:8];
				B_out <= sprites[indice][7:0];
				
			end
			else
			begin
				
				R_out <= R_in;
				G_out <= G_in;
				B_out <= B_in;
				
			end
		
		end
		
	
	end
	
	
	
	

endmodule