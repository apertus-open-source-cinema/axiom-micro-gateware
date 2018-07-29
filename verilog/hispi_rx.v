/* Machine-generated using Migen */
module hispi_rx(
	input [23:0] data_in,
	output reg frame_start,
	output reg data_valid,
	output [47:0] data_out,
	output [47:0] converter_out,
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
reg [119:0] hispimodule0_data = 120'd1329227995784915872903807060280344575;
reg [3:0] hispimodule0_word_offset = 4'd0;
reg [3:0] hispimodule0_bit_offset = 4'd0;
reg hispimodule0_aligned = 1'd0;
reg [119:0] hispimodule1_data = 120'd1329227995784915872903807060280344575;
reg [3:0] hispimodule1_word_offset = 4'd0;
reg [3:0] hispimodule1_bit_offset = 4'd0;
reg hispimodule1_aligned = 1'd0;
reg [119:0] hispimodule2_data = 120'd1329227995784915872903807060280344575;
reg [3:0] hispimodule2_word_offset = 4'd0;
reg [3:0] hispimodule2_bit_offset = 4'd0;
reg hispimodule2_aligned = 1'd0;
reg [119:0] hispimodule3_data = 120'd1329227995784915872903807060280344575;
reg [3:0] hispimodule3_word_offset = 4'd0;
reg [3:0] hispimodule3_bit_offset = 4'd0;
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
wire [119:0] comb_complexslicelowerer_slice_proxy0;
wire [119:0] comb_slice_proxy;
wire [119:0] comb_complexslicelowerer_slice_proxy1;
wire [119:0] comb_complexslicelowerer_slice_proxy2;
wire [119:0] comb_complexslicelowerer_slice_proxy3;
wire [119:0] comb_complexslicelowerer_slice_proxy4;
wire [119:0] comb_complexslicelowerer_slice_proxy5;
wire [119:0] comb_complexslicelowerer_slice_proxy6;
wire [119:0] comb_complexslicelowerer_slice_proxy7;
wire [119:0] comb_complexslicelowerer_slice_proxy8;
wire [119:0] comb_rhs_slice_proxy0;
wire [119:0] comb_rhs_slice_proxy1;
wire [119:0] comb_rhs_slice_proxy2;
wire [119:0] comb_rhs_slice_proxy3;
wire [119:0] comb_complexslicelowerer_slice_proxy9;
wire [119:0] sync_complexslicelowerer_slice_proxy0;
wire [119:0] sync_complexslicelowerer_slice_proxy1;
wire [119:0] sync_complexslicelowerer_slice_proxy2;
wire [119:0] sync_complexslicelowerer_slice_proxy3;
wire [119:0] sync_complexslicelowerer_slice_proxy4;
wire [119:0] sync_complexslicelowerer_slice_proxy5;
wire [119:0] sync_complexslicelowerer_slice_proxy6;
wire [119:0] sync_complexslicelowerer_slice_proxy7;
wire [119:0] sync_complexslicelowerer_slice_proxy8;
wire [119:0] sync_complexslicelowerer_slice_proxy9;
wire [119:0] sync_complexslicelowerer_slice_proxy10;
wire [119:0] sync_complexslicelowerer_slice_proxy11;
wire [119:0] sync_complexslicelowerer_slice_proxy12;
wire [119:0] sync_complexslicelowerer_slice_proxy13;
wire [119:0] sync_complexslicelowerer_slice_proxy14;
wire [119:0] sync_complexslicelowerer_slice_proxy15;
wire [119:0] sync_complexslicelowerer_slice_proxy16;
wire [119:0] sync_complexslicelowerer_slice_proxy17;
wire [119:0] sync_complexslicelowerer_slice_proxy18;
wire [119:0] sync_complexslicelowerer_slice_proxy19;
wire [119:0] sync_complexslicelowerer_slice_proxy20;
wire [119:0] sync_complexslicelowerer_slice_proxy21;
wire [119:0] sync_complexslicelowerer_slice_proxy22;
wire [119:0] sync_complexslicelowerer_slice_proxy23;
wire [119:0] sync_complexslicelowerer_slice_proxy24;
wire [119:0] sync_complexslicelowerer_slice_proxy25;
wire [119:0] sync_complexslicelowerer_slice_proxy26;
wire [119:0] sync_complexslicelowerer_slice_proxy27;
wire [119:0] sync_complexslicelowerer_slice_proxy28;
wire [119:0] sync_complexslicelowerer_slice_proxy29;
wire [119:0] sync_complexslicelowerer_slice_proxy30;
wire [119:0] sync_complexslicelowerer_slice_proxy31;
wire [119:0] sync_complexslicelowerer_slice_proxy32;
wire [119:0] sync_complexslicelowerer_slice_proxy33;
wire [119:0] sync_complexslicelowerer_slice_proxy34;
wire [119:0] sync_complexslicelowerer_slice_proxy35;
wire [119:0] sync_complexslicelowerer_slice_proxy36;
wire [119:0] sync_complexslicelowerer_slice_proxy37;
wire [119:0] sync_complexslicelowerer_slice_proxy38;
wire [119:0] sync_complexslicelowerer_slice_proxy39;
wire [119:0] sync_complexslicelowerer_slice_proxy40;
wire [119:0] sync_complexslicelowerer_slice_proxy41;
wire [119:0] sync_complexslicelowerer_slice_proxy42;
wire [119:0] sync_complexslicelowerer_slice_proxy43;
wire [119:0] sync_complexslicelowerer_slice_proxy44;
wire [119:0] sync_complexslicelowerer_slice_proxy45;
wire [119:0] sync_complexslicelowerer_slice_proxy46;
wire [119:0] sync_complexslicelowerer_slice_proxy47;
wire [119:0] sync_complexslicelowerer_slice_proxy48;
wire [119:0] sync_t_slice_proxy0;
wire [119:0] sync_t_slice_proxy1;
wire [119:0] sync_t_slice_proxy2;
wire [119:0] sync_t_slice_proxy3;
wire [119:0] sync_t_slice_proxy4;
wire [119:0] sync_t_slice_proxy5;
wire [119:0] sync_t_slice_proxy6;
wire [119:0] sync_t_slice_proxy7;
wire [119:0] sync_complexslicelowerer_slice_proxy49;
wire [119:0] sync_t_slice_proxy8;
wire [119:0] sync_t_slice_proxy9;
wire [119:0] sync_t_slice_proxy10;
wire [119:0] sync_t_slice_proxy11;
wire [119:0] sync_t_slice_proxy12;
wire [119:0] sync_t_slice_proxy13;
wire [119:0] sync_t_slice_proxy14;
wire [119:0] sync_t_slice_proxy15;
wire [119:0] sync_complexslicelowerer_slice_proxy50;
wire [119:0] sync_t_slice_proxy16;
wire [119:0] sync_t_slice_proxy17;
wire [119:0] sync_t_slice_proxy18;
wire [119:0] sync_t_slice_proxy19;
wire [119:0] sync_t_slice_proxy20;
wire [119:0] sync_t_slice_proxy21;
wire [119:0] sync_t_slice_proxy22;
wire [119:0] sync_t_slice_proxy23;
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
			if ((comb_complexslicelowerer_slice_proxy0[35:0] == 12'd4095)) begin
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
			case (comb_slice_proxy[11:0])
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
			next_value0 <= comb_complexslicelowerer_slice_proxy1[11:0];
			next_value_ce0 <= 1'd1;
			next_value1 <= comb_complexslicelowerer_slice_proxy2[11:0];
			next_value_ce1 <= 1'd1;
			next_value2 <= comb_complexslicelowerer_slice_proxy3[11:0];
			next_value_ce2 <= 1'd1;
			next_value3 <= comb_complexslicelowerer_slice_proxy4[11:0];
			next_value_ce3 <= 1'd1;
			next_state <= 3'd7;
		end
		3'd7: begin
			next_value4 <= comb_complexslicelowerer_slice_proxy5[11:0];
			next_value_ce4 <= 1'd1;
			next_value5 <= comb_complexslicelowerer_slice_proxy6[11:0];
			next_value_ce5 <= 1'd1;
			next_value6 <= comb_complexslicelowerer_slice_proxy7[11:0];
			next_value_ce6 <= 1'd1;
			next_value7 <= comb_complexslicelowerer_slice_proxy8[11:0];
			next_value_ce7 <= 1'd1;
			next_state <= 1'd1;
		end
		4'd8: begin
			data_valid <= 1'd1;
			frame_start <= found_frame_start;
			found_frame_start_next_value <= 1'd0;
			found_frame_start_next_value_ce <= 1'd1;
			hispimodule10 <= (comb_rhs_slice_proxy0[11:0] >>> 1'd0);
			hispimodule11 <= (comb_rhs_slice_proxy1[11:0] >>> 1'd0);
			hispimodule12 <= (comb_rhs_slice_proxy2[11:0] >>> 1'd0);
			hispimodule13 <= (comb_rhs_slice_proxy3[11:0] >>> 1'd0);
			if ((comb_complexslicelowerer_slice_proxy9[35:0] == 12'd4095)) begin
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
assign comb_complexslicelowerer_slice_proxy0 = (hispimodule0_data >>> (hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd1))));
assign comb_slice_proxy = (hispimodule0_data >>> (hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy1 = (hispimodule0_data >>> (hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy2 = (hispimodule1_data >>> (hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy3 = (hispimodule2_data >>> (hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy4 = (hispimodule3_data >>> (hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy5 = (hispimodule0_data >>> (hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy6 = (hispimodule1_data >>> (hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy7 = (hispimodule2_data >>> (hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy8 = (hispimodule3_data >>> (hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0))));
assign comb_rhs_slice_proxy0 = (hispimodule0_data >>> (hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd0))));
assign comb_rhs_slice_proxy1 = (hispimodule1_data >>> (hispimodule1_bit_offset + (4'd12 * (hispimodule1_word_offset + 1'd0))));
assign comb_rhs_slice_proxy2 = (hispimodule2_data >>> (hispimodule2_bit_offset + (4'd12 * (hispimodule2_word_offset + 1'd0))));
assign comb_rhs_slice_proxy3 = (hispimodule3_data >>> (hispimodule3_bit_offset + (4'd12 * (hispimodule3_word_offset + 1'd0))));
assign comb_complexslicelowerer_slice_proxy9 = (hispimodule0_data >>> (hispimodule0_bit_offset + (4'd12 * (hispimodule0_word_offset + 1'd1))));
assign sync_complexslicelowerer_slice_proxy0 = (hispimodule0_data >>> 1'd0);
assign sync_complexslicelowerer_slice_proxy1 = (hispimodule0_data >>> 1'd1);
assign sync_complexslicelowerer_slice_proxy2 = (hispimodule0_data >>> 2'd2);
assign sync_complexslicelowerer_slice_proxy3 = (hispimodule0_data >>> 2'd3);
assign sync_complexslicelowerer_slice_proxy4 = (hispimodule0_data >>> 3'd4);
assign sync_complexslicelowerer_slice_proxy5 = (hispimodule0_data >>> 3'd5);
assign sync_complexslicelowerer_slice_proxy6 = (hispimodule0_data >>> 3'd6);
assign sync_complexslicelowerer_slice_proxy7 = (hispimodule0_data >>> 3'd7);
assign sync_complexslicelowerer_slice_proxy8 = (hispimodule0_data >>> 4'd8);
assign sync_complexslicelowerer_slice_proxy9 = (hispimodule0_data >>> 4'd9);
assign sync_complexslicelowerer_slice_proxy10 = (hispimodule0_data >>> 4'd10);
assign sync_complexslicelowerer_slice_proxy11 = (hispimodule0_data >>> 4'd11);
assign sync_complexslicelowerer_slice_proxy12 = (hispimodule1_data >>> 1'd0);
assign sync_complexslicelowerer_slice_proxy13 = (hispimodule1_data >>> 1'd1);
assign sync_complexslicelowerer_slice_proxy14 = (hispimodule1_data >>> 2'd2);
assign sync_complexslicelowerer_slice_proxy15 = (hispimodule1_data >>> 2'd3);
assign sync_complexslicelowerer_slice_proxy16 = (hispimodule1_data >>> 3'd4);
assign sync_complexslicelowerer_slice_proxy17 = (hispimodule1_data >>> 3'd5);
assign sync_complexslicelowerer_slice_proxy18 = (hispimodule1_data >>> 3'd6);
assign sync_complexslicelowerer_slice_proxy19 = (hispimodule1_data >>> 3'd7);
assign sync_complexslicelowerer_slice_proxy20 = (hispimodule1_data >>> 4'd8);
assign sync_complexslicelowerer_slice_proxy21 = (hispimodule1_data >>> 4'd9);
assign sync_complexslicelowerer_slice_proxy22 = (hispimodule1_data >>> 4'd10);
assign sync_complexslicelowerer_slice_proxy23 = (hispimodule1_data >>> 4'd11);
assign sync_complexslicelowerer_slice_proxy24 = (hispimodule2_data >>> 1'd0);
assign sync_complexslicelowerer_slice_proxy25 = (hispimodule2_data >>> 1'd1);
assign sync_complexslicelowerer_slice_proxy26 = (hispimodule2_data >>> 2'd2);
assign sync_complexslicelowerer_slice_proxy27 = (hispimodule2_data >>> 2'd3);
assign sync_complexslicelowerer_slice_proxy28 = (hispimodule2_data >>> 3'd4);
assign sync_complexslicelowerer_slice_proxy29 = (hispimodule2_data >>> 3'd5);
assign sync_complexslicelowerer_slice_proxy30 = (hispimodule2_data >>> 3'd6);
assign sync_complexslicelowerer_slice_proxy31 = (hispimodule2_data >>> 3'd7);
assign sync_complexslicelowerer_slice_proxy32 = (hispimodule2_data >>> 4'd8);
assign sync_complexslicelowerer_slice_proxy33 = (hispimodule2_data >>> 4'd9);
assign sync_complexslicelowerer_slice_proxy34 = (hispimodule2_data >>> 4'd10);
assign sync_complexslicelowerer_slice_proxy35 = (hispimodule2_data >>> 4'd11);
assign sync_complexslicelowerer_slice_proxy36 = (hispimodule3_data >>> 1'd0);
assign sync_complexslicelowerer_slice_proxy37 = (hispimodule3_data >>> 1'd1);
assign sync_complexslicelowerer_slice_proxy38 = (hispimodule3_data >>> 2'd2);
assign sync_complexslicelowerer_slice_proxy39 = (hispimodule3_data >>> 2'd3);
assign sync_complexslicelowerer_slice_proxy40 = (hispimodule3_data >>> 3'd4);
assign sync_complexslicelowerer_slice_proxy41 = (hispimodule3_data >>> 3'd5);
assign sync_complexslicelowerer_slice_proxy42 = (hispimodule3_data >>> 3'd6);
assign sync_complexslicelowerer_slice_proxy43 = (hispimodule3_data >>> 3'd7);
assign sync_complexslicelowerer_slice_proxy44 = (hispimodule3_data >>> 4'd8);
assign sync_complexslicelowerer_slice_proxy45 = (hispimodule3_data >>> 4'd9);
assign sync_complexslicelowerer_slice_proxy46 = (hispimodule3_data >>> 4'd10);
assign sync_complexslicelowerer_slice_proxy47 = (hispimodule3_data >>> 4'd11);
assign sync_complexslicelowerer_slice_proxy48 = (hispimodule0_data >>> (hispimodule0_bit_offset + 6'd60));
assign sync_t_slice_proxy0 = (hispimodule1_data >>> (hispimodule1_bit_offset + 1'd0));
assign sync_t_slice_proxy1 = (hispimodule1_data >>> (hispimodule1_bit_offset + 4'd12));
assign sync_t_slice_proxy2 = (hispimodule1_data >>> (hispimodule1_bit_offset + 5'd24));
assign sync_t_slice_proxy3 = (hispimodule1_data >>> (hispimodule1_bit_offset + 6'd36));
assign sync_t_slice_proxy4 = (hispimodule1_data >>> (hispimodule1_bit_offset + 6'd48));
assign sync_t_slice_proxy5 = (hispimodule1_data >>> (hispimodule1_bit_offset + 6'd60));
assign sync_t_slice_proxy6 = (hispimodule1_data >>> (hispimodule1_bit_offset + 7'd72));
assign sync_t_slice_proxy7 = (hispimodule1_data >>> (hispimodule1_bit_offset + 7'd84));
assign sync_complexslicelowerer_slice_proxy49 = (hispimodule0_data >>> (hispimodule0_bit_offset + 6'd60));
assign sync_t_slice_proxy8 = (hispimodule2_data >>> (hispimodule2_bit_offset + 1'd0));
assign sync_t_slice_proxy9 = (hispimodule2_data >>> (hispimodule2_bit_offset + 4'd12));
assign sync_t_slice_proxy10 = (hispimodule2_data >>> (hispimodule2_bit_offset + 5'd24));
assign sync_t_slice_proxy11 = (hispimodule2_data >>> (hispimodule2_bit_offset + 6'd36));
assign sync_t_slice_proxy12 = (hispimodule2_data >>> (hispimodule2_bit_offset + 6'd48));
assign sync_t_slice_proxy13 = (hispimodule2_data >>> (hispimodule2_bit_offset + 6'd60));
assign sync_t_slice_proxy14 = (hispimodule2_data >>> (hispimodule2_bit_offset + 7'd72));
assign sync_t_slice_proxy15 = (hispimodule2_data >>> (hispimodule2_bit_offset + 7'd84));
assign sync_complexslicelowerer_slice_proxy50 = (hispimodule0_data >>> (hispimodule0_bit_offset + 6'd60));
assign sync_t_slice_proxy16 = (hispimodule3_data >>> (hispimodule3_bit_offset + 1'd0));
assign sync_t_slice_proxy17 = (hispimodule3_data >>> (hispimodule3_bit_offset + 4'd12));
assign sync_t_slice_proxy18 = (hispimodule3_data >>> (hispimodule3_bit_offset + 5'd24));
assign sync_t_slice_proxy19 = (hispimodule3_data >>> (hispimodule3_bit_offset + 6'd36));
assign sync_t_slice_proxy20 = (hispimodule3_data >>> (hispimodule3_bit_offset + 6'd48));
assign sync_t_slice_proxy21 = (hispimodule3_data >>> (hispimodule3_bit_offset + 6'd60));
assign sync_t_slice_proxy22 = (hispimodule3_data >>> (hispimodule3_bit_offset + 7'd72));
assign sync_t_slice_proxy23 = (hispimodule3_data >>> (hispimodule3_bit_offset + 7'd84));
assign hispimodule0 = xilinxmultiregimpl0_regs1;
assign hispimodule1 = xilinxmultiregimpl1_regs1;
assign hispimodule2 = xilinxmultiregimpl2_regs1;
assign hispimodule3 = xilinxmultiregimpl3_regs1;

always @(posedge hispi_clk) begin
	hispimodule0_data[107:0] <= hispimodule0_data[119:12];
	hispimodule0_data[119:108] <= hispimodule0;
	hispimodule1_data[107:0] <= hispimodule1_data[119:12];
	hispimodule1_data[119:108] <= hispimodule1;
	hispimodule2_data[107:0] <= hispimodule2_data[119:12];
	hispimodule2_data[119:108] <= hispimodule2;
	hispimodule3_data[107:0] <= hispimodule3_data[119:12];
	hispimodule3_data[119:108] <= hispimodule3;
	if ((sync_complexslicelowerer_slice_proxy0[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 1'd0;
	end
	if ((sync_complexslicelowerer_slice_proxy1[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 1'd1;
	end
	if ((sync_complexslicelowerer_slice_proxy2[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 2'd2;
	end
	if ((sync_complexslicelowerer_slice_proxy3[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 2'd3;
	end
	if ((sync_complexslicelowerer_slice_proxy4[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 3'd4;
	end
	if ((sync_complexslicelowerer_slice_proxy5[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 3'd5;
	end
	if ((sync_complexslicelowerer_slice_proxy6[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 3'd6;
	end
	if ((sync_complexslicelowerer_slice_proxy7[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 3'd7;
	end
	if ((sync_complexslicelowerer_slice_proxy8[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 4'd8;
	end
	if ((sync_complexslicelowerer_slice_proxy9[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 4'd9;
	end
	if ((sync_complexslicelowerer_slice_proxy10[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 4'd10;
	end
	if ((sync_complexslicelowerer_slice_proxy11[35:0] == 12'd4095)) begin
		hispimodule0_bit_offset <= 4'd11;
	end
	if ((sync_complexslicelowerer_slice_proxy12[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 1'd0;
	end
	if ((sync_complexslicelowerer_slice_proxy13[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 1'd1;
	end
	if ((sync_complexslicelowerer_slice_proxy14[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 2'd2;
	end
	if ((sync_complexslicelowerer_slice_proxy15[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 2'd3;
	end
	if ((sync_complexslicelowerer_slice_proxy16[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd4;
	end
	if ((sync_complexslicelowerer_slice_proxy17[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd5;
	end
	if ((sync_complexslicelowerer_slice_proxy18[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd6;
	end
	if ((sync_complexslicelowerer_slice_proxy19[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 3'd7;
	end
	if ((sync_complexslicelowerer_slice_proxy20[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd8;
	end
	if ((sync_complexslicelowerer_slice_proxy21[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd9;
	end
	if ((sync_complexslicelowerer_slice_proxy22[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd10;
	end
	if ((sync_complexslicelowerer_slice_proxy23[35:0] == 12'd4095)) begin
		hispimodule1_bit_offset <= 4'd11;
	end
	if ((sync_complexslicelowerer_slice_proxy24[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 1'd0;
	end
	if ((sync_complexslicelowerer_slice_proxy25[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 1'd1;
	end
	if ((sync_complexslicelowerer_slice_proxy26[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 2'd2;
	end
	if ((sync_complexslicelowerer_slice_proxy27[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 2'd3;
	end
	if ((sync_complexslicelowerer_slice_proxy28[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 3'd4;
	end
	if ((sync_complexslicelowerer_slice_proxy29[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 3'd5;
	end
	if ((sync_complexslicelowerer_slice_proxy30[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 3'd6;
	end
	if ((sync_complexslicelowerer_slice_proxy31[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 3'd7;
	end
	if ((sync_complexslicelowerer_slice_proxy32[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 4'd8;
	end
	if ((sync_complexslicelowerer_slice_proxy33[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 4'd9;
	end
	if ((sync_complexslicelowerer_slice_proxy34[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 4'd10;
	end
	if ((sync_complexslicelowerer_slice_proxy35[35:0] == 12'd4095)) begin
		hispimodule2_bit_offset <= 4'd11;
	end
	if ((sync_complexslicelowerer_slice_proxy36[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 1'd0;
	end
	if ((sync_complexslicelowerer_slice_proxy37[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 1'd1;
	end
	if ((sync_complexslicelowerer_slice_proxy38[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 2'd2;
	end
	if ((sync_complexslicelowerer_slice_proxy39[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 2'd3;
	end
	if ((sync_complexslicelowerer_slice_proxy40[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 3'd4;
	end
	if ((sync_complexslicelowerer_slice_proxy41[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 3'd5;
	end
	if ((sync_complexslicelowerer_slice_proxy42[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 3'd6;
	end
	if ((sync_complexslicelowerer_slice_proxy43[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 3'd7;
	end
	if ((sync_complexslicelowerer_slice_proxy44[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 4'd8;
	end
	if ((sync_complexslicelowerer_slice_proxy45[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 4'd9;
	end
	if ((sync_complexslicelowerer_slice_proxy46[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 4'd10;
	end
	if ((sync_complexslicelowerer_slice_proxy47[35:0] == 12'd4095)) begin
		hispimodule3_bit_offset <= 4'd11;
	end
	hispimodule0_word_offset <= 3'd5;
	hispimodule0_aligned <= 1'd1;
	if ((sync_complexslicelowerer_slice_proxy48[35:0] == 12'd4095)) begin
		if ((sync_t_slice_proxy0[35:0] == 12'd4095)) begin
			hispimodule1_word_offset <= 1'd0;
			hispimodule1_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy1[35:0] == 12'd4095)) begin
			hispimodule1_word_offset <= 1'd1;
			hispimodule1_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy2[35:0] == 12'd4095)) begin
			hispimodule1_word_offset <= 2'd2;
			hispimodule1_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy3[35:0] == 12'd4095)) begin
			hispimodule1_word_offset <= 2'd3;
			hispimodule1_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy4[35:0] == 12'd4095)) begin
			hispimodule1_word_offset <= 3'd4;
			hispimodule1_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy5[35:0] == 12'd4095)) begin
			hispimodule1_word_offset <= 3'd5;
			hispimodule1_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy6[35:0] == 12'd4095)) begin
			hispimodule1_word_offset <= 3'd6;
			hispimodule1_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy7[35:0] == 12'd4095)) begin
			hispimodule1_word_offset <= 3'd7;
			hispimodule1_aligned <= 1'd1;
		end
	end
	if ((sync_complexslicelowerer_slice_proxy49[35:0] == 12'd4095)) begin
		if ((sync_t_slice_proxy8[35:0] == 12'd4095)) begin
			hispimodule2_word_offset <= 1'd0;
			hispimodule2_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy9[35:0] == 12'd4095)) begin
			hispimodule2_word_offset <= 1'd1;
			hispimodule2_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy10[35:0] == 12'd4095)) begin
			hispimodule2_word_offset <= 2'd2;
			hispimodule2_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy11[35:0] == 12'd4095)) begin
			hispimodule2_word_offset <= 2'd3;
			hispimodule2_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy12[35:0] == 12'd4095)) begin
			hispimodule2_word_offset <= 3'd4;
			hispimodule2_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy13[35:0] == 12'd4095)) begin
			hispimodule2_word_offset <= 3'd5;
			hispimodule2_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy14[35:0] == 12'd4095)) begin
			hispimodule2_word_offset <= 3'd6;
			hispimodule2_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy15[35:0] == 12'd4095)) begin
			hispimodule2_word_offset <= 3'd7;
			hispimodule2_aligned <= 1'd1;
		end
	end
	if ((sync_complexslicelowerer_slice_proxy50[35:0] == 12'd4095)) begin
		if ((sync_t_slice_proxy16[35:0] == 12'd4095)) begin
			hispimodule3_word_offset <= 1'd0;
			hispimodule3_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy17[35:0] == 12'd4095)) begin
			hispimodule3_word_offset <= 1'd1;
			hispimodule3_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy18[35:0] == 12'd4095)) begin
			hispimodule3_word_offset <= 2'd2;
			hispimodule3_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy19[35:0] == 12'd4095)) begin
			hispimodule3_word_offset <= 2'd3;
			hispimodule3_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy20[35:0] == 12'd4095)) begin
			hispimodule3_word_offset <= 3'd4;
			hispimodule3_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy21[35:0] == 12'd4095)) begin
			hispimodule3_word_offset <= 3'd5;
			hispimodule3_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy22[35:0] == 12'd4095)) begin
			hispimodule3_word_offset <= 3'd6;
			hispimodule3_aligned <= 1'd1;
		end
		if ((sync_t_slice_proxy23[35:0] == 12'd4095)) begin
			hispimodule3_word_offset <= 3'd7;
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
		hispimodule0_data <= 120'd1329227995784915872903807060280344575;
		hispimodule0_word_offset <= 4'd0;
		hispimodule0_bit_offset <= 4'd0;
		hispimodule0_aligned <= 1'd0;
		hispimodule1_data <= 120'd1329227995784915872903807060280344575;
		hispimodule1_word_offset <= 4'd0;
		hispimodule1_bit_offset <= 4'd0;
		hispimodule1_aligned <= 1'd0;
		hispimodule2_data <= 120'd1329227995784915872903807060280344575;
		hispimodule2_word_offset <= 4'd0;
		hispimodule2_bit_offset <= 4'd0;
		hispimodule2_aligned <= 1'd0;
		hispimodule3_data <= 120'd1329227995784915872903807060280344575;
		hispimodule3_word_offset <= 4'd0;
		hispimodule3_bit_offset <= 4'd0;
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
