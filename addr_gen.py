#!/bin/env python3
from migen import *

class AddrGen(Module):
    def __init__(self, base_addrs, addr_bits, inc):
        num_addr = len(base_addrs)

        self.addr = Signal(addr_bits, reset = base_addrs[0])
        self.increment = Signal(reset = 0)
        self.switch = Signal(reset = 0) 
    
        self.inputs = [self.increment, self.switch]
        self.outputs = [self.addr]
        self.ios = set(self.inputs) | set(self.outputs)

        base_addr = Signal(addr_bits, reset = base_addrs[0])
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


addrs = []

for i in range(4):
    addrs.append(0x0f800000 + i * 0x400000)

dut = AddrGen(addrs, 32, 64)  ## burst size of 16 -> 4 * 16

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

run_simulation(dut, testbench(), vcd_name="addr.vcd")


dut = AddrGen(addrs, 32, 4) 

from migen.fhdl.verilog import convert

convert(dut, ios=dut.ios, name="addr_gen").write("addr_gen.v")

