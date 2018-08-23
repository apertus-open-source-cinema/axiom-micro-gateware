from migen import *
from math import log

class Logarithmizer(Module):
    """
    Decimates a n bit value to a m bit value on a logarithmic scale.
    """
    @staticmethod
    def generate_lut(in_bits, out_bits):
        """
        :returns a logarithmic decimation lut with a good amount of linearity
        :param in_bits: the input number of bits
        :param out_bits: the output number of bits
        :return:
        """

        # approximate a good value for a by using binary search
        a = 1
        step = 1
        last = True
        for _ in range(100):
            try:
                lut = [
                    round(int(log(a * (i + 1) - a + 1) / log(a * (2 ** in_bits) - a + 1) * (2 ** out_bits - 1)))
                    for i in range(2 ** in_bits)
                ]
            except (ValueError, ZeroDivisionError):
                lut = []
            if all(i in lut for i in range(2 ** out_bits)) or lut == []:
                a += step
                if not last:
                    step /= 2
                last = True
            else:
                a -= step
                if last:
                    step /= 2
                last = False

        print("a = %f" % a)
        return lut

    def __init__(self, in_bits=12, out_bits=8):
        """
        :param in_bits: the number of input bits
        :param out_bits: the number of output bits
        """
        assert in_bits > out_bits

        self.in_data = Signal(in_bits)
        self.out_data = Signal(out_bits)

        self.ios = {self.in_data} | \
                   {self.out_data}

        self.specials.mem = Memory(out_bits, 2**in_bits, init=self.generate_lut(in_bits, out_bits))
        self.specials.mem_port = self.mem.get_port(async_read=True)

        self.comb += self.mem_port.adr.eq(self.in_data)
        self.comb += self.out_data.eq(self.mem_port.dat_r)


def test_boundaries():
    device = Logarithmizer()

    def testbench():
        yield device.in_data.eq(0)
        yield
        assert (yield device.out_data) == 0

        yield device.in_data.eq(4095)
        yield
        assert (yield device.out_data) == 255

    run_simulation(device, testbench())
