`timescale 1ns/1ns
`include "sr.v"

module sr_tb;
    reg clk,S,R,en;
    wire Q,Qn;

    sr uut(.clk(clk),.S(S),.R(R),.Q(Q),.Qn(Qn),.en(en));

    initial begin
        $dumpfile("sr.vcd");
        $dumpvars(0,sr_tb);
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end
    
    initial begin
        $monitor("clk=%0t,en=%d ,S=%d ,R=%d ,Q=%d, Qn=%d",$time,en,S,R,Q,Qn);

        S=0;R=0;en=1;

        #10 S=0;R=1;en=1;
        #10 S=1;R=0;en=0;
        #10 S=0;R=0;en=1;
        #10 S=1;R=0;en=1;
        #10 S=0;R=0;en=1;

        #25 $finish;
    end
endmodule