# Major Project 1 – 8-bit Arithmetic Logic Unit (ALU)

## Objective
Implement an 8-bit ALU supporting addition, subtraction, AND, OR and XOR, with a carry/borrow indicator and zero flag.

## Operation select
| `Sel` | Operation |
|---|---|
| `000` | Addition (`A + B`) |
| `001` | Subtraction (`A - B`) |
| `010` | AND |
| `011` | OR |
| `100` | XOR |

`Zero` is 1 when `Result` is zero. For subtraction, `CarryOut` is defined here as a borrow indicator (1 when A < B); for addition it indicates the 9th-bit carry. Logical operations clear `CarryOut`.

## Files
- `alu.v` – combinational ALU.
- `tb_alu.v` – testbench covering all operations and boundary cases.
- `Makefile` – compile, run and waveform targets.

## Run
```bash
make
make wave
```

Manual commands:

```bash
iverilog -g2012 -o alu_sim alu.v tb_alu.v
vvp alu_sim
gtkwave alu.vcd
```

FPGA synthesis/place-and-route and board programming are optional extensions in the supplied project brief and are not claimed as completed by this RTL simulation package.
