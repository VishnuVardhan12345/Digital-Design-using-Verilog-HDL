`timescale 1ns/1ns
`include "claa.v"

module claa_tb;
    
    reg A3,A2,A1,A0,B3,B2,B1,B0,Cin;
    wire C1,C2,C3,S3,S2,S1,S0;
    integer i,j;

    claa uut (
        .A3(A3),.A2(A2),.A1(A1),.A0(A0),.B3(B3),.B2(B2),.B1(B1),.B0(B0),.Cin(Cin),.C1(C1),.C2(C2),.C3(C3),.C4(C4),.S3(S3),.S2(S2),.S1(S1),.S0(S0)
    );

    initial begin
        $dumpfile("claa.vcd");
        $dumpvars(0,claa_tb);

        $monitor("A3=%b,A2=%b,A1=%b,A0=%b,B3=%b,B2=%b,B1=%b,B0=%b,S3=%b,S2=%b,S1=%b,S0=%b,C4=%b,C3=%b,C2=%b,C1=%b,Cin=%b",A3,A2,A1,A0,B3,B2,B1,B0,S3,S2,S1,S0,C4,C3,C2,C1,Cin);
        Cin=0;
        for (i =0;i<16 ;i=i+1) begin
        {A3,A2,A1,A0}=i;
        for (j =0;j<16 ;j=j+1 ) begin
            {B3,B2,B1,B0}=j;
            #5;
        end
    end
    end
endmodule