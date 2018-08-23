/* Machine-generated using Migen */
module hispi_rx(
	input [23:0] data_in,
	output [63:0] data_out,
	output data_valid,
	output frame_start,
	input hispi_clk,
	input hispi_rst,
	input sys_clk,
	input sys_rst
);

reg [11:0] hispimodule00 = 12'd0;
reg [11:0] hispimodule01 = 12'd0;
reg [11:0] hispimodule02 = 12'd0;
reg [11:0] hispimodule03 = 12'd0;
wire [11:0] hispimodule0;
wire [11:0] hispimodule1;
wire [11:0] hispimodule2;
wire [11:0] hispimodule3;
reg [59:0] hispimodule0_data = 60'd1152921504606846975;
reg [5:0] hispimodule0_word_offset = 6'd0;
reg [5:0] hispimodule0_bit_offset = 6'd0;
reg hispimodule0_aligned = 1'd0;
reg [59:0] hispimodule1_data0 = 60'd1152921504606846975;
reg [5:0] hispimodule1_word_offset = 6'd0;
reg [5:0] hispimodule1_bit_offset = 6'd0;
reg hispimodule1_aligned = 1'd0;
reg [59:0] hispimodule2_data = 60'd1152921504606846975;
reg [5:0] hispimodule2_word_offset = 6'd0;
reg [5:0] hispimodule2_bit_offset = 6'd0;
reg hispimodule2_aligned = 1'd0;
reg [59:0] hispimodule3_data = 60'd1152921504606846975;
reg [5:0] hispimodule3_word_offset = 6'd0;
reg [5:0] hispimodule3_bit_offset = 6'd0;
reg hispimodule3_aligned = 1'd0;
reg hispimodule1_frame_start;
reg hispimodule1_data_valid;
reg hispimodule1_data_actual_valid;
reg [7:0] hispimodule1_hispimodule10;
reg [7:0] hispimodule1_hispimodule11;
reg [7:0] hispimodule1_hispimodule12;
reg [7:0] hispimodule1_hispimodule13;
reg hispimodule1_found_frame_start = 1'd0;
reg [5:0] hispimodule1_padding_counter = 6'd0;
reg [23:0] hispimodule1_data1 = 24'd16777215;
reg [23:0] hispimodule1_data2 = 24'd16777215;
reg [23:0] hispimodule1_data3 = 24'd16777215;
reg [23:0] hispimodule1_data4 = 24'd16777215;
wire [31:0] data_out_1;
reg [67:0] hispimodule2_double_in = 68'd0;
reg [1:0] hispimodule2_counter = 2'd1;
reg [3:0] state = 4'd0;
reg [3:0] next_state;
reg hispimodule1_found_frame_start_next_value;
reg hispimodule1_found_frame_start_next_value_ce;
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

