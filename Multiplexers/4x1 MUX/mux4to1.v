module mux2to1 (
    input wire d0,input wire d1,
    input wire sel,output wire seln,
    output wire l,output wire m,
    output wire y         
);
    and g1(l,d1,sel);
    not g2(seln,sel);
    and g3(m,d0,seln);
    or g4(y,l,m);
endmodule

module mux4to1 (
    input wire d0,input wire d1,
    input wire d2,input wire d3,
    input wire s0,input wire s1,
    output wire y 
);
    wire m0, m1;

    mux2to1 mux0 (
        .d0(d0),
        .d1(d1),
        .sel(s0),
        .y(m0)
    );

    mux2to1 mux1 (
        .d0(d2),
        .d1(d3),
        .sel(s0),
        .y(m1)
    );

    mux2to1 mux2 (
        .d0(m0),
        .d1(m1),
        .sel(s1),
        .y(y)
    );
endmodule
