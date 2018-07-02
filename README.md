# AXIOM micro gateware
[![build status](https://api.travis-ci.org/axiom-micro/gateware.svg?branch=master)](https://travis-ci.org/axiom-micro/gateware)  
gateware for the main fpga, including a hispi decoder and image processing.

The FPGA design is build using [migen](https://github.com/m-labs/migen)
and is intended to be integrated with the image processing pipeline of
the AXIOM beta. Mainly, the sensor frontend is rewritten, due to the
fact, that the sensor of the micro (the
[AR0330CM](https://www.onsemi.com/pub/Collateral/AR0330CM-D.PDF)) is using
a different protocol (HiSPI) than the beta.


## Hack it
Simply clone this repository, create a virtualenv and install the dependencies by running:
```
git clone https://github.com/axiom-micro/gateware
cd gateware
virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt

```

Then you can run the tests with
`make test` or compile the verilog with `make verilog`.
