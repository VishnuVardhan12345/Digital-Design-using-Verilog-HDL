`timescale 1ns/1ns
`include "mux2to1.v"

module mux2to1_tb;
    
    reg I0,I1,sel;
    wire y;
    integer i;

    mux2to1 uut(I0,I1,sel,y);
    initial begin
        $dumpfile("mux2to1.vcd");
        $dumpvars(0,mux2to1_tb);

        $monitor("I0=%d, I1=%d, sel=%d, y=%d",I0,I1,sel,y);

        for (i =0 ;i<8 ;i=i+1 ) begin
            {I0,I1,sel}=i;#5;
        end
    end
endmodule