assign data_out_1 = {hispimodule1_hispimodule13, hispimodule1_hispimodule12, hispimodule1_hispimodule11, hispimodule1_hispimodule10};

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	hispimodule1_data_valid <= 1'd0;
	if (hispimodule1_data_actual_valid) begin
		hispimodule1_data_valid <= 1'd1;
	end else begin
		if ((hispimodule1_padding_counter != 1'd0)) begin
			hispimodule1_data_valid <= 1'd1;
		end else begin
			hispimodule1_data_valid <= 1'd0;
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
	hispimodule1_frame_start <= 1'd0;
	hispimodule1_data_actual_valid <= 1'd0;
	hispimodule1_hispimodule10 <= 8'd0;
	hispimodule1_hispimodule11 <= 8'd0;
	hispimodule1_hispimodule12 <= 8'd0;
	hispimodule1_hispimodule13 <= 8'd0;
	next_state <= 4'd0;
	hispimodule1_found_frame_start_next_value <= 1'd0;
	hispimodule1_found_frame_start_next_value_ce <= 1'd0;
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
			if ((hispimodule0_data[(hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd1)))+:36] == 12'd4095)) begin
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
			case (hispimodule0_data[(hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0)))+:12])
				1'd1: begin
					next_state <= 4'd8;
				end
				2'd3: begin
					hispimodule1_found_frame_start_next_value <= 1'd1;
					hispimodule1_found_frame_start_next_value_ce <= 1'd1;
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
					hispimodule1_found_frame_start_next_value <= 1'd1;
					hispimodule1_found_frame_start_next_value_ce <= 1'd1;
					next_state <= 1'd1;
				end
				default: begin
					next_state <= 1'd1;
				end
			endcase
		end
		3'd6: begin
			next_value0 <= hispimodule0_data[(hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0)))+:12];
			next_value_ce0 <= 1'd1;
			next_value1 <= hispimodule1_data0[(hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0)))+:12];
			next_value_ce1 <= 1'd1;
			next_value2 <= hispimodule2_data[(hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0)))+:12];
			next_value_ce2 <= 1'd1;
			next_value3 <= hispimodule3_data[(hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0)))+:12];
			next_value_ce3 <= 1'd1;
			next_state <= 3'd7;
		end
		3'd7: begin
			next_value4 <= hispimodule0_data[(hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0)))+:12];
			next_value_ce4 <= 1'd1;
			next_value5 <= hispimodule1_data0[(hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0)))+:12];
			next_value_ce5 <= 1'd1;
			next_value6 <= hispimodule2_data[(hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0)))+:12];
			next_value_ce6 <= 1'd1;
			next_value7 <= hispimodule3_data[(hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0)))+:12];
			next_value_ce7 <= 1'd1;
			next_state <= 1'd1;
		end
		4'd8: begin
			hispimodule1_data_actual_valid <= 1'd1;
			hispimodule1_frame_start <= hispimodule1_found_frame_start;
			hispimodule1_found_frame_start_next_value <= 1'd0;
			hispimodule1_found_frame_start_next_value_ce <= 1'd1;
			hispimodule1_hispimodule10 <= slice_proxy0[7:0];
			hispimodule1_hispimodule11 <= slice_proxy1[7:0];
			hispimodule1_hispimodule12 <= slice_proxy2[7:0];
			hispimodule1_hispimodule13 <= slice_proxy3[7:0];
			if ((hispimodule0_data[(hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd1)))+:36] == 12'd4095)) begin
				next_state <= 2'd2;
			end
		end
		default: begin
			if ((((hispimodule0_aligned & hispimodule1_aligned) & hispimodule2_aligned) & hispimodule3_aligned)) begin
				next_state <= 1'd1;
			end
		end
	endcase
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign data_out = {hispimodule2_double_in[65:34], hispimodule2_double_in[31:0]};
assign data_valid = ((hispimodule2_double_in[32] | hispimodule2_double_in[66]) & hispimodule2_counter[0]);
assign frame_start = (hispimodule2_double_in[33] | hispimodule2_double_in[67]);
assign slice_proxy0 = (hispimodule0_data[(hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0)))+:12] >>> 3'd4);
assign slice_proxy1 = (hispimodule1_data0[(hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0)))+:12] >>> 3'd4);
assign slice_proxy2 = (hispimodule2_data[(hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0)))+:12] >>> 3'd4);
assign slice_proxy3 = (hispimodule3_data[(hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0)))+:12] >>> 3'd4);
assign hispimodule0 = xilinxmultiregimpl0_regs1;
assign hispimodule1 = xilinxmultiregimpl1_regs1;
assign hispimodule2 = xilinxmultiregimpl2_regs1;
assign hispimodule3 = xilinxmultiregimpl3_regs1;

