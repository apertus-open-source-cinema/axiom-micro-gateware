/* Machine-generated using Migen */
module integration_test(
	input [23:0] data_in,
	input hispi_clk,
	input hispi_rst,
	input sys_clk,
	input sys_rst
);

wire [23:0] hispi_data_in;
reg [11:0] hispi_hispimodule00 = 12'd0;
reg [11:0] hispi_hispimodule01 = 12'd0;
reg [11:0] hispi_hispimodule02 = 12'd0;
reg [11:0] hispi_hispimodule03 = 12'd0;
wire [11:0] hispi_hispimodule0;
wire [11:0] hispi_hispimodule1;
wire [11:0] hispi_hispimodule2;
wire [11:0] hispi_hispimodule3;
reg [59:0] hispi_hispimodule0_data = 60'd1152921504606846975;
reg [5:0] hispi_hispimodule0_word_offset = 6'd0;
reg [5:0] hispi_hispimodule0_bit_offset = 6'd0;
reg hispi_hispimodule0_aligned = 1'd0;
reg [59:0] hispi_hispimodule1_data0 = 60'd1152921504606846975;
reg [5:0] hispi_hispimodule1_word_offset = 6'd0;
reg [5:0] hispi_hispimodule1_bit_offset = 6'd0;
reg hispi_hispimodule1_aligned = 1'd0;
reg [59:0] hispi_hispimodule2_data = 60'd1152921504606846975;
reg [5:0] hispi_hispimodule2_word_offset = 6'd0;
reg [5:0] hispi_hispimodule2_bit_offset = 6'd0;
reg hispi_hispimodule2_aligned = 1'd0;
reg [59:0] hispi_hispimodule3_data = 60'd1152921504606846975;
reg [5:0] hispi_hispimodule3_word_offset = 6'd0;
reg [5:0] hispi_hispimodule3_bit_offset = 6'd0;
reg hispi_hispimodule3_aligned = 1'd0;
reg hispi_hispimodule1_frame_start;
reg hispi_hispimodule1_data_valid;
reg hispi_hispimodule1_data_actual_valid;
reg [7:0] hispi_hispimodule1_hispimodule10;
reg [7:0] hispi_hispimodule1_hispimodule11;
reg [7:0] hispi_hispimodule1_hispimodule12;
reg [7:0] hispi_hispimodule1_hispimodule13;
reg hispi_hispimodule1_found_frame_start = 1'd0;
reg [5:0] hispi_hispimodule1_padding_counter = 6'd0;
reg [23:0] hispi_hispimodule1_data1 = 24'd16777215;
reg [23:0] hispi_hispimodule1_data2 = 24'd16777215;
reg [23:0] hispi_hispimodule1_data3 = 24'd16777215;
reg [23:0] hispi_hispimodule1_data4 = 24'd16777215;
wire [31:0] hispi_data_out;
reg [67:0] hispi_hispimodule2_double_in = 68'd0;
reg [1:0] hispi_hispimodule2_counter = 2'd1;
wire [63:0] hispi_hispimodule2_data_out;
wire hispi_hispimodule2_data_valid;
wire hispi_hispimodule2_frame_start;
reg [31:0] addr_gen_addr;
reg [31:0] addr;
wire addr_gen_switch;
wire addr_gen_data_valid;
reg addr_gen_addr_valid;
reg addr_valid;
wire [63:0] addr_gen_data_in;
reg [63:0] addr_gen_data_out;
reg addr_gen_data_out_valid;
reg [31:0] addr_gen_base_addrs_array0 = 32'd260046848;
reg [31:0] addr_gen_base_addrs_array1 = 32'd264241152;
reg [31:0] addr_gen_base_addrs_array2 = 32'd268435456;
reg [31:0] addr_gen_base_addrs_array3 = 32'd272629760;
reg [31:0] addr_gen_base_addr;
reg [31:0] addr_gen_offset = 32'd0;
reg [2:0] addr_gen_selection = 3'd0;
reg [6:0] addr_gen_addr_write_counter = 7'd0;
reg addr_gen_increment;
reg [4:0] addr_gen_counter = 5'd0;
reg [3:0] state = 4'd0;
reg [3:0] next_state;
reg hispi_hispimodule1_found_frame_start_next_value;
reg hispi_hispimodule1_found_frame_start_next_value_ce;
reg [1:0] next_value0;
reg next_value_ce0;
reg [1:0] next_value1;
reg next_value_ce1;
reg [1:0] next_value2;
reg next_value_ce2;
reg [1:0] next_value3;
reg next_value_ce3;
reg [1:0] next_value4;
reg next_value_ce4;
reg [1:0] next_value5;
reg next_value_ce5;
reg [1:0] next_value6;
reg next_value_ce6;
reg [1:0] next_value7;
reg next_value_ce7;
wire [11:0] slice_proxy0;
wire [11:0] slice_proxy1;
wire [11:0] slice_proxy2;
wire [11:0] slice_proxy3;
reg [31:0] array_muxed0;
reg [31:0] array_muxed1;
reg [31:0] array_muxed2;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [11:0] xilinxmultiregimpl0_regs0 = 12'd0;
(* async_reg = "true", dont_touch = "true" *) reg [11:0] xilinxmultiregimpl0_regs1 = 12'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [11:0] xilinxmultiregimpl1_regs0 = 12'd0;
(* async_reg = "true", dont_touch = "true" *) reg [11:0] xilinxmultiregimpl1_regs1 = 12'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [11:0] xilinxmultiregimpl2_regs0 = 12'd0;
(* async_reg = "true", dont_touch = "true" *) reg [11:0] xilinxmultiregimpl2_regs1 = 12'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [11:0] xilinxmultiregimpl3_regs0 = 12'd0;
(* async_reg = "true", dont_touch = "true" *) reg [11:0] xilinxmultiregimpl3_regs1 = 12'd0;


