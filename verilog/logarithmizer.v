/* Machine-generated using Migen */
module logarithmizer(
	input [11:0] in_data,
	output [7:0] out_data,
	input sys_clk,
	input sys_rst
);

wire [11:0] adr;
wire [7:0] dat_r;


// Adding a dummy event (using a dummy signal 'dummy_s') to get the simulator
// to run the combinatorial process once at the beginning.
// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign adr = in_data;
assign out_data = dat_r;

reg [7:0] mem[0:4095];
always @(posedge sys_clk) begin
end

assign dat_r = mem[adr];

initial begin
	$readmemh("mem.init", mem);
end

endmodule