always @(posedge hispi_clk) begin
	hispimodule0_data[47:0] <= hispimodule0_data[59:12];
	hispimodule0_data[59:48] <= hispimodule0;
	hispimodule1_data0[47:0] <= hispimodule1_data0[59:12];
	hispimodule1_data0[59:48] <= hispimodule1;
	hispimodule2_data[47:0] <= hispimodule2_data[59:12];
	hispimodule2_data[59:48] <= hispimodule2;
	hispimodule3_data[47:0] <= hispimodule3_data[59:12];
	hispimodule3_data[59:48] <= hispimodule3;
	if ((hispimodule0_data[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 1'd0;
	end
	if ((hispimodule0_data[36:1] == 12'd4095)) begin
		hispimodule0_bit_offset <= 1'd1;
	end
	if ((hispimodule0_data[37:2] == 12'd4095)) begin
		hispimodule0_bit_offset <= 2'd2;
	end
	if ((hispimodule0_data[38:3] == 12'd4095)) begin
		hispimodule0_bit_offset <= 2'd3;
	end
	if ((hispimodule0_data[39:4] == 12'd4095)) begin
		hispimodule0_bit_offset <= 3'd4;
	end
	if ((hispimodule0_data[40:5] == 12'd4095)) begin
		hispimodule0_bit_offset <= 3'd5;
	end
	if ((hispimodule0_data[41:6] == 12'd4095)) begin
		hispimodule0_bit_offset <= 3'd6;
	end
	if ((hispimodule0_data[42:7] == 12'd4095)) begin
		hispimodule0_bit_offset <= 3'd7;
	end
	if ((hispimodule0_data[43:8] == 12'd4095)) begin
		hispimodule0_bit_offset <= 4'd8;
	end
	if ((hispimodule0_data[44:9] == 12'd4095)) begin
		hispimodule0_bit_offset <= 4'd9;
	end
	if ((hispimodule0_data[45:10] == 12'd4095)) begin
		hispimodule0_bit_offset <= 4'd10;
	end
	if ((hispimodule0_data[46:11] == 12'd4095)) begin
		hispimodule0_bit_offset <= 4'd11;
	end
	if ((hispimodule1_data0[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 1'd0;
	end
	if ((hispimodule1_data0[36:1] == 12'd4095)) begin
		hispimodule1_bit_offset <= 1'd1;
	end
	if ((hispimodule1_data0[37:2] == 12'd4095)) begin
		hispimodule1_bit_offset <= 2'd2;
	end
	if ((hispimodule1_data0[38:3] == 12'd4095)) begin
		hispimodule1_bit_offset <= 2'd3;
	end
	if ((hispimodule1_data0[39:4] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd4;
	end
	if ((hispimodule1_data0[40:5] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd5;
	end
	if ((hispimodule1_data0[41:6] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd6;
	end
	if ((hispimodule1_data0[42:7] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd7;
	end
	if ((hispimodule1_data0[43:8] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd8;
	end
	if ((hispimodule1_data0[44:9] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd9;
	end
	if ((hispimodule1_data0[45:10] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd10;
	end
	if ((hispimodule1_data0[46:11] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd11;
	end
	if ((hispimodule2_data[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 1'd0;
	end
	if ((hispimodule2_data[36:1] == 12'd4095)) begin
		hispimodule2_bit_offset <= 1'd1;
	end
	if ((hispimodule2_data[37:2] == 12'd4095)) begin
		hispimodule2_bit_offset <= 2'd2;
	end
	if ((hispimodule2_data[38:3] == 12'd4095)) begin
		hispimodule2_bit_offset <= 2'd3;
	end
	if ((hispimodule2_data[39:4] == 12'd4095)) begin
		hispimodule2_bit_offset <= 3'd4;
	end
	if ((hispimodule2_data[40:5] == 12'd4095)) begin
		hispimodule2_bit_offset <= 3'd5;
	end
	if ((hispimodule2_data[41:6] == 12'd4095)) begin
		hispimodule2_bit_offset <= 3'd6;
	end
	if ((hispimodule2_data[42:7] == 12'd4095)) begin
		hispimodule2_bit_offset <= 3'd7;
	end
	if ((hispimodule2_data[43:8] == 12'd4095)) begin
		hispimodule2_bit_offset <= 4'd8;
	end
	if ((hispimodule2_data[44:9] == 12'd4095)) begin
		hispimodule2_bit_offset <= 4'd9;
	end
	if ((hispimodule2_data[45:10] == 12'd4095)) begin
		hispimodule2_bit_offset <= 4'd10;
	end
	if ((hispimodule2_data[46:11] == 12'd4095)) begin
		hispimodule2_bit_offset <= 4'd11;
	end
	if ((hispimodule3_data[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 1'd0;
	end
	if ((hispimodule3_data[36:1] == 12'd4095)) begin
		hispimodule3_bit_offset <= 1'd1;
	end
	if ((hispimodule3_data[37:2] == 12'd4095)) begin
		hispimodule3_bit_offset <= 2'd2;
	end
	if ((hispimodule3_data[38:3] == 12'd4095)) begin
		hispimodule3_bit_offset <= 2'd3;
	end
	if ((hispimodule3_data[39:4] == 12'd4095)) begin
		hispimodule3_bit_offset <= 3'd4;
	end
	if ((hispimodule3_data[40:5] == 12'd4095)) begin
		hispimodule3_bit_offset <= 3'd5;
	end
	if ((hispimodule3_data[41:6] == 12'd4095)) begin
		hispimodule3_bit_offset <= 3'd6;
	end
	if ((hispimodule3_data[42:7] == 12'd4095)) begin
		hispimodule3_bit_offset <= 3'd7;
	end
	if ((hispimodule3_data[43:8] == 12'd4095)) begin
		hispimodule3_bit_offset <= 4'd8;
	end
	if ((hispimodule3_data[44:9] == 12'd4095)) begin
		hispimodule3_bit_offset <= 4'd9;
	end
	if ((hispimodule3_data[45:10] == 12'd4095)) begin
		hispimodule3_bit_offset <= 4'd10;
	end
	if ((hispimodule3_data[46:11] == 12'd4095)) begin
		hispimodule3_bit_offset <= 4'd11;
	end
	hispimodule0_word_offset <= 1'd1;
	hispimodule0_aligned <= 1'd1;
	if ((hispimodule0_data[(hispimodule0_bit_offset + 4'd12)+:36] == 12'd4095)) begin
		if ((hispimodule1_data0[(hispimodule1_bit_offset + 1'd0)+:36] == 12'd4095)) begin
			hispimodule1_word_offset <= 1'd0;
			hispimodule1_aligned <= 1'd1;
		end
		if ((hispimodule1_data0[(hispimodule1_bit_offset + 4'd12)+:36] == 12'd4095)) begin
			hispimodule1_word_offset <= 1'd1;
			hispimodule1_aligned <= 1'd1;
		end
		if ((hispimodule1_data0[(hispimodule1_bit_offset + 5'd24)+:36] == 12'd4095)) begin
			hispimodule1_word_offset <= 2'd2;
			hispimodule1_aligned <= 1'd1;
		end
	end
	if ((hispimodule0_data[(hispimodule0_bit_offset + 4'd12)+:36] == 12'd4095)) begin
		if ((hispimodule2_data[(hispimodule2_bit_offset + 1'd0)+:36] == 12'd4095)) begin
			hispimodule2_word_offset <= 1'd0;
			hispimodule2_aligned <= 1'd1;
		end
		if ((hispimodule2_data[(hispimodule2_bit_offset + 4'd12)+:36] == 12'd4095)) begin
			hispimodule2_word_offset <= 1'd1;
			hispimodule2_aligned <= 1'd1;
		end
		if ((hispimodule2_data[(hispimodule2_bit_offset + 5'd24)+:36] == 12'd4095)) begin
			hispimodule2_word_offset <= 2'd2;
			hispimodule2_aligned <= 1'd1;
		end
	end
	if ((hispimodule0_data[(hispimodule0_bit_offset + 4'd12)+:36] == 12'd4095)) begin
		if ((hispimodule3_data[(hispimodule3_bit_offset + 1'd0)+:36] == 12'd4095)) begin
			hispimodule3_word_offset <= 1'd0;
			hispimodule3_aligned <= 1'd1;
		end
		if ((hispimodule3_data[(hispimodule3_bit_offset + 4'd12)+:36] == 12'd4095)) begin
			hispimodule3_word_offset <= 1'd1;
			hispimodule3_aligned <= 1'd1;
		end
		if ((hispimodule3_data[(hispimodule3_bit_offset + 5'd24)+:36] == 12'd4095)) begin
			hispimodule3_word_offset <= 2'd2;
			hispimodule3_aligned <= 1'd1;
		end
	end
	if (hispimodule1_data_valid) begin
		if (((hispimodule1_padding_counter + 1'd1) < 6'd32)) begin
			hispimodule1_padding_counter <= (hispimodule1_padding_counter + 1'd1);
		end else begin
			hispimodule1_padding_counter <= 1'd0;
		end
	end
	state <= next_state;
	if (hispimodule1_found_frame_start_next_value_ce) begin
		hispimodule1_found_frame_start <= hispimodule1_found_frame_start_next_value;
	end
	if (next_value_ce0) begin
		hispimodule1_data1[1:0] <= next_value0;
	end
	if (next_value_ce1) begin
		hispimodule1_data2[1:0] <= next_value1;
	end
	if (next_value_ce2) begin
		hispimodule1_data3[1:0] <= next_value2;
	end
	if (next_value_ce3) begin
		hispimodule1_data4[1:0] <= next_value3;
	end
	if (next_value_ce4) begin
		hispimodule1_data1[3:2] <= next_value4;
	end
	if (next_value_ce5) begin
		hispimodule1_data2[3:2] <= next_value5;
	end
	if (next_value_ce6) begin
		hispimodule1_data3[3:2] <= next_value6;
	end
	if (next_value_ce7) begin
		hispimodule1_data4[3:2] <= next_value7;
	end
	if (hispimodule1_data_valid) begin
		if ((hispimodule2_counter == 2'd2)) begin
			hispimodule2_counter <= 1'd0;
		end else begin
			hispimodule2_counter[0] <= (~hispimodule2_counter[0]);
		end
	end else begin
		hispimodule2_counter <= 2'd2;
	end
	hispimodule2_double_in[65:34] <= data_out_1;
	hispimodule2_double_in[66] <= hispimodule1_data_valid;
	hispimodule2_double_in[67] <= hispimodule1_frame_start;
	hispimodule2_double_in[33:0] <= hispimodule2_double_in[67:34];
	if (hispi_rst) begin
		hispimodule0_data <= 60'd1152921504606846975;
		hispimodule0_word_offset <= 6'd0;
		hispimodule0_bit_offset <= 6'd0;
		hispimodule0_aligned <= 1'd0;
		hispimodule1_data0 <= 60'd1152921504606846975;
		hispimodule1_word_offset <= 6'd0;
		hispimodule1_bit_offset <= 6'd0;
		hispimodule1_aligned <= 1'd0;
		hispimodule2_data <= 60'd1152921504606846975;
		hispimodule2_word_offset <= 6'd0;
		hispimodule2_bit_offset <= 6'd0;
		hispimodule2_aligned <= 1'd0;
		hispimodule3_data <= 60'd1152921504606846975;
		hispimodule3_word_offset <= 6'd0;
		hispimodule3_bit_offset <= 6'd0;
		hispimodule3_aligned <= 1'd0;
		hispimodule1_found_frame_start <= 1'd0;
		hispimodule1_padding_counter <= 6'd0;
		hispimodule1_data1 <= 24'd16777215;
		hispimodule1_data2 <= 24'd16777215;
		hispimodule1_data3 <= 24'd16777215;
		hispimodule1_data4 <= 24'd16777215;
		hispimodule2_double_in <= 68'd0;
		hispimodule2_counter <= 2'd1;
		state <= 4'd0;
	end
	xilinxmultiregimpl0_regs0 <= hispimodule00;
	xilinxmultiregimpl0_regs1 <= xilinxmultiregimpl0_regs0;
	xilinxmultiregimpl1_regs0 <= hispimodule01;
	xilinxmultiregimpl1_regs1 <= xilinxmultiregimpl1_regs0;
	xilinxmultiregimpl2_regs0 <= hispimodule02;
	xilinxmultiregimpl2_regs1 <= xilinxmultiregimpl2_regs0;
	xilinxmultiregimpl3_regs0 <= hispimodule03;
	xilinxmultiregimpl3_regs1 <= xilinxmultiregimpl3_regs0;
end

always @(posedge sys_clk) begin
	hispimodule00[5:0] <= hispimodule00[11:6];
	hispimodule01[5:0] <= hispimodule01[11:6];
	hispimodule02[5:0] <= hispimodule02[11:6];
	hispimodule03[5:0] <= hispimodule03[11:6];
	hispimodule00[6] <= (~data_in[0]);
	hispimodule00[7] <= (~data_in[4]);
	hispimodule00[8] <= (~data_in[8]);
	hispimodule00[9] <= (~data_in[12]);
	hispimodule00[10] <= (~data_in[16]);
	hispimodule00[11] <= (~data_in[20]);
	hispimodule01[6] <= (~data_in[1]);
	hispimodule01[7] <= (~data_in[5]);
	hispimodule01[8] <= (~data_in[9]);
	hispimodule01[9] <= (~data_in[13]);
	hispimodule01[10] <= (~data_in[17]);
	hispimodule01[11] <= (~data_in[21]);
	hispimodule02[6] <= (~data_in[2]);
	hispimodule02[7] <= (~data_in[6]);
	hispimodule02[8] <= (~data_in[10]);
	hispimodule02[9] <= (~data_in[14]);
	hispimodule02[10] <= (~data_in[18]);
	hispimodule02[11] <= (~data_in[22]);
	hispimodule03[6] <= (~data_in[3]);
	hispimodule03[7] <= (~data_in[7]);
	hispimodule03[8] <= (~data_in[11]);
	hispimodule03[9] <= (~data_in[15]);
	hispimodule03[10] <= (~data_in[19]);
	hispimodule03[11] <= (~data_in[23]);
	if (sys_rst) begin
		hispimodule00 <= 12'd0;
		hispimodule01 <= 12'd0;
		hispimodule02 <= 12'd0;
		hispimodule03 <= 12'd0;
	end
end

endmodule
