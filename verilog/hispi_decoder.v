/* Machine-generated using Migen */
module hispi_decoder(
	output reg data_valid,
	output reg frame_start,
	input [47:0] in_data,
	output reg [31:0] out_data,
	input sys_clk,
	input sys_rst
);

wire [11:0] inputs0;
wire [11:0] inputs1;
wire [11:0] inputs2;
wire [11:0] inputs3;
reg [7:0] outputs0;
reg [7:0] outputs1;
reg [7:0] outputs2;
reg [7:0] outputs3;
reg found_frame_start = 1'd0;
wire [11:0] hispi_phy_inputs0;
wire [11:0] hispi_phy_inputs1;
wire [11:0] hispi_phy_inputs2;
wire [11:0] hispi_phy_inputs3;
wire [11:0] hispi_phy_outputs0;
wire [11:0] hispi_phy_outputs1;
wire [11:0] hispi_phy_outputs2;
wire [11:0] hispi_phy_outputs3;
wire hispi_phy_aligned;
wire [11:0] hispi_phy_aligned_words0;
wire [11:0] hispi_phy_aligned_words1;
wire [11:0] hispi_phy_aligned_words2;
wire [11:0] hispi_phy_aligned_words3;
wire hispi_phy_word_alignment0;
wire hispi_phy_word_alignment1;
wire hispi_phy_word_alignment2;
wire hispi_phy_word_alignment3;
reg hispi_phy_reset = 1'd0;
reg [107:0] hispi_phy_data0 = 108'd324518553658426726783156020576255;
reg [107:0] hispi_phy_data1 = 108'd324518553658426726783156020576255;
reg [107:0] hispi_phy_data2 = 108'd324518553658426726783156020576255;
reg [107:0] hispi_phy_data3 = 108'd324518553658426726783156020576255;
wire [11:0] hispi_phy_hispilane0_word_in;
wire [11:0] hispi_phy_hispilane0_word_out;
reg hispi_phy_hispilane0_aligned;
wire hispi_phy_hispilane0_reset;
reg [3:0] hispi_phy_hispilane0_offset = 4'd0;
reg [59:0] hispi_phy_hispilane0_data;
wire [11:0] hispi_phy_hispilane1_word_in;
wire [11:0] hispi_phy_hispilane1_word_out;
reg hispi_phy_hispilane1_aligned;
wire hispi_phy_hispilane1_reset;
reg [3:0] hispi_phy_hispilane1_offset = 4'd0;
reg [59:0] hispi_phy_hispilane1_data;
wire [11:0] hispi_phy_hispilane2_word_in;
wire [11:0] hispi_phy_hispilane2_word_out;
reg hispi_phy_hispilane2_aligned;
wire hispi_phy_hispilane2_reset;
reg [3:0] hispi_phy_hispilane2_offset = 4'd0;
reg [59:0] hispi_phy_hispilane2_data;
wire [11:0] hispi_phy_hispilane3_word_in;
wire [11:0] hispi_phy_hispilane3_word_out;
reg hispi_phy_hispilane3_aligned;
wire hispi_phy_hispilane3_reset;
reg [3:0] hispi_phy_hispilane3_offset = 4'd0;
reg [59:0] hispi_phy_hispilane3_data;
reg [2:0] hispi_phy_lane_offsets0 = 3'd1;
reg [2:0] hispi_phy_lane_offsets1 = 3'd1;
reg [2:0] hispi_phy_lane_offsets2 = 3'd1;
reg hispi_phy_lane_aligned0 = 1'd0;
reg hispi_phy_lane_aligned1 = 1'd0;
reg hispi_phy_lane_aligned2 = 1'd0;
reg hispi_phy_lane_aligned3 = 1'd0;
reg [47:0] buffer_data0 = 48'd281474976710655;
reg [47:0] buffer_data1 = 48'd281474976710655;
reg [47:0] buffer_data2 = 48'd281474976710655;
reg [47:0] buffer_data3 = 48'd281474976710655;
reg [23:0] crc_data0 = 24'd16777215;
reg [23:0] crc_data1 = 24'd16777215;
reg [23:0] crc_data2 = 24'd16777215;
reg [23:0] crc_data3 = 24'd16777215;
reg [3:0] state = 4'd0;
reg [3:0] next_state;
reg found_frame_start_next_value;
reg found_frame_start_next_value_ce;
reg [11:0] next_value0;
reg next_value_ce0;
reg [11:0] next_value1;
reg next_value_ce1;
reg [11:0] next_value2;
reg next_value_ce2;
reg [11:0] next_value3;
reg next_value_ce3;
reg [11:0] next_value4;
reg next_value_ce4;
reg [11:0] next_value5;
reg next_value_ce5;
reg [11:0] next_value6;
reg next_value_ce6;
reg [11:0] next_value7;
reg next_value_ce7;
wire [107:0] complexslicelowerer_slice_proxy0;
wire [107:0] complexslicelowerer_slice_proxy1;
wire [107:0] complexslicelowerer_slice_proxy2;
wire [107:0] complexslicelowerer_slice_proxy3;
wire [59:0] complexslicelowerer_slice_proxy4;
wire [59:0] complexslicelowerer_slice_proxy5;
wire [59:0] complexslicelowerer_slice_proxy6;
wire [59:0] complexslicelowerer_slice_proxy7;
wire [47:0] cases_slice_proxy0;
wire [47:0] cases_slice_proxy1;
wire [107:0] complexslicelowerer_slice_proxy8;
wire [107:0] complexslicelowerer_slice_proxy9;
wire [107:0] complexslicelowerer_slice_proxy10;
wire [107:0] complexslicelowerer_slice_proxy11;
wire [107:0] complexslicelowerer_slice_proxy12;
wire [107:0] complexslicelowerer_slice_proxy13;
wire [107:0] complexslicelowerer_slice_proxy14;
wire [107:0] complexslicelowerer_slice_proxy15;
wire [107:0] complexslicelowerer_slice_proxy16;
wire [107:0] complexslicelowerer_slice_proxy17;
wire [107:0] complexslicelowerer_slice_proxy18;
wire [107:0] complexslicelowerer_slice_proxy19;
wire [107:0] complexslicelowerer_slice_proxy20;
wire [107:0] complexslicelowerer_slice_proxy21;
wire [107:0] complexslicelowerer_slice_proxy22;
wire [107:0] complexslicelowerer_slice_proxy23;
wire [107:0] complexslicelowerer_slice_proxy24;
wire [107:0] complexslicelowerer_slice_proxy25;
wire [107:0] complexslicelowerer_slice_proxy26;
wire [107:0] complexslicelowerer_slice_proxy27;
wire [107:0] complexslicelowerer_slice_proxy28;
wire [107:0] complexslicelowerer_slice_proxy29;
wire [107:0] complexslicelowerer_slice_proxy30;
wire [107:0] complexslicelowerer_slice_proxy31;
wire [107:0] complexslicelowerer_slice_proxy32;
wire [107:0] complexslicelowerer_slice_proxy33;
wire [107:0] complexslicelowerer_slice_proxy34;
wire [107:0] complexslicelowerer_slice_proxy35;
wire [107:0] complexslicelowerer_slice_proxy36;
wire [107:0] complexslicelowerer_slice_proxy37;
wire [107:0] complexslicelowerer_slice_proxy38;
wire [107:0] complexslicelowerer_slice_proxy39;
wire [107:0] complexslicelowerer_slice_proxy40;
wire [107:0] complexslicelowerer_slice_proxy41;
wire [107:0] complexslicelowerer_slice_proxy42;
wire [107:0] complexslicelowerer_slice_proxy43;
wire [59:0] complexslicelowerer_slice_proxy44;
wire [59:0] complexslicelowerer_slice_proxy45;
wire [59:0] complexslicelowerer_slice_proxy46;
wire [59:0] complexslicelowerer_slice_proxy47;
wire [59:0] complexslicelowerer_slice_proxy48;
wire [59:0] complexslicelowerer_slice_proxy49;
wire [59:0] complexslicelowerer_slice_proxy50;
wire [59:0] complexslicelowerer_slice_proxy51;
wire [59:0] complexslicelowerer_slice_proxy52;
wire [59:0] complexslicelowerer_slice_proxy53;
wire [59:0] complexslicelowerer_slice_proxy54;
wire [59:0] complexslicelowerer_slice_proxy55;
wire [59:0] complexslicelowerer_slice_proxy56;
wire [59:0] complexslicelowerer_slice_proxy57;
wire [59:0] complexslicelowerer_slice_proxy58;
wire [59:0] complexslicelowerer_slice_proxy59;
wire [59:0] complexslicelowerer_slice_proxy60;
wire [59:0] complexslicelowerer_slice_proxy61;
wire [59:0] complexslicelowerer_slice_proxy62;
wire [59:0] complexslicelowerer_slice_proxy63;
wire [59:0] complexslicelowerer_slice_proxy64;
wire [59:0] complexslicelowerer_slice_proxy65;
wire [59:0] complexslicelowerer_slice_proxy66;
wire [59:0] complexslicelowerer_slice_proxy67;
wire [59:0] complexslicelowerer_slice_proxy68;
wire [59:0] complexslicelowerer_slice_proxy69;
wire [59:0] complexslicelowerer_slice_proxy70;
wire [59:0] complexslicelowerer_slice_proxy71;
wire [59:0] complexslicelowerer_slice_proxy72;
wire [59:0] complexslicelowerer_slice_proxy73;
wire [59:0] complexslicelowerer_slice_proxy74;
wire [59:0] complexslicelowerer_slice_proxy75;
wire [59:0] complexslicelowerer_slice_proxy76;
wire [59:0] complexslicelowerer_slice_proxy77;
wire [59:0] complexslicelowerer_slice_proxy78;
wire [59:0] complexslicelowerer_slice_proxy79;
wire [59:0] complexslicelowerer_slice_proxy80;
wire [59:0] complexslicelowerer_slice_proxy81;
wire [59:0] complexslicelowerer_slice_proxy82;
wire [59:0] complexslicelowerer_slice_proxy83;
wire [59:0] complexslicelowerer_slice_proxy84;
wire [59:0] complexslicelowerer_slice_proxy85;
wire [59:0] complexslicelowerer_slice_proxy86;
wire [59:0] complexslicelowerer_slice_proxy87;
wire [59:0] complexslicelowerer_slice_proxy88;
wire [59:0] complexslicelowerer_slice_proxy89;
wire [59:0] complexslicelowerer_slice_proxy90;
wire [59:0] complexslicelowerer_slice_proxy91;


