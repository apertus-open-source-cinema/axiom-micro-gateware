from migen import *


class AddrGen(Module):
    def __init__(self, base_addrs=[0x0f800000 + i * 0x400000 for i in range(4)], addr_bits=32, inc=4):
        num_addr = len(base_addrs)

        self.addr = Signal(addr_bits, reset=base_addrs[0])
        self.increment = Signal(reset=0)
        self.switch = Signal(reset=0)

        self.inputs = [self.increment, self.switch]
        self.outputs = [self.addr]
        self.ios = set(self.inputs) | set(self.outputs)

        base_addr = Signal(addr_bits, reset=base_addrs[0])
        pos = Signal(addr_bits)
        selection = Signal(bits_for(num_addr - 1))

        self.sync += If(self.switch == 1,
                        selection.eq(selection + 1),
                        )
        self.sync += If(self.switch == 1,
                        pos.eq(1)
                        ).Else(If(self.increment == 1,
                                  pos.eq(pos + 1)))

        for i in range(num_addr):
            self.comb += If(self.switch == 1,
                            If(selection == i,
                               base_addr.eq(base_addrs[(i + 1) % num_addr]))
                            ).Else(
                If(selection == i,
                   base_addr.eq(base_addrs[i])))

        self.comb += If(self.switch == 1,
                        self.addr.eq(base_addr)
                        ).Else(
            self.addr.eq(base_addr + inc * pos))


def test_addr_gen():
    dut = AddrGen(inc=64)  # burst size of 16 -> 4 * 16

    def testbench():
        yield dut.switch.eq(0)
        yield dut.increment.eq(0)
        yield

        yield dut.switch.eq(0)
        yield dut.increment.eq(1)
        yield

        yield dut.switch.eq(0)
        yield dut.increment.eq(1)
        yield

        yield dut.switch.eq(0)
        yield dut.increment.eq(1)
        yield

        yield dut.switch.eq(0)
        yield dut.increment.eq(1)
        yield

        yield dut.switch.eq(1)
        yield dut.increment.eq(1)
        yield

        yield dut.switch.eq(0)
        yield dut.increment.eq(1)
        yield

        for i in range(20):
            yield dut.switch.eq(1)
            yield dut.increment.eq(1)
            yield

            yield dut.switch.eq(0)
            yield dut.increment.eq(1)
            yield

            yield dut.switch.eq(0)
            yield dut.increment.eq(1)
            yield

            yield dut.switch.eq(0)
            yield dut.increment.eq(1)
            yield

            yield dut.switch.eq(0)
            yield dut.increment.eq(1)
            yield

    run_simulation(dut, testbench())
