verilog: verilog/convert_data.v

verilog/%.v: cores/%.py
	mkdir -p verilog
	python migen2verilog.py $< $@



test: test_data/test_shifted.txt
	pytest

test_data/test_shifted.txt: test_data/test_shifted.txt.xz
	xzcat $< > $@


.PHONY: clean
clean:
	rm -rf verilog/