// Adding a dummy event (using a dummy signal 'dummy_s') to get the simulator
// to run the combinatorial process once at the beginning.
// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign inputs0 = in_data[11:0];
assign inputs1 = in_data[23:12];
assign inputs2 = in_data[35:24];
assign inputs3 = in_data[47:36];

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	out_data <= 32'd0;
	out_data[7:0] <= outputs0;
	out_data[15:8] <= outputs1;
	out_data[23:16] <= outputs2;
	out_data[31:24] <= outputs3;
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign hispi_phy_inputs0 = inputs0;
assign hispi_phy_inputs1 = inputs1;
assign hispi_phy_inputs2 = inputs2;
assign hispi_phy_inputs3 = inputs3;
assign hispi_phy_hispilane0_reset = hispi_phy_reset;
assign hispi_phy_hispilane0_word_in = hispi_phy_inputs0;
assign hispi_phy_aligned_words0 = hispi_phy_hispilane0_word_out;
assign hispi_phy_word_alignment0 = hispi_phy_hispilane0_aligned;
assign hispi_phy_hispilane1_reset = hispi_phy_reset;
assign hispi_phy_hispilane1_word_in = hispi_phy_inputs1;
assign hispi_phy_aligned_words1 = hispi_phy_hispilane1_word_out;
assign hispi_phy_word_alignment1 = hispi_phy_hispilane1_aligned;
assign hispi_phy_hispilane2_reset = hispi_phy_reset;
assign hispi_phy_hispilane2_word_in = hispi_phy_inputs2;
assign hispi_phy_aligned_words2 = hispi_phy_hispilane2_word_out;
assign hispi_phy_word_alignment2 = hispi_phy_hispilane2_aligned;
assign hispi_phy_hispilane3_reset = hispi_phy_reset;
assign hispi_phy_hispilane3_word_in = hispi_phy_inputs3;
assign hispi_phy_aligned_words3 = hispi_phy_hispilane3_word_out;
assign hispi_phy_word_alignment3 = hispi_phy_hispilane3_aligned;
assign hispi_phy_outputs0 = complexslicelowerer_slice_proxy0[35:0];
assign hispi_phy_outputs1 = complexslicelowerer_slice_proxy1[35:0];
assign hispi_phy_outputs2 = complexslicelowerer_slice_proxy2[35:0];
assign hispi_phy_outputs3 = complexslicelowerer_slice_proxy3[35:0];
assign hispi_phy_aligned = (((hispi_phy_lane_aligned0 & hispi_phy_lane_aligned1) & hispi_phy_lane_aligned2) & hispi_phy_lane_aligned3);

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	hispi_phy_hispilane0_aligned <= 1'd0;
	hispi_phy_hispilane0_data <= 60'd1152921504606846975;
	if ((hispi_phy_hispilane0_reset == 1'd1)) begin
		hispi_phy_hispilane0_aligned <= 1'd0;
		hispi_phy_hispilane0_data <= 1'd0;
	end else begin
		hispi_phy_hispilane0_aligned <= hispi_phy_hispilane0_aligned;
		hispi_phy_hispilane0_data <= hispi_phy_hispilane0_data;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign hispi_phy_hispilane0_word_out = complexslicelowerer_slice_proxy4[11:0];

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	hispi_phy_hispilane1_aligned <= 1'd0;
	hispi_phy_hispilane1_data <= 60'd1152921504606846975;
	if ((hispi_phy_hispilane1_reset == 1'd1)) begin
		hispi_phy_hispilane1_aligned <= 1'd0;
		hispi_phy_hispilane1_data <= 1'd0;
	end else begin
		hispi_phy_hispilane1_aligned <= hispi_phy_hispilane1_aligned;
		hispi_phy_hispilane1_data <= hispi_phy_hispilane1_data;
	end
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end
assign hispi_phy_hispilane1_word_out = complexslicelowerer_slice_proxy5[11:0];

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	hispi_phy_hispilane2_aligned <= 1'd0;
	hispi_phy_hispilane2_data <= 60'd1152921504606846975;
	if ((hispi_phy_hispilane2_reset == 1'd1)) begin
		hispi_phy_hispilane2_aligned <= 1'd0;
		hispi_phy_hispilane2_data <= 1'd0;
	end else begin
		hispi_phy_hispilane2_aligned <= hispi_phy_hispilane2_aligned;
		hispi_phy_hispilane2_data <= hispi_phy_hispilane2_data;
	end
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end
assign hispi_phy_hispilane2_word_out = complexslicelowerer_slice_proxy6[11:0];

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	hispi_phy_hispilane3_aligned <= 1'd0;
	hispi_phy_hispilane3_data <= 60'd1152921504606846975;
	if ((hispi_phy_hispilane3_reset == 1'd1)) begin
		hispi_phy_hispilane3_aligned <= 1'd0;
		hispi_phy_hispilane3_data <= 1'd0;
	end else begin
		hispi_phy_hispilane3_aligned <= hispi_phy_hispilane3_aligned;
		hispi_phy_hispilane3_data <= hispi_phy_hispilane3_data;
	end
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end
assign hispi_phy_hispilane3_word_out = complexslicelowerer_slice_proxy7[11:0];

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	outputs0 <= 8'd0;
	outputs1 <= 8'd0;
	outputs2 <= 8'd0;
	outputs3 <= 8'd0;
	data_valid <= 1'd0;
	frame_start <= 1'd0;
	next_state <= 4'd0;
	found_frame_start_next_value <= 1'd0;
	found_frame_start_next_value_ce <= 1'd0;
	next_value0 <= 12'd0;
	next_value_ce0 <= 1'd0;
	next_value1 <= 12'd0;
	next_value_ce1 <= 1'd0;
	next_value2 <= 12'd0;
	next_value_ce2 <= 1'd0;
	next_value3 <= 12'd0;
	next_value_ce3 <= 1'd0;
	next_value4 <= 12'd0;
	next_value_ce4 <= 1'd0;
	next_value5 <= 12'd0;
	next_value_ce5 <= 1'd0;
	next_value6 <= 12'd0;
	next_value_ce6 <= 1'd0;
	next_value7 <= 12'd0;
	next_value_ce7 <= 1'd0;
	next_state <= state;
	case (state)
		1'd1: begin
			if ((cases_slice_proxy0[35:0] == 12'd4095)) begin
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
			case (buffer_data0[11:0])
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
			next_value0 <= buffer_data0[11:0];
			next_value_ce0 <= 1'd1;
			next_value1 <= buffer_data1[11:0];
			next_value_ce1 <= 1'd1;
			next_value2 <= buffer_data2[11:0];
			next_value_ce2 <= 1'd1;
			next_value3 <= buffer_data3[11:0];
			next_value_ce3 <= 1'd1;
			next_state <= 3'd7;
		end
		3'd7: begin
			next_value4 <= buffer_data0[11:0];
			next_value_ce4 <= 1'd1;
			next_value5 <= buffer_data1[11:0];
			next_value_ce5 <= 1'd1;
			next_value6 <= buffer_data2[11:0];
			next_value_ce6 <= 1'd1;
			next_value7 <= buffer_data3[11:0];
			next_value_ce7 <= 1'd1;
			next_state <= 1'd1;
		end
		4'd8: begin
			data_valid <= 1'd1;
			if ((found_frame_start == 1'd1)) begin
				frame_start <= 1'd1;
				found_frame_start_next_value <= 1'd0;
				found_frame_start_next_value_ce <= 1'd1;
			end
			outputs0 <= (buffer_data0[11:0] >>> 3'd4);
			outputs1 <= (buffer_data1[11:0] >>> 3'd4);
			outputs2 <= (buffer_data2[11:0] >>> 3'd4);
			outputs3 <= (buffer_data3[11:0] >>> 3'd4);
			if ((cases_slice_proxy1[35:0] == 12'd4095)) begin
				next_state <= 2'd2;
			end
		end
		default: begin
			if ((hispi_phy_aligned == 1'd1)) begin
				next_state <= 1'd1;
			end
		end
	endcase
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end
assign complexslicelowerer_slice_proxy0 = (hispi_phy_data0 >>> 5'd24);
assign complexslicelowerer_slice_proxy1 = (hispi_phy_data1 >>> ((hispi_phy_lane_offsets0 - 1'd1) * 4'd12));
assign complexslicelowerer_slice_proxy2 = (hispi_phy_data2 >>> ((hispi_phy_lane_offsets1 - 1'd1) * 4'd12));
assign complexslicelowerer_slice_proxy3 = (hispi_phy_data3 >>> ((hispi_phy_lane_offsets2 - 1'd1) * 4'd12));
assign complexslicelowerer_slice_proxy4 = (hispi_phy_hispilane0_data >>> hispi_phy_hispilane0_offset);
assign complexslicelowerer_slice_proxy5 = (hispi_phy_hispilane1_data >>> hispi_phy_hispilane1_offset);
assign complexslicelowerer_slice_proxy6 = (hispi_phy_hispilane2_data >>> hispi_phy_hispilane2_offset);
assign complexslicelowerer_slice_proxy7 = (hispi_phy_hispilane3_data >>> hispi_phy_hispilane3_offset);
assign cases_slice_proxy0 = (buffer_data0 >>> 4'd12);
assign cases_slice_proxy1 = (buffer_data0 >>> 4'd12);
assign complexslicelowerer_slice_proxy8 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy9 = (hispi_phy_data1 >>> 4'd12);
assign complexslicelowerer_slice_proxy10 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy11 = (hispi_phy_data1 >>> 5'd24);
assign complexslicelowerer_slice_proxy12 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy13 = (hispi_phy_data1 >>> 6'd36);
assign complexslicelowerer_slice_proxy14 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy15 = (hispi_phy_data1 >>> 6'd48);
assign complexslicelowerer_slice_proxy16 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy17 = (hispi_phy_data1 >>> 6'd60);
assign complexslicelowerer_slice_proxy18 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy19 = (hispi_phy_data1 >>> 7'd72);
assign complexslicelowerer_slice_proxy20 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy21 = (hispi_phy_data2 >>> 4'd12);
assign complexslicelowerer_slice_proxy22 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy23 = (hispi_phy_data2 >>> 5'd24);
assign complexslicelowerer_slice_proxy24 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy25 = (hispi_phy_data2 >>> 6'd36);
assign complexslicelowerer_slice_proxy26 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy27 = (hispi_phy_data2 >>> 6'd48);
assign complexslicelowerer_slice_proxy28 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy29 = (hispi_phy_data2 >>> 6'd60);
assign complexslicelowerer_slice_proxy30 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy31 = (hispi_phy_data2 >>> 7'd72);
assign complexslicelowerer_slice_proxy32 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy33 = (hispi_phy_data3 >>> 4'd12);
assign complexslicelowerer_slice_proxy34 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy35 = (hispi_phy_data3 >>> 5'd24);
assign complexslicelowerer_slice_proxy36 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy37 = (hispi_phy_data3 >>> 6'd36);
assign complexslicelowerer_slice_proxy38 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy39 = (hispi_phy_data3 >>> 6'd48);
assign complexslicelowerer_slice_proxy40 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy41 = (hispi_phy_data3 >>> 6'd60);
assign complexslicelowerer_slice_proxy42 = (hispi_phy_data0 >>> 6'd36);
assign complexslicelowerer_slice_proxy43 = (hispi_phy_data3 >>> 7'd72);
assign complexslicelowerer_slice_proxy44 = (hispi_phy_hispilane0_data >>> 4'd12);
assign complexslicelowerer_slice_proxy45 = (hispi_phy_hispilane0_data >>> 4'd13);
assign complexslicelowerer_slice_proxy46 = (hispi_phy_hispilane0_data >>> 4'd14);
assign complexslicelowerer_slice_proxy47 = (hispi_phy_hispilane0_data >>> 4'd15);
assign complexslicelowerer_slice_proxy48 = (hispi_phy_hispilane0_data >>> 5'd16);
assign complexslicelowerer_slice_proxy49 = (hispi_phy_hispilane0_data >>> 5'd17);
assign complexslicelowerer_slice_proxy50 = (hispi_phy_hispilane0_data >>> 5'd18);
assign complexslicelowerer_slice_proxy51 = (hispi_phy_hispilane0_data >>> 5'd19);
assign complexslicelowerer_slice_proxy52 = (hispi_phy_hispilane0_data >>> 5'd20);
assign complexslicelowerer_slice_proxy53 = (hispi_phy_hispilane0_data >>> 5'd21);
assign complexslicelowerer_slice_proxy54 = (hispi_phy_hispilane0_data >>> 5'd22);
assign complexslicelowerer_slice_proxy55 = (hispi_phy_hispilane0_data >>> 5'd23);
assign complexslicelowerer_slice_proxy56 = (hispi_phy_hispilane1_data >>> 4'd12);
assign complexslicelowerer_slice_proxy57 = (hispi_phy_hispilane1_data >>> 4'd13);
assign complexslicelowerer_slice_proxy58 = (hispi_phy_hispilane1_data >>> 4'd14);
assign complexslicelowerer_slice_proxy59 = (hispi_phy_hispilane1_data >>> 4'd15);
assign complexslicelowerer_slice_proxy60 = (hispi_phy_hispilane1_data >>> 5'd16);
assign complexslicelowerer_slice_proxy61 = (hispi_phy_hispilane1_data >>> 5'd17);
assign complexslicelowerer_slice_proxy62 = (hispi_phy_hispilane1_data >>> 5'd18);
assign complexslicelowerer_slice_proxy63 = (hispi_phy_hispilane1_data >>> 5'd19);
assign complexslicelowerer_slice_proxy64 = (hispi_phy_hispilane1_data >>> 5'd20);
assign complexslicelowerer_slice_proxy65 = (hispi_phy_hispilane1_data >>> 5'd21);
assign complexslicelowerer_slice_proxy66 = (hispi_phy_hispilane1_data >>> 5'd22);
assign complexslicelowerer_slice_proxy67 = (hispi_phy_hispilane1_data >>> 5'd23);
assign complexslicelowerer_slice_proxy68 = (hispi_phy_hispilane2_data >>> 4'd12);
assign complexslicelowerer_slice_proxy69 = (hispi_phy_hispilane2_data >>> 4'd13);
assign complexslicelowerer_slice_proxy70 = (hispi_phy_hispilane2_data >>> 4'd14);
assign complexslicelowerer_slice_proxy71 = (hispi_phy_hispilane2_data >>> 4'd15);
assign complexslicelowerer_slice_proxy72 = (hispi_phy_hispilane2_data >>> 5'd16);
assign complexslicelowerer_slice_proxy73 = (hispi_phy_hispilane2_data >>> 5'd17);
assign complexslicelowerer_slice_proxy74 = (hispi_phy_hispilane2_data >>> 5'd18);
assign complexslicelowerer_slice_proxy75 = (hispi_phy_hispilane2_data >>> 5'd19);
assign complexslicelowerer_slice_proxy76 = (hispi_phy_hispilane2_data >>> 5'd20);
assign complexslicelowerer_slice_proxy77 = (hispi_phy_hispilane2_data >>> 5'd21);
assign complexslicelowerer_slice_proxy78 = (hispi_phy_hispilane2_data >>> 5'd22);
assign complexslicelowerer_slice_proxy79 = (hispi_phy_hispilane2_data >>> 5'd23);
assign complexslicelowerer_slice_proxy80 = (hispi_phy_hispilane3_data >>> 4'd12);
assign complexslicelowerer_slice_proxy81 = (hispi_phy_hispilane3_data >>> 4'd13);
assign complexslicelowerer_slice_proxy82 = (hispi_phy_hispilane3_data >>> 4'd14);
assign complexslicelowerer_slice_proxy83 = (hispi_phy_hispilane3_data >>> 4'd15);
assign complexslicelowerer_slice_proxy84 = (hispi_phy_hispilane3_data >>> 5'd16);
assign complexslicelowerer_slice_proxy85 = (hispi_phy_hispilane3_data >>> 5'd17);
assign complexslicelowerer_slice_proxy86 = (hispi_phy_hispilane3_data >>> 5'd18);
assign complexslicelowerer_slice_proxy87 = (hispi_phy_hispilane3_data >>> 5'd19);
assign complexslicelowerer_slice_proxy88 = (hispi_phy_hispilane3_data >>> 5'd20);
assign complexslicelowerer_slice_proxy89 = (hispi_phy_hispilane3_data >>> 5'd21);
assign complexslicelowerer_slice_proxy90 = (hispi_phy_hispilane3_data >>> 5'd22);
assign complexslicelowerer_slice_proxy91 = (hispi_phy_hispilane3_data >>> 5'd23);

always @(posedge sys_clk) begin
	if ((complexslicelowerer_slice_proxy8[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy9[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets0 <= 1'd1;
			hispi_phy_lane_aligned1 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy10[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy11[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets0 <= 2'd2;
			hispi_phy_lane_aligned1 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy12[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy13[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets0 <= 2'd3;
			hispi_phy_lane_aligned1 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy14[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy15[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets0 <= 3'd4;
			hispi_phy_lane_aligned1 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy16[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy17[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets0 <= 3'd5;
			hispi_phy_lane_aligned1 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy18[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy19[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets0 <= 3'd6;
			hispi_phy_lane_aligned1 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy20[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy21[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets1 <= 1'd1;
			hispi_phy_lane_aligned2 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy22[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy23[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets1 <= 2'd2;
			hispi_phy_lane_aligned2 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy24[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy25[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets1 <= 2'd3;
			hispi_phy_lane_aligned2 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy26[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy27[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets1 <= 3'd4;
			hispi_phy_lane_aligned2 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy28[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy29[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets1 <= 3'd5;
			hispi_phy_lane_aligned2 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy30[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy31[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets1 <= 3'd6;
			hispi_phy_lane_aligned2 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy32[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy33[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets2 <= 1'd1;
			hispi_phy_lane_aligned3 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy34[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy35[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets2 <= 2'd2;
			hispi_phy_lane_aligned3 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy36[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy37[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets2 <= 2'd3;
			hispi_phy_lane_aligned3 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy38[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy39[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets2 <= 3'd4;
			hispi_phy_lane_aligned3 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy40[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy41[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets2 <= 3'd5;
			hispi_phy_lane_aligned3 <= 1'd1;
		end
	end
	if ((complexslicelowerer_slice_proxy42[35:0] == 12'd4095)) begin
		hispi_phy_lane_aligned0 <= 1'd1;
		if ((complexslicelowerer_slice_proxy43[35:0] == 12'd4095)) begin
			hispi_phy_lane_offsets2 <= 3'd6;
			hispi_phy_lane_aligned3 <= 1'd1;
		end
	end
	hispi_phy_data0[11:0] <= hispi_phy_data0[23:12];
	hispi_phy_data0[23:12] <= hispi_phy_data0[35:24];
	hispi_phy_data0[35:24] <= hispi_phy_data0[47:36];
	hispi_phy_data0[47:36] <= hispi_phy_data0[59:48];
	hispi_phy_data0[59:48] <= hispi_phy_data0[71:60];
	hispi_phy_data0[71:60] <= hispi_phy_data0[83:72];
	hispi_phy_data0[83:72] <= hispi_phy_data0[95:84];
	hispi_phy_data0[95:84] <= hispi_phy_data0[107:96];
	hispi_phy_data0[107:96] <= hispi_phy_aligned_words0;
	hispi_phy_data1[11:0] <= hispi_phy_data1[23:12];
	hispi_phy_data1[23:12] <= hispi_phy_data1[35:24];
	hispi_phy_data1[35:24] <= hispi_phy_data1[47:36];
	hispi_phy_data1[47:36] <= hispi_phy_data1[59:48];
	hispi_phy_data1[59:48] <= hispi_phy_data1[71:60];
	hispi_phy_data1[71:60] <= hispi_phy_data1[83:72];
	hispi_phy_data1[83:72] <= hispi_phy_data1[95:84];
	hispi_phy_data1[95:84] <= hispi_phy_data1[107:96];
	hispi_phy_data1[107:96] <= hispi_phy_aligned_words1;
	hispi_phy_data2[11:0] <= hispi_phy_data2[23:12];
	hispi_phy_data2[23:12] <= hispi_phy_data2[35:24];
	hispi_phy_data2[35:24] <= hispi_phy_data2[47:36];
	hispi_phy_data2[47:36] <= hispi_phy_data2[59:48];
	hispi_phy_data2[59:48] <= hispi_phy_data2[71:60];
	hispi_phy_data2[71:60] <= hispi_phy_data2[83:72];
	hispi_phy_data2[83:72] <= hispi_phy_data2[95:84];
	hispi_phy_data2[95:84] <= hispi_phy_data2[107:96];
	hispi_phy_data2[107:96] <= hispi_phy_aligned_words2;
	hispi_phy_data3[11:0] <= hispi_phy_data3[23:12];
	hispi_phy_data3[23:12] <= hispi_phy_data3[35:24];
	hispi_phy_data3[35:24] <= hispi_phy_data3[47:36];
	hispi_phy_data3[47:36] <= hispi_phy_data3[59:48];
	hispi_phy_data3[59:48] <= hispi_phy_data3[71:60];
	hispi_phy_data3[71:60] <= hispi_phy_data3[83:72];
	hispi_phy_data3[83:72] <= hispi_phy_data3[95:84];
	hispi_phy_data3[95:84] <= hispi_phy_data3[107:96];
	hispi_phy_data3[107:96] <= hispi_phy_aligned_words3;
	if ((complexslicelowerer_slice_proxy44[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 1'd0;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy45[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 1'd1;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy46[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 2'd2;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy47[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 2'd3;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy48[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 3'd4;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy49[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 3'd5;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy50[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 3'd6;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy51[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 3'd7;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy52[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 4'd8;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy53[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 4'd9;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy54[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 4'd10;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy55[35:0] == 12'd4095)) begin
		hispi_phy_hispilane0_offset <= 4'd11;
		hispi_phy_hispilane0_aligned <= 1'd1;
	end
	hispi_phy_hispilane0_data[11:0] <= hispi_phy_hispilane0_data[23:12];
	hispi_phy_hispilane0_data[23:12] <= hispi_phy_hispilane0_data[35:24];
	hispi_phy_hispilane0_data[35:24] <= hispi_phy_hispilane0_data[47:36];
	hispi_phy_hispilane0_data[47:36] <= hispi_phy_hispilane0_data[59:48];
	hispi_phy_hispilane0_data[59:48] <= hispi_phy_hispilane0_word_in;
	if ((complexslicelowerer_slice_proxy56[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 1'd0;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy57[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 1'd1;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy58[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 2'd2;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy59[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 2'd3;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy60[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 3'd4;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy61[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 3'd5;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy62[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 3'd6;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy63[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 3'd7;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy64[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 4'd8;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy65[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 4'd9;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy66[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 4'd10;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy67[35:0] == 12'd4095)) begin
		hispi_phy_hispilane1_offset <= 4'd11;
		hispi_phy_hispilane1_aligned <= 1'd1;
	end
	hispi_phy_hispilane1_data[11:0] <= hispi_phy_hispilane1_data[23:12];
	hispi_phy_hispilane1_data[23:12] <= hispi_phy_hispilane1_data[35:24];
	hispi_phy_hispilane1_data[35:24] <= hispi_phy_hispilane1_data[47:36];
	hispi_phy_hispilane1_data[47:36] <= hispi_phy_hispilane1_data[59:48];
	hispi_phy_hispilane1_data[59:48] <= hispi_phy_hispilane1_word_in;
	if ((complexslicelowerer_slice_proxy68[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 1'd0;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy69[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 1'd1;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy70[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 2'd2;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy71[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 2'd3;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy72[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 3'd4;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy73[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 3'd5;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy74[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 3'd6;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy75[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 3'd7;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy76[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 4'd8;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy77[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 4'd9;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy78[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 4'd10;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy79[35:0] == 12'd4095)) begin
		hispi_phy_hispilane2_offset <= 4'd11;
		hispi_phy_hispilane2_aligned <= 1'd1;
	end
	hispi_phy_hispilane2_data[11:0] <= hispi_phy_hispilane2_data[23:12];
	hispi_phy_hispilane2_data[23:12] <= hispi_phy_hispilane2_data[35:24];
	hispi_phy_hispilane2_data[35:24] <= hispi_phy_hispilane2_data[47:36];
	hispi_phy_hispilane2_data[47:36] <= hispi_phy_hispilane2_data[59:48];
	hispi_phy_hispilane2_data[59:48] <= hispi_phy_hispilane2_word_in;
	if ((complexslicelowerer_slice_proxy80[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 1'd0;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy81[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 1'd1;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy82[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 2'd2;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy83[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 2'd3;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy84[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 3'd4;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy85[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 3'd5;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy86[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 3'd6;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy87[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 3'd7;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy88[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 4'd8;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy89[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 4'd9;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy90[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 4'd10;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	if ((complexslicelowerer_slice_proxy91[35:0] == 12'd4095)) begin
		hispi_phy_hispilane3_offset <= 4'd11;
		hispi_phy_hispilane3_aligned <= 1'd1;
	end
	hispi_phy_hispilane3_data[11:0] <= hispi_phy_hispilane3_data[23:12];
	hispi_phy_hispilane3_data[23:12] <= hispi_phy_hispilane3_data[35:24];
	hispi_phy_hispilane3_data[35:24] <= hispi_phy_hispilane3_data[47:36];
	hispi_phy_hispilane3_data[47:36] <= hispi_phy_hispilane3_data[59:48];
	hispi_phy_hispilane3_data[59:48] <= hispi_phy_hispilane3_word_in;
	buffer_data0[11:0] <= buffer_data0[23:12];
	buffer_data0[23:12] <= buffer_data0[35:24];
	buffer_data0[35:24] <= buffer_data0[47:36];
	buffer_data0[47:36] <= hispi_phy_outputs0;
	buffer_data1[11:0] <= buffer_data1[23:12];
	buffer_data1[23:12] <= buffer_data1[35:24];
	buffer_data1[35:24] <= buffer_data1[47:36];
	buffer_data1[47:36] <= hispi_phy_outputs1;
	buffer_data2[11:0] <= buffer_data2[23:12];
	buffer_data2[23:12] <= buffer_data2[35:24];
	buffer_data2[35:24] <= buffer_data2[47:36];
	buffer_data2[47:36] <= hispi_phy_outputs2;
	buffer_data3[11:0] <= buffer_data3[23:12];
	buffer_data3[23:12] <= buffer_data3[35:24];
	buffer_data3[35:24] <= buffer_data3[47:36];
	buffer_data3[47:36] <= hispi_phy_outputs3;
	state <= next_state;
	if (found_frame_start_next_value_ce) begin
		found_frame_start <= found_frame_start_next_value;
	end
	if (next_value_ce0) begin
		crc_data0[11:0] <= next_value0;
	end
	if (next_value_ce1) begin
		crc_data1[11:0] <= next_value1;
	end
	if (next_value_ce2) begin
		crc_data2[11:0] <= next_value2;
	end
	if (next_value_ce3) begin
		crc_data3[11:0] <= next_value3;
	end
	if (next_value_ce4) begin
		crc_data0[23:12] <= next_value4;
	end
	if (next_value_ce5) begin
		crc_data1[23:12] <= next_value5;
	end
	if (next_value_ce6) begin
		crc_data2[23:12] <= next_value6;
	end
	if (next_value_ce7) begin
		crc_data3[23:12] <= next_value7;
	end
	if (sys_rst) begin
		found_frame_start <= 1'd0;
		hispi_phy_data0 <= 108'd324518553658426726783156020576255;
		hispi_phy_data1 <= 108'd324518553658426726783156020576255;
		hispi_phy_data2 <= 108'd324518553658426726783156020576255;
		hispi_phy_data3 <= 108'd324518553658426726783156020576255;
		hispi_phy_hispilane0_aligned <= 1'd0;
		hispi_phy_hispilane0_offset <= 4'd0;
		hispi_phy_hispilane0_data <= 60'd1152921504606846975;
		hispi_phy_hispilane1_aligned <= 1'd0;
		hispi_phy_hispilane1_offset <= 4'd0;
		hispi_phy_hispilane1_data <= 60'd1152921504606846975;
		hispi_phy_hispilane2_aligned <= 1'd0;
		hispi_phy_hispilane2_offset <= 4'd0;
		hispi_phy_hispilane2_data <= 60'd1152921504606846975;
		hispi_phy_hispilane3_aligned <= 1'd0;
		hispi_phy_hispilane3_offset <= 4'd0;
		hispi_phy_hispilane3_data <= 60'd1152921504606846975;
		hispi_phy_lane_offsets0 <= 3'd1;
		hispi_phy_lane_offsets1 <= 3'd1;
		hispi_phy_lane_offsets2 <= 3'd1;
		hispi_phy_lane_aligned0 <= 1'd0;
		hispi_phy_lane_aligned1 <= 1'd0;
		hispi_phy_lane_aligned2 <= 1'd0;
		hispi_phy_lane_aligned3 <= 1'd0;
		buffer_data0 <= 48'd281474976710655;
		buffer_data1 <= 48'd281474976710655;
		buffer_data2 <= 48'd281474976710655;
		buffer_data3 <= 48'd281474976710655;
		crc_data0 <= 24'd16777215;
		crc_data1 <= 24'd16777215;
		crc_data2 <= 24'd16777215;
		crc_data3 <= 24'd16777215;
		state <= 4'd0;
	end
end

endmodule
