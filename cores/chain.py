from migen import *

from convert_data import ConvertData
from hispi_decoder import HispiDecoder

class Chain(Module):
    """ Move data from one part of the processing chain to the next"""
    def __init__(self):
        self.submodules.converter = ConvertData()
        self.submodules.decoder = ClockDomainsRenamer("hispi")(HispiDecoder())

        self.in_data = self.converter.in_data
        self.out_data = self.decoder.out
        
        self.t = Signal(max=100)

        # Use converter clk_out to tell us when data is ready to be moved out
        self.clock_domains.cd_hispi = ClockDomain(reset_less=True)

        self.comb += self.cd_hispi.clk.eq(self.converter.clk_out)
        self.sync.hispi += [self.decoder.in_data.eq(self.converter.output)]

        self.sync.hispi += [self.t.eq(self.t + 1)]


def test_clock_division():
    def testbench():
        f = open("test_data/test_convert.txt")
        i = 1
        previous_data = 0

        for line in f:
            i += 1
            if i > 1000:
                break

            # import pdb; pdb.set_trace()
            yield dut.in_data.eq(int(line.strip(), 2))
            yield

            # new data is moved in every second clock cycle
            print("conv out: ", format((yield dut.converter.output), 'b'))
            print("dec in: ", format((yield dut.decoder.in_data), 'b'))
            print("clock out: ", (yield dut.converter.clk_out))
            print("clock in counter: ", (yield dut.t))
            print()
            if i % 2 == 0:
                word = (yield dut.converter.output)
                assert (yield dut.decoder.in_data) == word
                previous_data = word
            else:
                pass
                assert (yield dut.decoder.in_data) == previous_data

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
            yield

            print(format((yield dut.decoder.in_data), '0>48b'))

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
    run_simulation(dut, testbench(), clocks = {'sys': 10, 'hispi': (20, 10)})
