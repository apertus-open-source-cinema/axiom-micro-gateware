all:
	xzcat test_shifted.txt.xz > test_shifted.txt
	./addr_gen.py
	./convert_data.py
	./hispi_decoder.py
