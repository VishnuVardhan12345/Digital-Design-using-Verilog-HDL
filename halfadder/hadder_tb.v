`timescale 1ns / 1ns
`include "hadder.v"

module hadder_tb;

reg A,B;
wire sum, carry;
integer i;

hadder uut(A,B,sum,carry);

initial begin

    $dumpfile("hadder_tb.vcd");
    $dumpvars(0, hadder_tb);

    $monitor("A=%d ,B=%d, sum=%d, carry=%d",A,B,sum,carry);

    for (i=0;i<4 ;i=i+1 ) begin
        {A,B}=i; #5;
    end
end

endmodule