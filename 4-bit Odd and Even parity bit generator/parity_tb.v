`timescale 1ns/1ns
`include "parity.v"

module parity_tb;

reg [3:0]a;
reg p;
wire even_parity,odd_parity,parity;
integer i,j;

parity uut(.a(a),.p(p),.parity(parity),.even_parity(even_parity),.odd_parity(odd_parity));
initial begin
    $dumpfile("parity_tb.vcd");
    $dumpvars(0, parity_tb);

    $monitor("a=%b, p=%b, parity=%b, even parity=%b, odd parity=%b",a,p,parity,even_parity,odd_parity);

    for (i =0;i<16 ;i=i+1) begin
        a=i;
        for (j =0;j<2 ;j=j+1 ) begin
            p=j;
            #5;
        end
    end
end

endmodule