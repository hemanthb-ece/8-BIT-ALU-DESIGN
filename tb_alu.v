`timescale 1ns/1ps
module tb_alu;
    reg [7:0] A, B;
    reg [2:0] Sel;
    wire [7:0] Result;
    wire CarryOut, Zero;

    alu dut(.A(A), .B(B), .Sel(Sel), .Result(Result),
            .CarryOut(CarryOut), .Zero(Zero));

    task check;
        input [7:0] exp_result;
        input exp_carry;
        input exp_zero;
        begin
            #1;
            if (Result !== exp_result || CarryOut !== exp_carry || Zero !== exp_zero)
                $display("FAIL Sel=%b A=%h B=%h got Result=%h Carry=%b Zero=%b",
                         Sel, A, B, Result, CarryOut, Zero);
            else
                $display("PASS Sel=%b Result=%h Carry=%b Zero=%b",
                         Sel, Result, CarryOut, Zero);
        end
    endtask

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);

        A=15; B=10; Sel=3'b000; check(25,0,0);
        A=200; B=100; Sel=3'b000; check(44,1,0);
        A=20; B=5; Sel=3'b001; check(15,0,0);
        A=5; B=20; Sel=3'b001; check(241,1,0);
        A=8'hCC; B=8'hAA; Sel=3'b010; check(8'h88,0,0);
        A=8'hCC; B=8'hAA; Sel=3'b011; check(8'hEE,0,0);
        A=8'hCC; B=8'hAA; Sel=3'b100; check(8'h66,0,0);
        A=0; B=0; Sel=3'b000; check(0,0,1);
        $display("ALU testbench completed.");
        $finish;
    end
endmodule
