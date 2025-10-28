`timescale 1ns/1ns
`include "dl.v"

module dl_tb;
    reg clk,D,en;
    wire Q,Qn;

    dl uut(.clk(clk),.D(D),.Q(Q),.Qn(Qn),.en(en));

    initial begin
        $dumpfile("dl.vcd");
        $dumpvars(0,dl_tb);
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end
    
    initial begin
        $monitor("clk=%0t,en=%d ,D=%d, Q=%d, Qn=%d",$time,en,D,Q,Qn);

        D=0;en=0;

        #10 D=1;en=1;
        #10 D=0;en=0;
        #10 D=1;en=0;
        #10 D=0;en=1;
        #10 D=1;en=0;

        #25 $finish;
    end
endmodule