from migen import *

from convert_data import ConvertData
from hispi_decoder import HispiDecoder


def test_decode_frame():

    word = 0
    def testbench(decoder):
        f = open("test_data/test_convert.txt")
        i = 0
        frame_start = False

        for line in f:
            i += 1
            if i > 10000:
                return

            yield converter.in_data.eq(int(line.strip(), 2))
            yield
            if i % 2 == 0:
                word = (yield converter.output)
                yield decoder.in_data.eq(word)
                yield
                assert (yield decoder.in_data) == word


    decoder = HispiDecoder()
    converter = ConvertData()
    run_simulation(converter, testbench(decoder))
