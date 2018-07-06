from migen import *
from migen.genlib.cdc import MultiReg

from convert_data import ConvertData
from hispi_decoder import HispiDecoder

class Chain(Module):
    """ Move data from one part of the processing chain to the next"""
    def __init__(self, num_lanes=4, hispi_bits=12):
        self.submodules.converter = ConvertData()
        self.submodules.decoder = ClockDomainsRenamer("hispi")(HispiDecoder(num_lanes=num_lanes, hispi_bits=hispi_bits))

        self.in_data = self.converter.in_data
        self.out_data = self.decoder.out
        
        # Use converter clk_out to tell us when data is ready to be moved out
        self.clock_domains.cd_hispi = ClockDomain(reset_less=True)

        conv_out_hispi = Signal(num_lanes * hispi_bits)
        self.specials += MultiReg(self.converter.output, conv_out_hispi, "hispi")

        self.comb += self.cd_hispi.clk.eq(self.converter.clk_out)
        self.comb += [self.decoder.in_data.eq(conv_out_hispi)]


def test_clock_division():
    def testbench():
        f = open("test_data/test_convert.txt")
        i = 1
        previous_data = 0
        prev2_data = 0

        for line in f:
            i += 1
            if i > 1000:
                break

            yield dut.in_data.eq(int(line.strip(), 2))
            yield

            # new data is moved in every second clock cycle
            if i % 2 == 0:
                word = (yield dut.converter.output)
                assert (yield dut.decoder.in_data) == previous_data
                prev2_data = previous_data
                previous_data = word
            else:
                assert (yield dut.decoder.in_data) == prev2_data

    dut = Chain()
    run_simulation(dut, testbench(), clocks = {'sys': 10, 'hispi': 20})


def test_decoding():
    def testbench():
        f = open("test_data/test_convert.txt")
        i = 0

        valid = False
        frame_start = False
        frame = b""

        for line in f:
            i += 1
            if i > 1000:
                break

            yield dut.in_data.eq(int(line.strip(), 2))
            print (format(int(line.strip(), 2), '0>24b'))
            yield

            print(format((yield dut.decoder.in_data), '0>48b'))
            print("state:", (yield dut.decoder._submodules[-1][1].state))

            if (yield dut.decoder.data_valid) == 1 and not valid:
                valid = True
            if (yield dut.decoder.frame_start) == 1:
                if frame_start == True:
                    break
                frame_start = True

            if frame_start:
                frame += dut.decoder.out

        assert valid == True and frame_start == True

    dut = Chain()
    run_simulation(dut, testbench(), clocks = {'sys': 10, 'hispi': (20, 10)}, vcd_name="decoding.vcd")
