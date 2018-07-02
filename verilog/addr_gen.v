/* Machine-generated using Migen */
module addr_gen(
	output reg [31:0] addr,
	input increment,
	input switch,
	input sys_clk,
	input sys_rst
);

reg [31:0] base_addrs_array0 = 32'd260046848;
reg [31:0] base_addrs_array1 = 32'd264241152;
reg [31:0] base_addrs_array2 = 32'd268435456;
reg [31:0] base_addrs_array3 = 32'd272629760;
reg [1:0] selection = 2'd0;
reg [31:0] array_muxed;


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
	array_muxed <= 32'd0;
	case ((selection + 1'd1))
		1'd0: begin
			array_muxed <= base_addrs_array0;
		end
		1'd1: begin
			array_muxed <= base_addrs_array1;
		end
		2'd2: begin
			array_muxed <= base_addrs_array2;
		end
		default: begin
			array_muxed <= base_addrs_array3;
		end
	endcase
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	if ((switch == 1'd1)) begin
		if ((selection < 2'd3)) begin
			selection <= (selection + 1'd1);
			addr <= array_muxed;
		end else begin
			selection <= 1'd0;
			addr <= base_addrs_array0;
		end
	end
	if ((increment == 1'd1)) begin
		addr <= (addr + 3'd4);
	end
	if (sys_rst) begin
		addr <= 32'd260046848;
		selection <= 2'd0;
	end
end

endmodule
