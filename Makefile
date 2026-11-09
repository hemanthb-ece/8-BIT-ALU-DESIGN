SIM=alu_sim
all:
	iverilog -g2012 -o $(SIM) alu.v tb_alu.v
	vvp $(SIM)
wave: all
	gtkwave alu.vcd
clean:
	rm -f $(SIM) alu.vcd
