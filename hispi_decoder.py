#!/bin/env python3
from migen import *
from tqdm import tqdm

class Buffer(Module):
    def __init__(self, size, width, data_in=None):
        self.data = Signal(size * width, reset=2**(size * width) - 1)
        self.size = size
        self.width = width

        if data_in is not None:
            self.sync += [self[i].eq(self[i + 1]) for i in range(size - 1)]
            self.sync += self[size - 1].eq(data_in)

    def slice(self, start, length):
        return (self.data >> start)[:length]

    def __getitem__(self, key):
        return self.data[self.width * key:self.width * key + self.width]
    
    def reset(self):
        self.data.eq(0) 

class HISPILane(Module):
    def __init__(self, hispi_bits):
        self.word_in = Signal(hispi_bits)
        self.word_out = Signal(hispi_bits)

        self.aligned = Signal(reset = 0)
        self.reset = Signal(reset = 0)

        offset = Signal(bits_for(hispi_bits))

        self.inputs = [self.word_in, self.reset]
        self.outputs = [self.word_out, self.aligned]

        buffer_size = 5
        word_buffer = Buffer(buffer_size, hispi_bits, self.word_in)
        self.submodules += word_buffer

        self.comb += If(self.reset == 1,
                self.aligned.eq(0), 
                word_buffer.data.eq(0)).Else(
                self.aligned.eq(self.aligned),
                word_buffer.data.eq(word_buffer.data))

        sync_word = 2**hispi_bits - 1

        self.comb += self.word_out.eq(word_buffer.slice(offset, hispi_bits))

        for bit_offset in range(0, hispi_bits):
            self.sync += If(word_buffer.slice(bit_offset + hispi_bits, 3 * hispi_bits) == sync_word, offset.eq(bit_offset), self.aligned.eq(1))

class HISPIPhy(Module):
    def __init__(self, num_lanes, buffer_depth, hispi_bits):
        self.inputs = [Signal(hispi_bits) for i in range(num_lanes)]
        self.outputs = [Signal(hispi_bits) for i in range(num_lanes)]

        self.aligned = Signal(reset = 0)

        aligned_words = [Signal(hispi_bits) for i in range(num_lanes)]
        word_alignment = [Signal() for i in range(num_lanes)]

        self.reset = Signal(reset = 0)

        lane_buffers = [Buffer(buffer_depth, hispi_bits, aligned_words[i]) for i in range(num_lanes)]

        self.submodules += lane_buffers

        buffer = Array(lane_buffers)

        lanes = [HISPILane(hispi_bits) for i in range(num_lanes)]

        for i in range(num_lanes):
            self.comb += lanes[i].reset.eq(self.reset)
            self.comb += lanes[i].word_in.eq(self.inputs[i])

            self.comb += aligned_words[i].eq(lanes[i].word_out)
            self.comb += word_alignment[i].eq(lanes[i].aligned)

        self.submodules += lanes
        
        lane_offsets = [Signal(bits_for(buffer_depth - 2), reset=1) for i in range(num_lanes)]
        lane_aligned = [Signal(reset = 0) for i in range(num_lanes)]

        sync_word = 2**hispi_bits - 1
        middle_offset = int(buffer_depth / 6) * 3 

        # align lanes relative to lane 0
        # start in middle, because other lanes could be before or afters
        # leave lowest buffer offset alone, so allow outputting the whole sync code (otherwise, we come too late)
        for lane in range(1, num_lanes):
            for offset in range(1, buffer_depth - 2):
                self.sync += If(
                        buffer[0].slice(middle_offset * hispi_bits, 3 * hispi_bits) == sync_word,
                        lane_aligned[0].eq(1),
                        If(
                            buffer[lane].slice(offset * hispi_bits, 3 * hispi_bits) == sync_word,
                            lane_offsets[lane].eq(offset), 
                            lane_aligned[lane].eq(1)))



        self.comb += self.outputs[0].eq(buffer[0].slice((middle_offset - 1) * hispi_bits, 3 * hispi_bits))
        self.comb += [self.outputs[i].eq(buffer[i].slice((lane_offsets[i] - 1) * hispi_bits, 3 * hispi_bits)) for i in range(1, num_lanes)]
        self.comb += self.aligned.eq(reduce(lambda a, b: a & b, lane_aligned[1:], lane_aligned[0]))

