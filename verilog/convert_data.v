/* Machine-generated using Migen */
module convert_data(
	input [23:0] in_data,
	output reg [47:0] output_1,
	output reg clk_out,
	input sys_clk,
	input sys_rst
);

reg [11:0] lane_data0 = 12'd0;
reg [11:0] lane_data1 = 12'd0;
reg [11:0] lane_data2 = 12'd0;
reg [11:0] lane_data3 = 12'd0;


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
	output_1 <= 48'd0;
	output_1[11:0] <= lane_data0;
	output_1[23:12] <= lane_data1;
	output_1[35:24] <= lane_data2;
	output_1[47:36] <= lane_data3;
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	clk_out <= (~clk_out);
	lane_data0[6] <= in_data[0];
	lane_data0[7] <= in_data[4];
	lane_data0[8] <= in_data[8];
	lane_data0[9] <= in_data[12];
	lane_data0[10] <= in_data[16];
	lane_data0[11] <= in_data[20];
	lane_data1[6] <= in_data[1];
	lane_data1[7] <= in_data[5];
	lane_data1[8] <= in_data[9];
	lane_data1[9] <= in_data[13];
	lane_data1[10] <= in_data[17];
	lane_data1[11] <= in_data[21];
	lane_data2[6] <= in_data[2];
	lane_data2[7] <= in_data[6];
	lane_data2[8] <= in_data[10];
	lane_data2[9] <= in_data[14];
	lane_data2[10] <= in_data[18];
	lane_data2[11] <= in_data[22];
	lane_data3[6] <= in_data[3];
	lane_data3[7] <= in_data[7];
	lane_data3[8] <= in_data[11];
	lane_data3[9] <= in_data[15];
	lane_data3[10] <= in_data[19];
	lane_data3[11] <= in_data[23];
	lane_data0[5:0] <= lane_data0[11:6];
	lane_data1[5:0] <= lane_data1[11:6];
	lane_data2[5:0] <= lane_data2[11:6];
	lane_data3[5:0] <= lane_data3[11:6];
	if (sys_rst) begin
		clk_out <= 1'd0;
		lane_data0 <= 12'd0;
		lane_data1 <= 12'd0;
		lane_data2 <= 12'd0;
		lane_data3 <= 12'd0;
	end
end

endmodule
