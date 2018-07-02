from migen import *


class ConvertData(Module):
    """ Convert the SERDES output (6 bit striped) to a 4x12bit format"""
    def __init__(self, in_bits=6, hispi_bits=12, num_lanes=4):
        """
        :param in_bits: the deserialization factor of the connected SERDES
        :param hispi_bits: the number of the HiSpi bits. Normally 12 or 8
        :param num_lanes: the number of HiSpi Lanes. Normally 1, 2 or 4
        """
        assert (hispi_bits / in_bits == 2)

        self.in_data = Signal(in_bits * num_lanes)
        self.output = Signal(hispi_bits * num_lanes)

        self.clk_out = Signal(reset=0)

        self.ios = {self.in_data} | \
                   {self.output, self.clk_out}

        lane_data = [Signal(hispi_bits) for _ in range(num_lanes)]

        self.sync += self.clk_out.eq(~self.clk_out)

        for lane in range(num_lanes):
            for bit in range(in_bits):
                self.sync += lane_data[lane][bit + in_bits].eq(self.in_data[num_lanes * bit + lane])

        self.sync += [lane_data[lane][0:in_bits].eq(lane_data[lane][in_bits:]) for lane in range(num_lanes)]
        self.comb += [self.output[hispi_bits * lane: hispi_bits * (lane + 1)].eq(lane_data[lane]) for lane in
                      range(num_lanes)]


def test_convert_data():
    device = ConvertData()

    def testbench():
        yield device.in_data.eq(0b0101_0101_0101_0101_0101_0101)
        yield
        yield device.in_data.eq(0b1010_1010_1010_1010_1010_1010)
        yield
        yield

        assert (yield device.output) == 0b111111000000_000000111111_111111000000_000000111111

    run_simulation(device, testbench())
