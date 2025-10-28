`timescale 1ns/1ns
`include "bit4rc.v"


module bit4rc_tb;
    reg clk;
    reg rst;
    wire [3:0] Q;

    bit4rc uut (
        .clk(clk),.rst(rst),.Q(Q)
    );

    initial begin
        $dumpfile("bit4rc.vcd");
        $dumpvars(0,bit4rc_tb);
        clk = 0;
        rst = 1;
        #10;
        rst = 0;

        forever begin
            #5 clk=~clk;
        end
    end

    initial begin
        $monitor("Time: %0d, Q: %b", $time, Q);
        #90;
        $finish;
    end
endmodule