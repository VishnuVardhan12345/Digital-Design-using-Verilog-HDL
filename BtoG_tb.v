`timescale 1ns / 1ns
`include "BtoG.v"

module BtoG_tb;

reg B3, B2, B1 ,B0;
wire G3, G2, G1, G0;
integer i;

BtoG uut(B3, B2, B1 ,B0, G3, G2, G1, G0);

initial begin

    $dumpfile("BtoG_tb.vcd");
    $dumpvars(0, BtoG_tb);

    $monitor("binary code=%d%d%d%d ,gray code=%d%d%d%d",B3,B2,B1,B0,G3, G2, G1, G0);

    for (i=0;i<16 ;i=i+1 ) begin
        {B3,B2,B1,B0}=i; #5;
    end
end

endmodule

// `timescale 1ns / 1ns
// `include "BtoG.v"

// module BtoG_tb;
//     reg [3:0]B;
//     wire [3:0]G;

//     BtoG uut(.B(B),.G(G));
//     initial begin

//     $dumpfile("BtoG_tb.vcd");
//     $dumpvars(0, BtoG_tb);

//     $monitor("binary code=%b ,gray code=%b",B,G);

//     for (B=4'b0000;B< 4'b1111 ;B=B+1 ) begin
//         #5;
//     end
//     $finish;
// end

// endmodule