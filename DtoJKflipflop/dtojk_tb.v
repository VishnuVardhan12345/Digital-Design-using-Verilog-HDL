`timescale 1ns/1ns
`include "dtojk.v"

module dtojk_tb;
    reg clk,J,K;
    wire Q,Qn;

    dtojk uut(.clk(clk),.J(J),.K(K),.Q(Q),.Qn(Qn));

    initial begin
        $dumpfile("dtojk.vcd");
        $dumpvars(0,dtojk_tb);
        clk=0;
        forever begin
            #5 clk=~clk;
        end
    end
    
    initial begin
        $monitor("clk=%0t, J=%d, K=%d, Q=%d, Qn=%d",$time,J,K,Q,Qn);

        J=0;K=0;

        #10 J=1;K=0;
        #10 J=0;K=1;
        #10 J=1;K=1;
        #10 J=0;K=0;
        #10 J=1;K=1;

        #25 $finish;
    end
endmodule