class HISPIDecoder(Module):
    def __init__(self, num_lanes, buffer_depth, hispi_bits, output_bits):
        self.inputs = [Signal(hispi_bits) for i in range(num_lanes)]
        self.outputs = [Signal(output_bits) for i in range(num_lanes)]

        self.data_valid = Signal(reset = 0)
        self.frame_start = Signal(reset = 0)
       
        self.in_data = Signal(hispi_bits * num_lanes)
        self.out = Signal(output_bits * num_lanes, name_override="out_data")

        self.comb += [self.inputs[lane].eq(self.in_data[lane * hispi_bits:(lane + 1) * hispi_bits]) for lane in range(num_lanes)]
        self.comb += [self.out[lane * output_bits:(lane + 1) * output_bits].eq(self.outputs[lane]) for lane in range(num_lanes)]

        self.ios = set([self.in_data]) | set([self.out, self.data_valid, self.frame_start])

        found_frame_start = Signal(reset = 0)


        hispi_phy = HISPIPhy(num_lanes, buffer_depth, hispi_bits)
        self.comb += [hispi_phy.inputs[i].eq(self.inputs[i]) for i in range(num_lanes)]

        self.submodules += hispi_phy

        buffer = [Buffer(4, hispi_bits, hispi_phy.outputs[i]) for i in range(num_lanes)]
        self.buffer = buffer
        self.submodules += buffer

        crc = [Buffer(2, hispi_bits) for i in range(num_lanes)]

        fsm = FSM("NO_ALIGN")
        self.submodules += fsm

        sync_lane = 0
        sync_word = 2**hispi_bits - 1

        is_sync_code = lambda w: w.slice(hispi_bits, 3 * hispi_bits) == sync_word
        sync_code = lambda w: w[0]
        data = lambda w: w[0]

        self.real_frame_start = Signal(reset = 0)
        
        fsm.act("NO_ALIGN",
                If(hispi_phy.aligned == 1,
                    NextState("FILLER")    
                ))

        fsm.act("FILLER",
                If(is_sync_code(buffer[sync_lane]),
                    NextState("SYNC_CODE0") 
                ))

        fsm.act("SYNC_CODE0",
                NextState("SYNC_CODE1"))

        fsm.act("SYNC_CODE1",
                NextState("SYNC_CODE2"))

        fsm.act("SYNC_CODE2",
                NextState("SYNC_CODE3"))

        fsm.act("SYNC_CODE3",
                Case(sync_code(buffer[sync_lane]), {
                    0b000000000001: NextState("PIXEL_DATA"),
                    0b000000001001: NextState("FILLER"), # vblank, but we dont handle that yet
                    0b000000010011: [NextValue(found_frame_start, 1), NextState("FILLER")], # embedded data, but we don't handle that yet
                    0b000000000011: [NextValue(found_frame_start, 1), NextState("PIXEL_DATA")], 
                    0b000000010001: NextState("FILLER"), # embedded data, but we don't handle that yet
                    0b000000000101: NextState("CRC0"),
                    0b000000000111: NextState("CRC0"),
                    "default": NextState("FILLER")}))

        fsm.act("CRC0",
                [NextValue(crc[i][0], data(buffer[i])) for i in range(num_lanes)],
                NextState("CRC1"))

        fsm.act("CRC1",
                [NextValue(crc[i][1], data(buffer[i])) for i in range(num_lanes)],
                NextState("FILLER"))

        fsm.act("PIXEL_DATA",
                self.data_valid.eq(1),

                If(found_frame_start == 1,
                    self.frame_start.eq(1),
                    NextValue(found_frame_start, 0)),

                [self.outputs[i].eq(data(buffer[i]) >> (hispi_bits - output_bits)) for i in range(num_lanes)],

                If(is_sync_code(buffer[sync_lane]),
                    NextState("SYNC_CODE0") 
                ))



def testbench():
    v = 0b110001000111111000111010101010101010111111011001100000000000000011001101110111010110110101011101101000000000000000011111111001010101011

    i = 0
    expected = []
    while True:
        k = ((v >> 12) >> (i * 8)) & 0xff
        expected.append(k)

        print(hex(k))

        i += 1
        if ((v >> 12) >> (i * 8)) == 0:
            break


    print()

    for i in range(0, 12):
        w = v >> i

        j = 0

        new = True


        while w > 0:
            if new:
                yield dut.reset.eq(1)
                new = False
            else:
                yield dut.reset.eq(0)

            yield dut.word_in.eq(w)
            yield

            print("offset", i, "value", hex((yield dut.word_out)))
            print()


            if((yield dut.aligned)):
                print("aligned :)")
                assert((yield dut.word_out) == expected[j])
                j += 1

            w = w >> 8

dut = HISPIDecoder(4, 9, 12, 8)
def testbench_phy():
    f = open("test_shifted.txt")

    i = 0

    for line in tqdm(f):
        i += 1
        if i > 10000:
            return

        words = [int(x, 2) for x in line.strip().split(' ')]

        word_input = 0
        for w in range(4):
            word_input |= (words[w] << (12 * w))

        for w in range(4):
            yield dut.in_data.eq(word_input)
        yield

        if (yield dut.frame_start):
            print("new frame")

        if (yield dut.data_valid): 
            print(bin((yield dut.outputs[0])), end=" ")
            print(bin((yield dut.outputs[1])), end=" ")
            print(bin((yield dut.outputs[2])), end=" ")
            print(bin((yield dut.outputs[3])), end="\n")

run_simulation(dut, testbench_phy(), vcd_name="out.vcd")

from migen.fhdl.verilog import convert

dut = HISPIDecoder(4, 9, 12, 8)
convert(dut, ios=dut.ios, name="hispi_decoder").write("hispi_decoder.v")

