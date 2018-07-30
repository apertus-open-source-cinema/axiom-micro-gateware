/* Machine-generated using Migen */
module hispi_rx(
	input [23:0] data_in,
	output reg frame_start,
	output reg data_valid,
	output [47:0] data_out,
	output [47:0] converter_out,
	output [47:0] align_out,
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
reg [59:0] hispimodule1_data = 60'd1152921504606846975;
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
reg [11:0] hispimodule10;
reg [11:0] hispimodule11;
reg [11:0] hispimodule12;
reg [11:0] hispimodule13;
reg found_frame_start = 1'd0;
reg [23:0] data0 = 24'd16777215;
reg [23:0] data1 = 24'd16777215;
reg [23:0] data2 = 24'd16777215;
reg [23:0] data3 = 24'd16777215;
reg [3:0] state = 4'd0;
reg [3:0] next_state;
reg found_frame_start_next_value;
reg found_frame_start_next_value_ce;
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

assign align_out = {hispimodule3_data[(hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0)))+:12], hispimodule2_data[(hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0)))+:12], hispimodule1_data[(hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0)))+:12], hispimodule0_data[(hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0)))+:12]};
assign data_out = {hispimodule13, hispimodule12, hispimodule11, hispimodule10};
assign converter_out = {hispimodule3, hispimodule2, hispimodule1, hispimodule0};

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	frame_start <= 1'd0;
	data_valid <= 1'd0;
	hispimodule10 <= 12'd0;
	hispimodule11 <= 12'd0;
	hispimodule12 <= 12'd0;
	hispimodule13 <= 12'd0;
	next_state <= 4'd0;
	found_frame_start_next_value <= 1'd0;
	found_frame_start_next_value_ce <= 1'd0;
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
					found_frame_start_next_value <= 1'd1;
					found_frame_start_next_value_ce <= 1'd1;
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
					found_frame_start_next_value <= 1'd1;
					found_frame_start_next_value_ce <= 1'd1;
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
			next_value1 <= hispimodule1_data[(hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0)))+:12];
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
			next_value5 <= hispimodule1_data[(hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0)))+:12];
			next_value_ce5 <= 1'd1;
			next_value6 <= hispimodule2_data[(hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0)))+:12];
			next_value_ce6 <= 1'd1;
			next_value7 <= hispimodule3_data[(hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0)))+:12];
			next_value_ce7 <= 1'd1;
			next_state <= 1'd1;
		end
		4'd8: begin
			data_valid <= 1'd1;
			frame_start <= found_frame_start;
			found_frame_start_next_value <= 1'd0;
			found_frame_start_next_value_ce <= 1'd1;
			hispimodule10 <= (hispimodule0_data[(hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0)))+:12] >>> 1'd0);
			hispimodule11 <= (hispimodule1_data[(hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0)))+:12] >>> 1'd0);
			hispimodule12 <= (hispimodule2_data[(hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0)))+:12] >>> 1'd0);
			hispimodule13 <= (hispimodule3_data[(hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0)))+:12] >>> 1'd0);
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
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign hispimodule0 = xilinxmultiregimpl0_regs1;
assign hispimodule1 = xilinxmultiregimpl1_regs1;
assign hispimodule2 = xilinxmultiregimpl2_regs1;
assign hispimodule3 = xilinxmultiregimpl3_regs1;

always @(posedge hispi_clk) begin
	hispimodule0_data[47:0] <= hispimodule0_data[59:12];
	hispimodule0_data[59:48] <= hispimodule0;
	hispimodule1_data[47:0] <= hispimodule1_data[59:12];
	hispimodule1_data[59:48] <= hispimodule1;
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
	if ((hispimodule1_data[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 1'd0;
	end
	if ((hispimodule1_data[36:1] == 12'd4095)) begin
		hispimodule1_bit_offset <= 1'd1;
	end
	if ((hispimodule1_data[37:2] == 12'd4095)) begin
		hispimodule1_bit_offset <= 2'd2;
	end
	if ((hispimodule1_data[38:3] == 12'd4095)) begin
		hispimodule1_bit_offset <= 2'd3;
	end
	if ((hispimodule1_data[39:4] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd4;
	end
	if ((hispimodule1_data[40:5] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd5;
	end
	if ((hispimodule1_data[41:6] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd6;
	end
	if ((hispimodule1_data[42:7] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd7;
	end
	if ((hispimodule1_data[43:8] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd8;
	end
	if ((hispimodule1_data[44:9] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd9;
	end
	if ((hispimodule1_data[45:10] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd10;
	end
	if ((hispimodule1_data[46:11] == 12'd4095)) begin
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
		if ((hispimodule1_data[(hispimodule1_bit_offset + 1'd0)+:36] == 12'd4095)) begin
			hispimodule1_word_offset <= 1'd0;
			hispimodule1_aligned <= 1'd1;
		end
		if ((hispimodule1_data[(hispimodule1_bit_offset + 4'd12)+:36] == 12'd4095)) begin
			hispimodule1_word_offset <= 1'd1;
			hispimodule1_aligned <= 1'd1;
		end
		if ((hispimodule1_data[(hispimodule1_bit_offset + 5'd24)+:36] == 12'd4095)) begin
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
	state <= next_state;
	if (found_frame_start_next_value_ce) begin
		found_frame_start <= found_frame_start_next_value;
	end
	if (next_value_ce0) begin
		data0[1:0] <= next_value0;
	end
	if (next_value_ce1) begin
		data1[1:0] <= next_value1;
	end
	if (next_value_ce2) begin
		data2[1:0] <= next_value2;
	end
	if (next_value_ce3) begin
		data3[1:0] <= next_value3;
	end
	if (next_value_ce4) begin
		data0[3:2] <= next_value4;
	end
	if (next_value_ce5) begin
		data1[3:2] <= next_value5;
	end
	if (next_value_ce6) begin
		data2[3:2] <= next_value6;
	end
	if (next_value_ce7) begin
		data3[3:2] <= next_value7;
	end
	if (hispi_rst) begin
		hispimodule0_data <= 60'd1152921504606846975;
		hispimodule0_word_offset <= 6'd0;
		hispimodule0_bit_offset <= 6'd0;
		hispimodule0_aligned <= 1'd0;
		hispimodule1_data <= 60'd1152921504606846975;
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
		found_frame_start <= 1'd0;
		data0 <= 24'd16777215;
		data1 <= 24'd16777215;
		data2 <= 24'd16777215;
		data3 <= 24'd16777215;
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