// Adding a dummy event (using a dummy signal 'dummy_s') to get the simulator
// to run the combinatorial process once at the beginning.
// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign hispi_data_in = data_in;
assign addr_gen_switch = hispi_hispimodule2_frame_start;
assign addr_gen_data_valid = hispi_hispimodule2_data_valid;
assign addr_gen_data_in = hispi_hispimodule2_data_out;
assign hispi_data_out = {hispi_hispimodule1_hispimodule13, hispi_hispimodule1_hispimodule12, hispi_hispimodule1_hispimodule11, hispi_hispimodule1_hispimodule10};

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	hispi_hispimodule1_data_valid <= 1'd0;
	if (hispi_hispimodule1_data_actual_valid) begin
		hispi_hispimodule1_data_valid <= 1'd1;
	end else begin
		if ((hispi_hispimodule1_padding_counter != 1'd0)) begin
			hispi_hispimodule1_data_valid <= 1'd1;
		end else begin
			hispi_hispimodule1_data_valid <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	hispi_hispimodule1_frame_start <= 1'd0;
	hispi_hispimodule1_data_actual_valid <= 1'd0;
	hispi_hispimodule1_hispimodule10 <= 8'd0;
	hispi_hispimodule1_hispimodule11 <= 8'd0;
	hispi_hispimodule1_hispimodule12 <= 8'd0;
	hispi_hispimodule1_hispimodule13 <= 8'd0;
	next_state <= 4'd0;
	hispi_hispimodule1_found_frame_start_next_value <= 1'd0;
	hispi_hispimodule1_found_frame_start_next_value_ce <= 1'd0;
	next_value0 <= 2'd0;
	next_value_ce0 <= 1'd0;
	next_value1 <= 2'd0;
	next_value_ce1 <= 1'd0;
	next_value2 <= 2'd0;
	next_value_ce2 <= 1'd0;
	next_value3 <= 2'd0;
	next_value_ce3 <= 1'd0;
	next_value4 <= 2'd0;
	next_value_ce4 <= 1'd0;
	next_value5 <= 2'd0;
	next_value_ce5 <= 1'd0;
	next_value6 <= 2'd0;
	next_value_ce6 <= 1'd0;
	next_value7 <= 2'd0;
	next_value_ce7 <= 1'd0;
	next_state <= state;
	case (state)
		1'd1: begin
			if ((hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + (4'd12 * (hispi_hispimodule0_word_offset + 1'd1)))+:36] == 12'd4095)) begin
				next_state <= 2'd2;
			end
		end
		2'd2: begin
			next_state <= 2'd3;
		end
		2'd3: begin
			next_state <= 3'd4;
		end
		3'd4: begin
			next_state <= 3'd5;
		end
		3'd5: begin
			case (hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + (4'd12 * (hispi_hispimodule0_word_offset + 1'd0)))+:12])
				1'd1: begin
					next_state <= 4'd8;
				end
				2'd3: begin
					hispi_hispimodule1_found_frame_start_next_value <= 1'd1;
					hispi_hispimodule1_found_frame_start_next_value_ce <= 1'd1;
					next_state <= 4'd8;
				end
				3'd5: begin
					next_state <= 3'd6;
				end
				3'd7: begin
					next_state <= 3'd6;
				end
				4'd9: begin
					next_state <= 1'd1;
				end
				5'd17: begin
					next_state <= 1'd1;
				end
				5'd19: begin
					hispi_hispimodule1_found_frame_start_next_value <= 1'd1;
					hispi_hispimodule1_found_frame_start_next_value_ce <= 1'd1;
					next_state <= 1'd1;
				end
				default: begin
					next_state <= 1'd1;
				end
			endcase
		end
		3'd6: begin
			next_value0 <= hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + (4'd12 * (hispi_hispimodule0_word_offset + 1'd0)))+:12];
			next_value_ce0 <= 1'd1;
			next_value1 <= hispi_hispimodule1_data0[(hispi_hispimodule1_bit_offset + (4'd12 * (hispi_hispimodule1_word_offset + 1'd0)))+:12];
			next_value_ce1 <= 1'd1;
			next_value2 <= hispi_hispimodule2_data[(hispi_hispimodule2_bit_offset + (4'd12 * (hispi_hispimodule2_word_offset + 1'd0)))+:12];
			next_value_ce2 <= 1'd1;
			next_value3 <= hispi_hispimodule3_data[(hispi_hispimodule3_bit_offset + (4'd12 * (hispi_hispimodule3_word_offset + 1'd0)))+:12];
			next_value_ce3 <= 1'd1;
			next_state <= 3'd7;
		end
		3'd7: begin
			next_value4 <= hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + (4'd12 * (hispi_hispimodule0_word_offset + 1'd0)))+:12];
			next_value_ce4 <= 1'd1;
			next_value5 <= hispi_hispimodule1_data0[(hispi_hispimodule1_bit_offset + (4'd12 * (hispi_hispimodule1_word_offset + 1'd0)))+:12];
			next_value_ce5 <= 1'd1;
			next_value6 <= hispi_hispimodule2_data[(hispi_hispimodule2_bit_offset + (4'd12 * (hispi_hispimodule2_word_offset + 1'd0)))+:12];
			next_value_ce6 <= 1'd1;
			next_value7 <= hispi_hispimodule3_data[(hispi_hispimodule3_bit_offset + (4'd12 * (hispi_hispimodule3_word_offset + 1'd0)))+:12];
			next_value_ce7 <= 1'd1;
			next_state <= 1'd1;
		end
		4'd8: begin
			hispi_hispimodule1_data_actual_valid <= 1'd1;
			hispi_hispimodule1_frame_start <= hispi_hispimodule1_found_frame_start;
			hispi_hispimodule1_found_frame_start_next_value <= 1'd0;
			hispi_hispimodule1_found_frame_start_next_value_ce <= 1'd1;
			hispi_hispimodule1_hispimodule10 <= slice_proxy0[7:0];
			hispi_hispimodule1_hispimodule11 <= slice_proxy1[7:0];
			hispi_hispimodule1_hispimodule12 <= slice_proxy2[7:0];
			hispi_hispimodule1_hispimodule13 <= slice_proxy3[7:0];
			if ((hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + (4'd12 * (hispi_hispimodule0_word_offset + 1'd1)))+:36] == 12'd4095)) begin
				next_state <= 2'd2;
			end
		end
		default: begin
			if ((((hispi_hispimodule0_aligned & hispi_hispimodule1_aligned) & hispi_hispimodule2_aligned) & hispi_hispimodule3_aligned)) begin
				next_state <= 1'd1;
			end
		end
	endcase
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign hispi_hispimodule2_data_out = {hispi_hispimodule2_double_in[65:34], hispi_hispimodule2_double_in[31:0]};
assign hispi_hispimodule2_data_valid = ((hispi_hispimodule2_double_in[32] | hispi_hispimodule2_double_in[66]) & hispi_hispimodule2_counter[0]);
assign hispi_hispimodule2_frame_start = (hispi_hispimodule2_double_in[33] | hispi_hispimodule2_double_in[67]);

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	addr_gen_increment <= 1'd0;
	if ((addr_gen_counter == 1'd0)) begin
		if (addr_gen_data_valid) begin
			addr_gen_increment <= 1'd1;
		end else begin
			addr_gen_increment <= 1'd0;
		end
	end else begin
		addr_gen_increment <= 1'd0;
	end
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	addr <= 32'd260046848;
	addr_gen_addr_valid <= 1'd0;
	addr_valid <= 1'd0;
	addr_gen_data_out <= 64'd0;
	addr_gen_data_out_valid <= 1'd0;
	if ((((addr_gen_addr_write_counter > 7'd100) & (addr_gen_addr_write_counter <= 7'd116)) & (~addr_gen_data_valid))) begin
		addr_gen_data_out <= array_muxed0;
		addr <= 29'd419430400;
		addr_gen_data_out_valid <= 1'd1;
		if ((addr_gen_addr_write_counter == 7'd101)) begin
			addr_valid <= 1'd1;
		end else begin
			addr_valid <= 1'd0;
		end
	end else begin
		if (addr_gen_data_valid) begin
			addr <= addr_gen_addr;
			addr_gen_data_out <= addr_gen_data_in;
			addr_gen_data_out_valid <= 1'd1;
			addr_valid <= addr_gen_addr_valid;
		end else begin
			addr_gen_data_out_valid <= 1'd0;
			addr_gen_addr_valid <= 1'd0;
		end
	end
	addr_gen_addr_valid <= addr_gen_increment;
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	addr_gen_base_addr <= 32'd260046848;
	if (addr_gen_switch) begin
		if ((addr_gen_selection == 2'd3)) begin
			addr_gen_base_addr <= 28'd260046848;
		end else begin
			addr_gen_base_addr <= array_muxed1;
		end
	end else begin
		addr_gen_base_addr <= array_muxed2;
	end
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	addr_gen_addr <= 32'd260046848;
	if (addr_gen_switch) begin
		addr_gen_addr <= addr_gen_base_addr;
	end else begin
		addr_gen_addr <= (addr_gen_base_addr + addr_gen_offset);
	end
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end
assign slice_proxy0 = (hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + (4'd12 * (hispi_hispimodule0_word_offset + 1'd0)))+:12] >>> 3'd4);
assign slice_proxy1 = (hispi_hispimodule1_data0[(hispi_hispimodule1_bit_offset + (4'd12 * (hispi_hispimodule1_word_offset + 1'd0)))+:12] >>> 3'd4);
assign slice_proxy2 = (hispi_hispimodule2_data[(hispi_hispimodule2_bit_offset + (4'd12 * (hispi_hispimodule2_word_offset + 1'd0)))+:12] >>> 3'd4);
assign slice_proxy3 = (hispi_hispimodule3_data[(hispi_hispimodule3_bit_offset + (4'd12 * (hispi_hispimodule3_word_offset + 1'd0)))+:12] >>> 3'd4);

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	array_muxed0 <= 32'd0;
	case ((((addr_gen_selection == 1'd0) ? 3'd4 : addr_gen_selection) - 1'd1))
		1'd0: begin
			array_muxed0 <= addr_gen_base_addrs_array0;
		end
		1'd1: begin
			array_muxed0 <= addr_gen_base_addrs_array1;
		end
		2'd2: begin
			array_muxed0 <= addr_gen_base_addrs_array2;
		end
		default: begin
			array_muxed0 <= addr_gen_base_addrs_array3;
		end
	endcase
// synthesis translate_off
	dummy_d_6 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_7;
// synthesis translate_on
always @(*) begin
	array_muxed1 <= 32'd0;
	case ((addr_gen_selection + 1'd1))
		1'd0: begin
			array_muxed1 <= addr_gen_base_addrs_array0;
		end
		1'd1: begin
			array_muxed1 <= addr_gen_base_addrs_array1;
		end
		2'd2: begin
			array_muxed1 <= addr_gen_base_addrs_array2;
		end
		default: begin
			array_muxed1 <= addr_gen_base_addrs_array3;
		end
	endcase
// synthesis translate_off
	dummy_d_7 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_8;
// synthesis translate_on
always @(*) begin
	array_muxed2 <= 32'd0;
	case (addr_gen_selection)
		1'd0: begin
			array_muxed2 <= addr_gen_base_addrs_array0;
		end
		1'd1: begin
			array_muxed2 <= addr_gen_base_addrs_array1;
		end
		2'd2: begin
			array_muxed2 <= addr_gen_base_addrs_array2;
		end
		default: begin
			array_muxed2 <= addr_gen_base_addrs_array3;
		end
	endcase
// synthesis translate_off
	dummy_d_8 <= dummy_s;
// synthesis translate_on
end
assign hispi_hispimodule0 = xilinxmultiregimpl0_regs1;
assign hispi_hispimodule1 = xilinxmultiregimpl1_regs1;
assign hispi_hispimodule2 = xilinxmultiregimpl2_regs1;
assign hispi_hispimodule3 = xilinxmultiregimpl3_regs1;

always @(posedge hispi_clk) begin
	hispi_hispimodule0_data[47:0] <= hispi_hispimodule0_data[59:12];
	hispi_hispimodule0_data[59:48] <= hispi_hispimodule0;
	hispi_hispimodule1_data0[47:0] <= hispi_hispimodule1_data0[59:12];
	hispi_hispimodule1_data0[59:48] <= hispi_hispimodule1;
	hispi_hispimodule2_data[47:0] <= hispi_hispimodule2_data[59:12];
	hispi_hispimodule2_data[59:48] <= hispi_hispimodule2;
	hispi_hispimodule3_data[47:0] <= hispi_hispimodule3_data[59:12];
	hispi_hispimodule3_data[59:48] <= hispi_hispimodule3;
	if ((hispi_hispimodule0_data[35:0] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 1'd0;
	end
	if ((hispi_hispimodule0_data[36:1] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 1'd1;
	end
	if ((hispi_hispimodule0_data[37:2] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 2'd2;
	end
	if ((hispi_hispimodule0_data[38:3] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 2'd3;
	end
	if ((hispi_hispimodule0_data[39:4] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 3'd4;
	end
	if ((hispi_hispimodule0_data[40:5] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 3'd5;
	end
	if ((hispi_hispimodule0_data[41:6] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 3'd6;
	end
	if ((hispi_hispimodule0_data[42:7] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 3'd7;
	end
	if ((hispi_hispimodule0_data[43:8] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 4'd8;
	end
	if ((hispi_hispimodule0_data[44:9] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 4'd9;
	end
	if ((hispi_hispimodule0_data[45:10] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 4'd10;
	end
	if ((hispi_hispimodule0_data[46:11] == 12'd4095)) begin
		hispi_hispimodule0_bit_offset <= 4'd11;
	end
	if ((hispi_hispimodule1_data0[35:0] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 1'd0;
	end
	if ((hispi_hispimodule1_data0[36:1] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 1'd1;
	end
	if ((hispi_hispimodule1_data0[37:2] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 2'd2;
	end
	if ((hispi_hispimodule1_data0[38:3] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 2'd3;
	end
	if ((hispi_hispimodule1_data0[39:4] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 3'd4;
	end
	if ((hispi_hispimodule1_data0[40:5] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 3'd5;
	end
	if ((hispi_hispimodule1_data0[41:6] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 3'd6;
	end
	if ((hispi_hispimodule1_data0[42:7] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 3'd7;
	end
	if ((hispi_hispimodule1_data0[43:8] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 4'd8;
	end
	if ((hispi_hispimodule1_data0[44:9] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 4'd9;
	end
	if ((hispi_hispimodule1_data0[45:10] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 4'd10;
	end
	if ((hispi_hispimodule1_data0[46:11] == 12'd4095)) begin
		hispi_hispimodule1_bit_offset <= 4'd11;
	end
	if ((hispi_hispimodule2_data[35:0] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 1'd0;
	end
	if ((hispi_hispimodule2_data[36:1] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 1'd1;
	end
	if ((hispi_hispimodule2_data[37:2] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 2'd2;
	end
	if ((hispi_hispimodule2_data[38:3] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 2'd3;
	end
	if ((hispi_hispimodule2_data[39:4] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 3'd4;
	end
	if ((hispi_hispimodule2_data[40:5] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 3'd5;
	end
	if ((hispi_hispimodule2_data[41:6] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 3'd6;
	end
	if ((hispi_hispimodule2_data[42:7] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 3'd7;
	end
	if ((hispi_hispimodule2_data[43:8] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 4'd8;
	end
	if ((hispi_hispimodule2_data[44:9] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 4'd9;
	end
	if ((hispi_hispimodule2_data[45:10] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 4'd10;
	end
	if ((hispi_hispimodule2_data[46:11] == 12'd4095)) begin
		hispi_hispimodule2_bit_offset <= 4'd11;
	end
	if ((hispi_hispimodule3_data[35:0] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 1'd0;
	end
	if ((hispi_hispimodule3_data[36:1] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 1'd1;
	end
	if ((hispi_hispimodule3_data[37:2] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 2'd2;
	end
	if ((hispi_hispimodule3_data[38:3] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 2'd3;
	end
	if ((hispi_hispimodule3_data[39:4] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 3'd4;
	end
	if ((hispi_hispimodule3_data[40:5] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 3'd5;
	end
	if ((hispi_hispimodule3_data[41:6] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 3'd6;
	end
	if ((hispi_hispimodule3_data[42:7] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 3'd7;
	end
	if ((hispi_hispimodule3_data[43:8] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 4'd8;
	end
	if ((hispi_hispimodule3_data[44:9] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 4'd9;
	end
	if ((hispi_hispimodule3_data[45:10] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 4'd10;
	end
	if ((hispi_hispimodule3_data[46:11] == 12'd4095)) begin
		hispi_hispimodule3_bit_offset <= 4'd11;
	end
	hispi_hispimodule0_word_offset <= 1'd1;
	hispi_hispimodule0_aligned <= 1'd1;
	if ((hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + 4'd12)+:36] == 12'd4095)) begin
		if ((hispi_hispimodule1_data0[(hispi_hispimodule1_bit_offset + 1'd0)+:36] == 12'd4095)) begin
			hispi_hispimodule1_word_offset <= 1'd0;
			hispi_hispimodule1_aligned <= 1'd1;
		end
		if ((hispi_hispimodule1_data0[(hispi_hispimodule1_bit_offset + 4'd12)+:36] == 12'd4095)) begin
			hispi_hispimodule1_word_offset <= 1'd1;
			hispi_hispimodule1_aligned <= 1'd1;
		end
		if ((hispi_hispimodule1_data0[(hispi_hispimodule1_bit_offset + 5'd24)+:36] == 12'd4095)) begin
			hispi_hispimodule1_word_offset <= 2'd2;
			hispi_hispimodule1_aligned <= 1'd1;
		end
	end
	if ((hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + 4'd12)+:36] == 12'd4095)) begin
		if ((hispi_hispimodule2_data[(hispi_hispimodule2_bit_offset + 1'd0)+:36] == 12'd4095)) begin
			hispi_hispimodule2_word_offset <= 1'd0;
			hispi_hispimodule2_aligned <= 1'd1;
		end
		if ((hispi_hispimodule2_data[(hispi_hispimodule2_bit_offset + 4'd12)+:36] == 12'd4095)) begin
			hispi_hispimodule2_word_offset <= 1'd1;
			hispi_hispimodule2_aligned <= 1'd1;
		end
		if ((hispi_hispimodule2_data[(hispi_hispimodule2_bit_offset + 5'd24)+:36] == 12'd4095)) begin
			hispi_hispimodule2_word_offset <= 2'd2;
			hispi_hispimodule2_aligned <= 1'd1;
		end
	end
	if ((hispi_hispimodule0_data[(hispi_hispimodule0_bit_offset + 4'd12)+:36] == 12'd4095)) begin
		if ((hispi_hispimodule3_data[(hispi_hispimodule3_bit_offset + 1'd0)+:36] == 12'd4095)) begin
			hispi_hispimodule3_word_offset <= 1'd0;
			hispi_hispimodule3_aligned <= 1'd1;
		end
		if ((hispi_hispimodule3_data[(hispi_hispimodule3_bit_offset + 4'd12)+:36] == 12'd4095)) begin
			hispi_hispimodule3_word_offset <= 1'd1;
			hispi_hispimodule3_aligned <= 1'd1;
		end
		if ((hispi_hispimodule3_data[(hispi_hispimodule3_bit_offset + 5'd24)+:36] == 12'd4095)) begin
			hispi_hispimodule3_word_offset <= 2'd2;
			hispi_hispimodule3_aligned <= 1'd1;
		end
	end
	if (hispi_hispimodule1_data_valid) begin
		if (((hispi_hispimodule1_padding_counter + 1'd1) < 6'd32)) begin
			hispi_hispimodule1_padding_counter <= (hispi_hispimodule1_padding_counter + 1'd1);
		end else begin
			hispi_hispimodule1_padding_counter <= 1'd0;
		end
	end
	state <= next_state;
	if (hispi_hispimodule1_found_frame_start_next_value_ce) begin
		hispi_hispimodule1_found_frame_start <= hispi_hispimodule1_found_frame_start_next_value;
	end
	if (next_value_ce0) begin
		hispi_hispimodule1_data1[1:0] <= next_value0;
	end
	if (next_value_ce1) begin
		hispi_hispimodule1_data2[1:0] <= next_value1;
	end
	if (next_value_ce2) begin
		hispi_hispimodule1_data3[1:0] <= next_value2;
	end
	if (next_value_ce3) begin
		hispi_hispimodule1_data4[1:0] <= next_value3;
	end
	if (next_value_ce4) begin
		hispi_hispimodule1_data1[3:2] <= next_value4;
	end
	if (next_value_ce5) begin
		hispi_hispimodule1_data2[3:2] <= next_value5;
	end
	if (next_value_ce6) begin
		hispi_hispimodule1_data3[3:2] <= next_value6;
	end
	if (next_value_ce7) begin
		hispi_hispimodule1_data4[3:2] <= next_value7;
	end
	if (hispi_hispimodule1_data_valid) begin
		if ((hispi_hispimodule2_counter == 2'd2)) begin
			hispi_hispimodule2_counter <= 1'd0;
		end else begin
			hispi_hispimodule2_counter[0] <= (~hispi_hispimodule2_counter[0]);
		end
	end else begin
		hispi_hispimodule2_counter <= 2'd2;
	end
	hispi_hispimodule2_double_in[65:34] <= hispi_data_out;
	hispi_hispimodule2_double_in[66] <= hispi_hispimodule1_data_valid;
	hispi_hispimodule2_double_in[67] <= hispi_hispimodule1_frame_start;
	hispi_hispimodule2_double_in[33:0] <= hispi_hispimodule2_double_in[67:34];
	if (hispi_rst) begin
		hispi_hispimodule0_data <= 60'd1152921504606846975;
		hispi_hispimodule0_word_offset <= 6'd0;
		hispi_hispimodule0_bit_offset <= 6'd0;
		hispi_hispimodule0_aligned <= 1'd0;
		hispi_hispimodule1_data0 <= 60'd1152921504606846975;
		hispi_hispimodule1_word_offset <= 6'd0;
		hispi_hispimodule1_bit_offset <= 6'd0;
		hispi_hispimodule1_aligned <= 1'd0;
		hispi_hispimodule2_data <= 60'd1152921504606846975;
		hispi_hispimodule2_word_offset <= 6'd0;
		hispi_hispimodule2_bit_offset <= 6'd0;
		hispi_hispimodule2_aligned <= 1'd0;
		hispi_hispimodule3_data <= 60'd1152921504606846975;
		hispi_hispimodule3_word_offset <= 6'd0;
		hispi_hispimodule3_bit_offset <= 6'd0;
		hispi_hispimodule3_aligned <= 1'd0;
		hispi_hispimodule1_found_frame_start <= 1'd0;
		hispi_hispimodule1_padding_counter <= 6'd0;
		hispi_hispimodule1_data1 <= 24'd16777215;
		hispi_hispimodule1_data2 <= 24'd16777215;
		hispi_hispimodule1_data3 <= 24'd16777215;
		hispi_hispimodule1_data4 <= 24'd16777215;
		hispi_hispimodule2_double_in <= 68'd0;
		hispi_hispimodule2_counter <= 2'd1;
		state <= 4'd0;
	end
	xilinxmultiregimpl0_regs0 <= hispi_hispimodule00;
	xilinxmultiregimpl0_regs1 <= xilinxmultiregimpl0_regs0;
	xilinxmultiregimpl1_regs0 <= hispi_hispimodule01;
	xilinxmultiregimpl1_regs1 <= xilinxmultiregimpl1_regs0;
	xilinxmultiregimpl2_regs0 <= hispi_hispimodule02;
	xilinxmultiregimpl2_regs1 <= xilinxmultiregimpl2_regs0;
	xilinxmultiregimpl3_regs0 <= hispi_hispimodule03;
	xilinxmultiregimpl3_regs1 <= xilinxmultiregimpl3_regs0;
end

always @(posedge sys_clk) begin
	hispi_hispimodule00[5:0] <= hispi_hispimodule00[11:6];
	hispi_hispimodule01[5:0] <= hispi_hispimodule01[11:6];
	hispi_hispimodule02[5:0] <= hispi_hispimodule02[11:6];
	hispi_hispimodule03[5:0] <= hispi_hispimodule03[11:6];
	hispi_hispimodule00[6] <= (~hispi_data_in[0]);
	hispi_hispimodule00[7] <= (~hispi_data_in[4]);
	hispi_hispimodule00[8] <= (~hispi_data_in[8]);
	hispi_hispimodule00[9] <= (~hispi_data_in[12]);
	hispi_hispimodule00[10] <= (~hispi_data_in[16]);
	hispi_hispimodule00[11] <= (~hispi_data_in[20]);
	hispi_hispimodule01[6] <= (~hispi_data_in[1]);
	hispi_hispimodule01[7] <= (~hispi_data_in[5]);
	hispi_hispimodule01[8] <= (~hispi_data_in[9]);
	hispi_hispimodule01[9] <= (~hispi_data_in[13]);
	hispi_hispimodule01[10] <= (~hispi_data_in[17]);
	hispi_hispimodule01[11] <= (~hispi_data_in[21]);
	hispi_hispimodule02[6] <= (~hispi_data_in[2]);
	hispi_hispimodule02[7] <= (~hispi_data_in[6]);
	hispi_hispimodule02[8] <= (~hispi_data_in[10]);
	hispi_hispimodule02[9] <= (~hispi_data_in[14]);
	hispi_hispimodule02[10] <= (~hispi_data_in[18]);
	hispi_hispimodule02[11] <= (~hispi_data_in[22]);
	hispi_hispimodule03[6] <= (~hispi_data_in[3]);
	hispi_hispimodule03[7] <= (~hispi_data_in[7]);
	hispi_hispimodule03[8] <= (~hispi_data_in[11]);
	hispi_hispimodule03[9] <= (~hispi_data_in[15]);
	hispi_hispimodule03[10] <= (~hispi_data_in[19]);
	hispi_hispimodule03[11] <= (~hispi_data_in[23]);
	if ((~addr_gen_data_valid)) begin
		if ((addr_gen_addr_write_counter < 7'd117)) begin
			addr_gen_addr_write_counter <= (addr_gen_addr_write_counter + 1'd1);
		end
	end else begin
		addr_gen_addr_write_counter <= 1'd0;
	end
	if (addr_gen_switch) begin
		if (addr_gen_data_valid) begin
			addr_gen_counter <= 2'd2;
		end else begin
			addr_gen_counter <= 1'd1;
		end
	end else begin
		if (addr_gen_data_valid) begin
			if ((addr_gen_counter == 4'd15)) begin
				addr_gen_counter <= 1'd0;
			end else begin
				addr_gen_counter <= (addr_gen_counter + 1'd1);
			end
		end
	end
	if (addr_gen_switch) begin
		if (addr_gen_increment) begin
			addr_gen_offset <= 8'd128;
		end else begin
			addr_gen_offset <= 1'd0;
		end
		if ((addr_gen_selection == 2'd3)) begin
			addr_gen_selection <= 1'd0;
		end else begin
			addr_gen_selection <= (addr_gen_selection + 1'd1);
		end
	end else begin
		if (addr_gen_increment) begin
			if (((addr_gen_offset + 8'd128) >= 29'd436207616)) begin
				addr_gen_offset <= 1'd0;
			end else begin
				addr_gen_offset <= (addr_gen_offset + 8'd128);
			end
		end
	end
	if (sys_rst) begin
		hispi_hispimodule00 <= 12'd0;
		hispi_hispimodule01 <= 12'd0;
		hispi_hispimodule02 <= 12'd0;
		hispi_hispimodule03 <= 12'd0;
		addr_gen_offset <= 32'd0;
		addr_gen_selection <= 3'd0;
		addr_gen_addr_write_counter <= 7'd0;
		addr_gen_counter <= 5'd0;
	end
end

endmodule
