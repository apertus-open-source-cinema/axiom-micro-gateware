from migen import *
from cores.hispi_rx import HispiRx
from cores.addr_gen import AddrGen
from tqdm import tqdm

class IntegrationTest(Module):
    def __init__(self):
        self.data_in = Signal(24)
        self.ios = {self.data_in}
        self.submodules.hispi = HispiRx()
        self.submodules.addr_gen = AddrGen()

        self.comb += [
            self.hispi.data_in.eq(self.data_in),
            self.addr_gen.switch.eq(self.hispi.double_up.frame_start),
            self.addr_gen.data_valid.eq(self.hispi.double_up.data_valid),
            self.addr_gen.data_in.eq(self.hispi.double_up.data_out),
        ]
        


dut = IntegrationTest()
def testbench():
    f = open("../test_data/test_convert5.txt")

    for line in tqdm(f):
        yield dut.data_in.eq(int(line.strip().split(' ')[0], 2))
        yield


run_simulation(dut, testbench(), clocks = {'sys': 10, 'hispi': (20, 10), 'half_hispi': (40, 20)}, vcd_name="int_test.vcd")

