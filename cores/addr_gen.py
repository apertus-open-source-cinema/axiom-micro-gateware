from migen import *


class AddrGen(Module):
    """ Generate adresses for a multi buffer memory writer with 1 cycle latency """
    def __init__(self, base_addrs=[0x0f800000 + i * 0x400000 for i in range(1)], addr_bits=32, inc=8*16, max_addr=0x1a000000):
        """
        :param base_addrs: a list containing the base addresses of the buffers
        :param addr_bits: the number of bits of the memory addresses. Normally 32 or 64
        :param inc: The amount of bits, the address should be incremented. This should normally be equal to your word width.
        """

        self.addr = Signal(addr_bits, reset=base_addrs[0])
        self.switch = Signal(reset=0)
        self.data_valid = Signal(reset = 0)
        self.addr_valid = Signal(reset = 0)

        self.ios = {self.switch, self.data_valid} | \
                   {self.addr, self.addr_valid}

        
        burst_size = 16
        num_addr = len(base_addrs)

        base_addrs_array = Array(Signal(addr_bits, reset=addr) for addr in base_addrs)
        base_addr = Signal(addr_bits, reset=base_addrs[0])
        offset = Signal(addr_bits)

        selection = Signal(bits_for(num_addr))

        increment = Signal(reset=0)
        counter = Signal(bits_for(burst_size), reset = 0)

        # generate a new address for every `burst_size` data words
        # counter counts the number of data words
        self.comb += If(counter == 0,
                        If(self.data_valid,
                           increment.eq(1)
                        ).Else(
                           increment.eq(0)
                        )
                     ).Else(
                        increment.eq(0)
                     )

        self.sync += If(self.switch,
                        If(self.data_valid,
                            counter.eq(2)
                        ).Else(
                            counter.eq(1)
                        )
                     ).Else(
                        If(self.data_valid,
                           If(counter == (burst_size - 1),
                              counter.eq(0)
                           ).Else(
                              counter.eq(counter + 1)
                           )
                        )
                     )

        self.comb += self.addr_valid.eq(increment)

        # this is a bit complicated because switch needs to have zero latency
        self.comb += If(self.switch,
                        If(selection == num_addr - 1,
                           base_addr.eq(base_addrs[0]),
                        ).Else(
                           base_addr.eq(base_addrs_array[selection + 1]))
                     ).Else(
                           base_addr.eq(base_addrs_array[selection])
                     )
                       

        self.comb += If(self.switch,
                        self.addr.eq(base_addr)
                     ).Else(
                        self.addr.eq(base_addr + offset))

        self.sync += If(self.switch,
                        If(increment,
                           offset.eq(inc)
                        ).Else(
                           offset.eq(0)
                        ),
                        If(selection == num_addr - 1,
                           selection.eq(0)
                        ).Else(
                           selection.eq(selection + 1))
                     ).Else(
                        If(increment,
                           If(offset + inc >= max_addr,
                              offset.eq(0)
                           ).Else(
                              offset.eq(offset + inc))))

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



addrs = []
for i in range(1):
    addrs.append(0x0f800000 + i * 0x400000)
dut = AddrGen(addrs, 32, 64)  ## burst size of 16 -> 4 * 16
def testbench():
    for i in range(200):
        yield dut.switch.eq(0)
        yield dut.data_valid.eq(1)
        yield 
        if i == 100:
            yield dut.switch.eq(1)

        yield dut.data_valid.eq(0)
        yield
    
run_simulation(dut, testbench(), vcd_name="addr.vcd")
