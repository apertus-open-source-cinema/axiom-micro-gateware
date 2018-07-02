verilog: $(shell find cores/*.py | sed -r 's|cores/(.*)\.py|verilog/\1.v|g')

verilog/%.v: cores/%.py
	mkdir -p verilog
	python migen2verilog.py $< $@



test: test_data/test_shifted.txt test_data/test_convert.txt
	pytest

test_data/%.txt : test_data/%.txt.xz
	xzcat $< > $@


# test#_data/test_shifted.txt: test_data/test_shifted.txt.xz
#	xzcat $< > $@


.PHONY: clean
clean:
	rm -rf verilog/
