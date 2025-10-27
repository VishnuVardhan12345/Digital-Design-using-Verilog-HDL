`timescale 1ns/1ns
`include "mux4to1.v"

module mux4to1_tb;

    reg d0, d1, d2, d3;
    reg s0, s1;
    wire y;
    integer i;
    
    mux4to1 uut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .s0(s0),
        .s1(s1),
        .y(y)
    );

    initial begin
        $dumpfile("mux4to1.vcd");
        $dumpvars(0,mux4to1_tb);

        $monitor("d0=%b d1=%b d2=%b d3=%b s1=%b s0=%b y=%b",d0, d1, d2, d3, s1, s0, y);

        for (i =0 ;i<64 ;i=i+1 ) begin
            {d0,d1,d2,d3,s1,s0}=i;#5;
        end
    end
endmodule