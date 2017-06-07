module VGA_Interface_block(
//Entradas
color,
CLK,
RST,
//Saídas		
R,G,B,
HS,VS,
BLANK,
h_pos,
v_pos,
VGA_SYNC,
VGA_CLK
); 

	input [7:0] color;
	input CLK, RST;
	
	output reg [7:0] R, G, B;
	output HS, VS;
	output reg BLANK;
	output  VGA_SYNC, VGA_CLK;

	parameter H_FRONT = 16;
	parameter H_SYNC = 96;
	parameter H_BACK = 48;
	parameter H_DISPLAY = 640;
	parameter H_BLANK = H_SYNC+H_BACK;
	parameter H_TOTAL = H_FRONT+H_SYNC+H_BACK+H_DISPLAY;

	parameter V_FRONT = 12;
	parameter V_SYNC = 2;
	parameter V_BACK = 31;
	parameter V_DISPLAY	= 480;
	parameter V_BLANK = V_SYNC+V_BACK;
	parameter V_TOTAL = V_FRONT+V_SYNC+V_BACK+V_DISPLAY;

	output reg [9:0] h_pos, v_pos;
	
	wire [23:0] colors[0:255];
	
	assign colors[0] = 24'h000000;  
	assign colors[1] = 24'h800000;
	assign colors[2] = 24'h008000;
	assign colors[3] = 24'h808000;  
	assign colors[4] = 24'h000080;
	assign colors[5] = 24'h800080;
	assign colors[6] = 24'h008080;
	assign colors[7] = 24'hc0c0c0;
	assign colors[8] = 24'h808080;
	assign colors[9] = 24'hff0000;
	assign colors[10] = 24'h00ff00;
	assign colors[11] = 24'hffff00;
	assign colors[12] = 24'h0000ff;
	assign colors[13] = 24'hff00ff;
	assign colors[14] = 24'h00ffff;
	assign colors[15] = 24'hffffff;
	assign colors[16] = 24'h000000;
	assign colors[17] = 24'h00005f;
	assign colors[18] = 24'h000087;
	assign colors[19] = 24'h0000af;
	assign colors[20] = 24'h0000d7;
	assign colors[21] = 24'h0000ff;
	assign colors[22] = 24'h005f00;
	assign colors[23] = 24'h005f5f;
	assign colors[24] = 24'h005f87;
	assign colors[25] = 24'h005faf;
	assign colors[26] = 24'h005fd7;
	assign colors[27] = 24'h005fff;
	assign colors[28] = 24'h008700;
	assign colors[29] = 24'h00875f; 
	assign colors[30] = 24'h008787;
	assign colors[31] = 24'h0087af;
	assign colors[32] = 24'h0087d7;
	assign colors[33] = 24'h0087ff;
	assign colors[34] = 24'h00af00; 
	assign colors[35] = 24'h00af5f;
	assign colors[36] = 24'h00af87;
	assign colors[37] = 24'h00afaf;
	assign colors[38] = 24'h00afd7;
	assign colors[39] = 24'h00afff;
	assign colors[40] = 24'h00d700; 
	assign colors[41] = 24'h00d75f;
	assign colors[42] = 24'h00d787;
	assign colors[43] = 24'h00d7af;
	assign colors[44] = 24'h00d7d7;
	assign colors[45] = 24'h00d7ff;
	assign colors[46] = 24'h00ff00; 
	assign colors[47] = 24'h00ff5f;
	assign colors[48] = 24'h00ff87;
	assign colors[49] = 24'h00ffaf;
	assign colors[50] = 24'h00ffd7;
	assign colors[51] = 24'h00ffff;
	assign colors[52] = 24'h5f0000; 
	assign colors[53] = 24'h5f005f;
	assign colors[54] = 24'h5f0087;
	assign colors[55] = 24'h5f00af;
	assign colors[56] = 24'h5f00d7;
	assign colors[57] = 24'h5f00ff;
	assign colors[58] = 24'h5f5f00; 
	assign colors[59] = 24'h5f5f5f;
	assign colors[60] = 24'h5f5f87;
	assign colors[61] = 24'h5f5faf;
	assign colors[62] = 24'h5f5fd7;
	assign colors[63] = 24'h5f5fff;
	assign colors[64] = 24'h5f8700; 
	assign colors[65] = 24'h5f875f;
	assign colors[66] = 24'h5f8787;
	assign colors[67] = 24'h5f87af;
	assign colors[68] = 24'h5f87d7;
	assign colors[69] = 24'h5f87ff;
	assign colors[70] = 24'h5faf00; 
	assign colors[71] = 24'h5faf5f;
	assign colors[72] = 24'h5faf87;
	assign colors[73] = 24'h5fafaf;
	assign colors[74] = 24'h5fafd7;
	assign colors[75] = 24'h5fafff;
	assign colors[76] = 24'h5fd700; 
	assign colors[77] = 24'h5fd75f;
	assign colors[78] = 24'h5fd787;
	assign colors[79] = 24'h5fd7af;
	assign colors[80] = 24'h5fd7d7;
	assign colors[81] = 24'h5fd7ff;
	assign colors[82] = 24'h5fff00; 
	assign colors[83] = 24'h5fff5f;
	assign colors[84] = 24'h5fff87;
	assign colors[85] = 24'h5fffaf;
	assign colors[86] = 24'h5fffd7;
	assign colors[87] = 24'h5fffff;
	assign colors[88] = 24'h870000; 
	assign colors[89] = 24'h87005f;
	assign colors[90] = 24'h870087;
	assign colors[91] = 24'h8700af;
	assign colors[92] = 24'h8700d7;
	assign colors[93] = 24'h8700ff;
	assign colors[94] = 24'h875f00; 
	assign colors[95] = 24'h875f5f;
	assign colors[96] = 24'h875f87;
	assign colors[97] = 24'h875faf;
	assign colors[98] = 24'h875fd7;
	assign colors[99] = 24'h875fff;
	assign colors[100] = 24'h878700;
	assign colors[101] = 24'h87875f;
	assign colors[102] = 24'h878787;
	assign colors[103] = 24'h8787af;
	assign colors[104] = 24'h8787d7;
	assign colors[105] = 24'h8787ff;
	assign colors[106] = 24'h87af00;
	assign colors[107] = 24'h87af5f;
	assign colors[108] = 24'h87af87;
	assign colors[109] = 24'h87afaf;
	assign colors[110] = 24'h87afd7;
	assign colors[111] = 24'h87afff;
	assign colors[112] = 24'h87d700;
	assign colors[113] = 24'h87d75f;
	assign colors[114] = 24'h87d787;
	assign colors[115] = 24'h87d7af;
	assign colors[116] = 24'h87d7d7;
	assign colors[117] = 24'h87d7ff;
	assign colors[118] = 24'h87ff00;
	assign colors[119] = 24'h87ff5f;
	assign colors[120] = 24'h87ff87;
	assign colors[121] = 24'h87ffaf;
	assign colors[122] = 24'h87ffd7;
	assign colors[123] = 24'h87ffff;
	assign colors[124] = 24'haf0000;
	assign colors[125] = 24'haf005f;
	assign colors[126] = 24'haf0087;
	assign colors[127] = 24'haf00af;
	assign colors[128] = 24'haf00d7;
	assign colors[129] = 24'haf00ff;
	assign colors[130] = 24'haf5f00;
	assign colors[131] = 24'haf5f5f;
	assign colors[132] = 24'haf5f87;
	assign colors[133] = 24'haf5faf;
	assign colors[134] = 24'haf5fd7;
	assign colors[135] = 24'haf5fff;
	assign colors[136] = 24'haf8700;
	assign colors[137] = 24'haf875f;
	assign colors[138] = 24'haf8787;
	assign colors[139] = 24'haf87af;
	assign colors[140] = 24'haf87d7;
	assign colors[141] = 24'haf87ff;
	assign colors[142] = 24'hafaf00;
	assign colors[143] = 24'hafaf5f;
	assign colors[144] = 24'hafaf87;
	assign colors[145] = 24'hafafaf;
	assign colors[146] = 24'hafafd7;
	assign colors[147] = 24'hafafff;
	assign colors[148] = 24'hafd700;
	assign colors[149] = 24'hafd75f;
	assign colors[150] = 24'hafd787;
	assign colors[151] = 24'hafd7af;
	assign colors[152] = 24'hafd7d7;
	assign colors[153] = 24'hafd7ff;
	assign colors[154] = 24'hafff00;
	assign colors[155] = 24'hafff5f;
	assign colors[156] = 24'hafff87;
	assign colors[157] = 24'hafffaf;
	assign colors[158] = 24'hafffd7;
	assign colors[159] = 24'hafffff;
	assign colors[160] = 24'hd70000;
	assign colors[161] = 24'hd7005f;
	assign colors[162] = 24'hd70087;
	assign colors[163] = 24'hd700af;
	assign colors[164] = 24'hd700d7;
	assign colors[165] = 24'hd700ff;
	assign colors[166] = 24'hd75f00;
	assign colors[167] = 24'hd75f5f;
	assign colors[168] = 24'hd75f87;
	assign colors[169] = 24'hd75faf;
	assign colors[170] = 24'hd75fd7;
	assign colors[171] = 24'hd75fff;
	assign colors[172] = 24'hd78700;
	assign colors[173] = 24'hd7875f;
	assign colors[174] = 24'hd78787;
	assign colors[175] = 24'hd787af;
	assign colors[176] = 24'hd787d7;
	assign colors[177] = 24'hd787ff;
	assign colors[178] = 24'hd7af00;
	assign colors[179] = 24'hd7af5f;
	assign colors[180] = 24'hd7af87;
	assign colors[181] = 24'hd7afaf;
	assign colors[182] = 24'hd7afd7;
	assign colors[183] = 24'hd7afff;
	assign colors[184] = 24'hd7d700;
	assign colors[185] = 24'hd7d75f;
	assign colors[186] = 24'hd7d787;
	assign colors[187] = 24'hd7d7af;
	assign colors[188] = 24'hd7d7d7;
	assign colors[189] = 24'hd7d7ff;
	assign colors[190] = 24'hd7ff00;
	assign colors[191] = 24'hd7ff5f;
	assign colors[192] = 24'hd7ff87;
	assign colors[193] = 24'hd7ffaf;
	assign colors[194] = 24'hd7ffd7;
	assign colors[195] = 24'hd7ffff;
	assign colors[196] = 24'hff0000;
	assign colors[197] = 24'hff005f;
	assign colors[198] = 24'hff0087;
	assign colors[199] = 24'hff00af;
	assign colors[200] = 24'hff00d7;
	assign colors[201] = 24'hff00ff;
	assign colors[202] = 24'hff5f00;
	assign colors[203] = 24'hff5f5f;
	assign colors[204] = 24'hff5f87;
	assign colors[205] = 24'hff5faf;
	assign colors[206] = 24'hff5fd7;
	assign colors[207] = 24'hff5fff;
	assign colors[208] = 24'hff8700;
	assign colors[209] = 24'hff875f;
	assign colors[210] = 24'hff8787;
	assign colors[211] = 24'hff87af;
	assign colors[212] = 24'hff87d7;
	assign colors[213] = 24'hff87ff;
	assign colors[214] = 24'hffaf00;
	assign colors[215] = 24'hffaf5f;
	assign colors[216] = 24'hffaf87;
	assign colors[217] = 24'hffafaf;
	assign colors[218] = 24'hffafd7;
	assign colors[219] = 24'hffafff;
	assign colors[220] = 24'hffd700;
	assign colors[221] = 24'hffd75f;
	assign colors[222] = 24'hffd787;
	assign colors[223] = 24'hffd7af;
	assign colors[224] = 24'hffd7d7;
	assign colors[225] = 24'hffd7ff;
	assign colors[226] = 24'hffff00;
	assign colors[227] = 24'hffff5f;
	assign colors[228] = 24'hffff87;
	assign colors[229] = 24'hffffaf;
	assign colors[230] = 24'hffffd7;
	assign colors[231] = 24'hffffff;
	assign colors[232] = 24'h080808;
	assign colors[233] = 24'h121212;
	assign colors[234] = 24'h1c1c1c;
	assign colors[235] = 24'h262626;
	assign colors[236] = 24'h303030;
	assign colors[237] = 24'h3a3a3a;
	assign colors[238] = 24'h444444;
	assign colors[239] = 24'h4e4e4e;
	assign colors[240] = 24'h585858;
	assign colors[241] = 24'h606060;
	assign colors[242] = 24'h666666;
	assign colors[243] = 24'h767676;
	assign colors[244] = 24'h808080;
	assign colors[245] = 24'h8a8a8a;
	assign colors[246] = 24'h949494;
	assign colors[247] = 24'h9e9e9e;
	assign colors[248] = 24'ha8a8a8;
	assign colors[249] = 24'hb2b2b2;
	assign colors[250] = 24'hbcbcbc;
	assign colors[251] = 24'hc6c6c6;
	assign colors[252] = 24'hd0d0d0;
	assign colors[253] = 24'hdadada;
	assign colors[254] = 24'he4e4e4;
	assign colors[255] = 24'heeeeee;
	
	
	always @(posedge CLK)
	begin
		if (RST == 1'b0)
		begin
			h_pos <= 1'b0;
			v_pos <= 1'b0;
		end
		else if (h_pos<H_TOTAL-1)//800 pulsos
		begin
			h_pos <= h_pos + 1'b1;
			//$display ("h_pos=%d v_pos=%d", h_pos, v_pos);
		end		
		else
		begin
			//$display ("h_pos=%d v_pos=%d", h_pos, v_pos);
			h_pos <= 1'b0;
			if (v_pos<V_TOTAL-1)//521 pulsos
				v_pos <= v_pos + 1'b1;	
			else
				v_pos <= 1'b0;
		end
	end
	
	always @(h_pos or v_pos)
	begin    
		if (h_pos<(H_BLANK) || h_pos>(H_TOTAL - H_FRONT - 1) || v_pos<(V_BLANK) || v_pos>(V_TOTAL - V_FRONT - 1))
		begin
			R=8'hff;
			G=8'hff;
			B=8'hff;
			BLANK = 1'b0;
			//$display ("h_pos =%d v_pos =%d | BLANK = 0 | V_SYNC = %b H_SYNC = %b", h_pos, v_pos, VS, HS);
		end
		else
		begin
			//TODO - Display interval
			BLANK = 1'b1;
			R=8'h00;
			G=8'hff;
			B=8'h00;
			//$display ("h_pos=%d v_pos=%d | BLANK = 1 | V_SYNC = %b H_SYNC = %b", h_pos, v_pos, VS, HS);

		end
	end
		
	assign HS = (h_pos < H_SYNC)?1'b0:1'b1;
	assign VS = (v_pos < V_SYNC)?1'b0:1'b1;
	
	assign VGA_CLK = CLK;
	assign VGA_SYNC = 1'b1;
	
	
endmodule