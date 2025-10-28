`timescale 1ns / 1ns
`include "piso.v"

module piso_tb();

    reg q1,q2,q3,load;        
    reg clk;     
    reg rst;   
    wire o;       

    piso uut(
        .q1(q1),.q2(q2),.q3(q3),.load(load),.clk(clk),.rst(rst),.o(o));

    initial begin
        $dumpfile("piso.vcd");
        $dumpvars(0,piso_tb);
        clk=0;
        forever #5 clk=~clk;
     end
     initial begin
        rst = 1;
        #10;
        #10;
        load=1;
        q1 = 1;
        q2 = 0;
        q3 = 1;
        rst=0;
        #10;
        load=0;
        #50;
        $finish;
    end
endmodule


// module piso_tb;

//     reg clk;
//     reg load;
//     reg [3:0] p;
//     wire serial_out;
//     reg rst;

//     piso uut (
//         .clk(clk),.load(load),.p(p),.serial_out(serial_out),.rst(rst)
//     );

//     initial begin
//         $dumpfile("piso.vcd");
//         $dumpvars(0,piso_tb);
//         clk = 0;
//         forever #5 clk = ~clk;
//     end

//     initial begin

//         rst=1;
//         load=0;
//         p=4'b0000;
//         #10;
        
//         rst=0;
//         p = 4'b1010;
//         #10;
//         load = 1;
//         #10;

//         load = 0;
//         #40;
//         $finish;
//     end
// endmodule



