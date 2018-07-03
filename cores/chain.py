from migen import *

from convert_data import ConvertData
from hispi_decoder import HispiDecoder

class Chain(Module):
    """ Move data from one part of the processing chain to the next"""
    def __init__(self):
        self.submodules.converter = ConvertData()
        self.submodules.decoder = HispiDecoder()

        self.in_data = self.converter.in_data
        self.out_data = self.decoder.out

        # Use converter clk_out to tell us when data is ready to be moved out
        cd = ClockDomain(reset_less = True, name="hispi")
        cd.clk = self.converter.clk_out
        self.clock_domains += cd

        self.sync.hispi += [self.decoder.in_data.eq(self.converter.output)]


def test_clock_division():
    word = 0
    def testbench():
        f = open("test_data/test_convert.txt")
        i = 0
        frame_start = False

        for line in f:
            i += 1
            if i > 10000:
                return

            yield dut.in_data.eq(int(line.strip(), 2))
            if i % 2 == 0:
                word = (yield dut.converter.output)
                assert (yield dut.decoder.in_data) == word


    dut = Chain()
    run_simulation(dut, testbench())
