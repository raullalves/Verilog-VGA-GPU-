module fifo_buffer(
	clk,
	rst_n,
	wr_ena,
	rd_ena,
	wr_data,
	rd_data,
	full,
	empty
);

//Parameters
parameter WIDTH = 8;
parameter DEPTH = 16;
parameter ADDR_WIDTH = 4;

//Input
input clk, rst_n;
input [WIDTH - 1:0] wr_data;
input wr_ena, rd_ena;

//Output
output [WIDTH - 1:0] rd_data;
output full;
output empty;
//Debug outputs
//output [ADDR_WIDTH:0]rd_ptr;
//output [ADDR_WIDTH:0]wr_ptr;
//Regs
//reg full;
//reg empty;
reg [ADDR_WIDTH:0] wr_ptr, wr_ptr_buf;
reg [ADDR_WIDTH:0] rd_ptr, rd_ptr_buf;
reg [ADDR_WIDTH:0] n_wr_ptr;
reg [ADDR_WIDTH:0] n_rd_ptr;

//Wires
wire [WIDTH - 1:0] rd_data_ram;

reg wr_ena_buf, rd_ena_buf;

buffer buffer_inst0 (.clk(clk),
							   .w_data(wr_data),
							   .w_ena(wr_ena_buf),
							   .r_data(rd_data),
							   .w_addr(wr_ptr_buf),
							   .r_addr(rd_ptr_buf),
							   .r_ena(rd_ena_buf));

always @(posedge clk)
begin
  if(!rst_n)
  begin
//      full <= 1'b0;
//      empty <= 1'b1;
      wr_ptr <= 0;
      rd_ptr <= 0;
      rd_ena_buf <= 0;
      wr_ena_buf <= 0;
  end
  else 
  begin
    if( wr_ena && !full)
    begin
      wr_ena_buf <= 1;
      wr_ptr_buf <= wr_ptr;
      wr_ptr <= n_wr_ptr;
    end
    else
    begin
      wr_ena_buf = 1'b0;
    end
    
    if( rd_ena && !empty)
    begin
      rd_ena_buf <= 1;
      rd_ptr_buf <= rd_ptr;
      rd_ptr <= n_rd_ptr;
    end
    else
    begin
      rd_ena_buf = 1'b0;
    end
  end
end


always @(rd_ptr or wr_ptr) 
begin
	//Next read pointer
	if (rd_ptr[ADDR_WIDTH-1:0] == DEPTH - 1) 
	begin
		n_rd_ptr[ADDR_WIDTH] = ~n_rd_ptr[ADDR_WIDTH];
		n_rd_ptr[ADDR_WIDTH-1:0] = 0;
	end
	else 
	begin
		n_rd_ptr = rd_ptr + 1;
	end
	
	//Next write pointer
	if (wr_ptr[ADDR_WIDTH-1:0] == DEPTH - 1)
	begin
		n_wr_ptr[ADDR_WIDTH] = ~n_wr_ptr[ADDR_WIDTH];
		n_wr_ptr[ADDR_WIDTH-1:0] = 0;
	end
	else begin
		n_wr_ptr = wr_ptr + 1;
	end
end
	
	
	assign full = ((n_wr_ptr[ADDR_WIDTH - 1:0] == rd_ptr[ADDR_WIDTH - 1: 0]) && (n_wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]))?1'b1:1'b0;
	assign empty = (rd_ptr == wr_ptr)?1'b1:1'b0;
	
endmodule



