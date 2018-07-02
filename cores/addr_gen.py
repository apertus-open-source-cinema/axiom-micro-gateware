from migen import *


class AddrGen(Module):
    def __init__(self, base_addrs=[0x0f800000 + i * 0x400000 for i in range(4)], addr_bits=32, inc=4):
        num_addr = len(base_addrs)
        base_addrs_array=Array(Signal(addr_bits, reset=addr) for addr in base_addrs)

        self.addr = Signal(addr_bits, reset=base_addrs[0])

        self.increment = Signal(reset=0)
        self.switch = Signal(reset=0)

        self.ios = {self.increment, self.switch} |\
                   {self.addr}

        selection = Signal(max=num_addr)

        self.sync += If(self.switch == 1,
                            If(selection < num_addr-1,
                               selection.eq(selection + 1),
                               self.addr.eq(base_addrs_array[selection + 1])
                               ).Else(
                                selection.eq(0),
                                self.addr.eq(base_addrs_array[0])
                               )
                        )
        self.sync += If(self.increment == 1,
                            self.addr.eq(self.addr + inc)
                        )


def test_addr_gen():
    device = AddrGen([0, 10], 32, 1)

    def testbench():
        assert (yield device.addr) == 0

        yield device.switch.eq(1)
        yield
        yield device.switch.eq(0)
        yield
        assert (yield device.addr) == 10

        yield device.increment.eq(1)
        yield
        yield device.increment.eq(0)
        yield
        assert (yield device.addr) == 11

        yield device.switch.eq(1)
        yield
        yield device.switch.eq(0)
        yield
        assert (yield device.addr) == 0

    run_simulation(device, testbench())
