/* Machine-generated using Migen */
module addr_gen(
	output reg [31:0] addr,
	input switch,
	input data_valid,
	output reg addr_valid,
	input [63:0] data_in,
	output reg [63:0] data_out,
	output reg data_out_valid,
	input sys_clk,
	input sys_rst
);

reg [31:0] addr_1;
reg addr_valid_1;
reg [31:0] base_addrs_array0 = 32'd260046848;
reg [31:0] base_addrs_array1 = 32'd264241152;
reg [31:0] base_addrs_array2 = 32'd268435456;
reg [31:0] base_addrs_array3 = 32'd272629760;
reg [31:0] base_addr;
reg [31:0] offset = 32'd0;
reg [2:0] selection = 3'd0;
reg [6:0] addr_write_counter = 7'd0;
reg increment;
reg [4:0] counter = 5'd0;
reg [31:0] array_muxed0;
reg [31:0] array_muxed1;
reg [31:0] array_muxed2;


// Adding a dummy event (using a dummy signal 'dummy_s') to get the simulator
// to run the combinatorial process once at the beginning.
// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on


// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	increment <= 1'd0;
	if ((counter == 1'd0)) begin
		if (data_valid) begin
			increment <= 1'd1;
		end else begin
			increment <= 1'd0;
		end
	end else begin
		increment <= 1'd0;
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	addr <= 32'd260046848;
	addr_valid_1 <= 1'd0;
	addr_valid <= 1'd0;
	data_out <= 64'd0;
	data_out_valid <= 1'd0;
	if ((((addr_write_counter > 7'd100) & (addr_write_counter <= 7'd116)) & (~data_valid))) begin
		data_out <= array_muxed0;
		addr <= 29'd419430400;
		data_out_valid <= 1'd1;
		if ((addr_write_counter == 7'd101)) begin
			addr_valid <= 1'd1;
		end else begin
			addr_valid <= 1'd0;
		end
	end else begin
		if (data_valid) begin
			addr <= addr_1;
			data_out <= data_in;
			data_out_valid <= 1'd1;
			addr_valid <= addr_valid_1;
		end else begin
			data_out_valid <= 1'd0;
			addr_valid_1 <= 1'd0;
		end
	end
	addr_valid_1 <= increment;
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	base_addr <= 32'd260046848;
	if (switch) begin
		if ((selection == 2'd3)) begin
			base_addr <= 28'd260046848;
		end else begin
			base_addr <= array_muxed1;
		end
	end else begin
		base_addr <= array_muxed2;
	end
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	addr_1 <= 32'd260046848;
	if (switch) begin
		addr_1 <= base_addr;
	end else begin
		addr_1 <= (base_addr + offset);
	end
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	array_muxed0 <= 32'd0;
	case ((((selection == 1'd0) ? 3'd4 : selection) - 1'd1))
		1'd0: begin
			array_muxed0 <= base_addrs_array0;
		end
		1'd1: begin
			array_muxed0 <= base_addrs_array1;
		end
		2'd2: begin
			array_muxed0 <= base_addrs_array2;
		end
		default: begin
			array_muxed0 <= base_addrs_array3;
		end
	endcase
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	array_muxed1 <= 32'd0;
	case ((selection + 1'd1))
		1'd0: begin
			array_muxed1 <= base_addrs_array0;
		end
		1'd1: begin
			array_muxed1 <= base_addrs_array1;
		end
		2'd2: begin
			array_muxed1 <= base_addrs_array2;
		end
		default: begin
			array_muxed1 <= base_addrs_array3;
		end
	endcase
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	array_muxed2 <= 32'd0;
	case (selection)
		1'd0: begin
			array_muxed2 <= base_addrs_array0;
		end
		1'd1: begin
			array_muxed2 <= base_addrs_array1;
		end
		2'd2: begin
			array_muxed2 <= base_addrs_array2;
		end
		default: begin
			array_muxed2 <= base_addrs_array3;
		end
	endcase
// synthesis translate_off
	dummy_d_6 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	if ((~data_valid)) begin
		if ((addr_write_counter < 7'd117)) begin
			addr_write_counter <= (addr_write_counter + 1'd1);
		end
	end else begin
		addr_write_counter <= 1'd0;
	end
	if (switch) begin
		if (data_valid) begin
			counter <= 2'd2;
		end else begin
			counter <= 1'd1;
		end
	end else begin
		if (data_valid) begin
			if ((counter == 4'd15)) begin
				counter <= 1'd0;
			end else begin
				counter <= (counter + 1'd1);
			end
		end
	end
	if (switch) begin
		if (increment) begin
			offset <= 8'd128;
		end else begin
			offset <= 1'd0;
		end
		if ((selection == 2'd3)) begin
			selection <= 1'd0;
		end else begin
			selection <= (selection + 1'd1);
		end
	end else begin
		if (increment) begin
			if (((offset + 8'd128) >= 29'd436207616)) begin
				offset <= 1'd0;
			end else begin
				offset <= (offset + 8'd128);
			end
		end
	end
	if (sys_rst) begin
		offset <= 32'd0;
		selection <= 3'd0;
		addr_write_counter <= 7'd0;
		counter <= 5'd0;
	end
end

endmodule
