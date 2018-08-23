/* Machine-generated using Migen */
module addr_gen(
	output reg [31:0] addr,
	input switch,
	input data_valid,
	output addr_valid,
	input sys_clk,
	input sys_rst
);

reg [31:0] base_addrs_array = 32'd260046848;
reg [31:0] base_addr;
reg [31:0] offset = 32'd0;
reg selection = 1'd0;
reg increment;
reg [4:0] counter = 5'd0;
reg [31:0] t_array_muxed;
reg [31:0] f_array_muxed;


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
assign addr_valid = increment;

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	base_addr <= 32'd260046848;
	if (switch) begin
		if ((selection == 1'd0)) begin
			base_addr <= 28'd260046848;
		end else begin
			base_addr <= t_array_muxed;
		end
	end else begin
		base_addr <= f_array_muxed;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	addr <= 32'd260046848;
	if (switch) begin
		addr <= base_addr;
	end else begin
		addr <= (base_addr + offset);
	end
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	t_array_muxed <= 32'd0;
	case ((selection + 1'd1))
		default: begin
			t_array_muxed <= base_addrs_array;
		end
	endcase
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	f_array_muxed <= 32'd0;
	case (selection)
		default: begin
			f_array_muxed <= base_addrs_array;
		end
	endcase
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
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
		if ((selection == 1'd0)) begin
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
		selection <= 1'd0;
		counter <= 5'd0;
	end
end

endmodule
