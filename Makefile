PROJ = top
PIN_DEF = blackice.pcf
DEVICE = 8k

SRC = top.v

all: $(PROJ).rpt $(PROJ).bin

%.blif: %.v $(SRC)
	yosys -p "synth_ice40 -top top -blif $@" $^

%.asc: $(PIN_DEF) %.blif
	arachne-pnr --device 8k --package tq144:4k -o $@ -p $^

%.bin: %.asc
	icepack $< $@

%.rpt: %.asc
	icetime -d hx8k -mtr $@ $<

prog:
	bash -c "cat ${PROJ}.bin > /dev/ttyUSB1"

clean:
	rm -f $(PROJ).blif $(PROJ).asc $(PROJ).rpt $(PROJ).bin

.SECONDARY:
.PHONY: all prog clean
