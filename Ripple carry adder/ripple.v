module full_adder (
    input a,b,cin,
    output sum,cout
);
    wire axb,l,m;
    
    xor g1(axb,a,b);
    xor g2(sum,axb,cin);

    and g3(l,a,b);
    and g4(m,axb,cin);
    or g5(cout,l,m);
endmodule
module ripple (
    input A3,A2,A1,A0,B3,B2,B1,B0,Cin,
    output S3,S2,S1,S0,C4,C3,C2,C1
);
    full_adder FL1 (
        .a(A0),.b(B0),.cin(Cin),
        .sum(S0),.cout(C1)
    );
    full_adder FL2 (
        .a(A1),.b(B1),.cin(C1),
        .sum(S1),.cout(C2)
    );
    full_adder FL3 (
        .a(A2),.b(B2),.cin(C2),
        .sum(S2),.cout(C3)
    );
    full_adder FL4 (
        .a(A3),.b(B3),.cin(C3),
        .sum(S3),.cout(C4)
    );
endmodule