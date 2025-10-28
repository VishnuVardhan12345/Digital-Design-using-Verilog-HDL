`timescale 1ns / 1ns
`include "bit3sc.v"

module bit3sc_tb;
    reg clk;
    reg rst;
    reg up_down;
    wire [2:0] count; 

    bit3sc uut (
        .clk(clk),.rst(rst),.up_down(up_down),.count(count)
    );

    initial begin
        $dumpfile("bit3sc.vcd");
        $dumpvars(0,bit3sc_tb);
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        rst = 1;
        up_down = 0;
        #10;
        
        rst = 0;
        #10;

        up_down = 1;
        #90;
        
        up_down = 0;
        #50;
        
        $finish;
    end

    initial begin
        $monitor("Time: %0t | rst: %b | Up/Down: %b | Count: %b", $time, rst, up_down, count);
    end

endmodule
