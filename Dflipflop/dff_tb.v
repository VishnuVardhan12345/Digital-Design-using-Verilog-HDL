`timescale 1ns/1ns
`include "dff.v"

module dff_tb;
    reg clk,D;
    wire Q,Qn;

    dff uut(.clk(clk),.D(D),.Q(Q),.Qn(Qn));

    initial begin
        $dumpfile("dff.vcd");
        $dumpvars(0,dff_tb);
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end
    
    initial begin
        $monitor("clk=%0t, D=%d, Q=%d, Qn=%d",$time,D,Q,Qn);

        D=0;

        #10 D=1;
        #10 D=0;
        #10 D=1;
        #10 D=0;
        #10 D=1;

        #25 $finish;
    end
endmodule