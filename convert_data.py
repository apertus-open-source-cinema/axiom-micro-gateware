#!/bin/env python3
from migen import *

class ConvertData(Module):
    def __init__(self, in_bits, hispi_bits, num_lanes):
        assert(hispi_bits / in_bits == 2)
        
        self.in_data = Signal(in_bits * num_lanes)
        self.output = Signal(hispi_bits * num_lanes)

        self.clk_out = Signal(reset = 0)

        self.ios = set([self.in_data]) | set([self.output, self.clk_out])

        lane_data = [Signal(hispi_bits) for i in range(num_lanes)]

        self.sync += self.clk_out.eq(~self.clk_out)

        for lane in range(num_lanes):
            for bit in range(in_bits):
#                print("lane", lane)
#                print("bit", bit)
                self.sync += lane_data[lane][bit + in_bits].eq(self.in_data[num_lanes * bit + lane])

        self.sync += [lane_data[lane][0:in_bits].eq(lane_data[lane][in_bits:]) for lane in range(num_lanes)]
        self.comb += [self.output[hispi_bits * lane: hispi_bits * (lane + 1)].eq(lane_data[lane]) for lane in range(num_lanes)]

dut = ConvertData(6, 12, 1) 

def testbench():
#     yield dut.in_data.eq(0x123456)  
#     yield
# 
#     yield dut.in_data.eq(0x789abc)  
#     yield
# 
#     yield dut.in_data.eq(0xdef123)  
#     yield
# 
#     yield dut.in_data.eq(0x012134)  
#     yield
# 
#     yield dut.in_data.eq(0xffffff)  
#     yield
    for i in range(10):
        yield dut.in_data.eq(63)
        yield
        yield dut.in_data.eq(0)
        yield





run_simulation(dut, testbench(), vcd_name="convert.vcd")


dut = ConvertData(6, 12, 4) 

from migen.fhdl.verilog import convert

convert(dut, ios=dut.ios, name="convert_data").write("convert_data.v")

