module buffer(clk, 
		   w_data,
		   r_ena, 
		   w_ena, 
		   r_data, 
		   w_addr, 
		   r_addr);

//Parameters
parameter WIDTH = 8;
parameter DEPTH = 16;
parameter ADDR_WIDTH = 4;

//Inputs and Outputs
input clk;
input r_ena, w_ena;
input [WIDTH - 1:0] w_data;
input [ADDR_WIDTH - 1:0] w_addr, r_addr;
output [WIDTH - 1:0] r_data;

//Register Memory
reg [WIDTH - 1:0]mem[0:DEPTH - 1];
reg [WIDTH - 1:0]r_data;

//Main
always @(posedge clk) begin
	if (w_ena) begin
		mem[w_addr] <= w_data;
	end
	if (r_ena) begin
		r_data <= mem[r_addr];
	end
end
endmodule