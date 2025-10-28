module full_adder (
    input a,b,cin,
    output sum,cout
);
    wire axb;
    
    xor g1(axb,a,b);
    xor g2(sum,axb,cin);

    // and g3(l,a,b);
    // and g4(m,axb,cin);
    // or g5(cout,l,m);
endmodule

module carryGen (
    input A,B,Cin,
    output Cout
);
    wire G,P,l;

    and cg1(G,A,B);
    xor cg2(P,A,B);
    and cg3(l,P,Cin);
    or cg4(Cout,G,l);
endmodule

module claa (
    input A3,A2,A1,A0,B3,B2,B1,B0,Cin,
    output S3,S2,S1,S0,C4,C3,C2,C1
);
    carryGen c1(
        .A(A0),.B(B0),.Cin(Cin),.Cout(C1)
    );
    carryGen c2(
        .A(A1),.B(B1),.Cin(C1),.Cout(C2)
    );
    carryGen c3(
        .A(A2),.B(B2),.Cin(C2),.Cout(C3)
    );
    carryGen c4(
        .A(A3),.B(B3),.Cin(C3),.Cout(C4)
    );
    
    full_adder fl1(
        .a(A0),.b(B0),.cin(Cin),.sum(S0)
    );
    full_adder fl2(
        .a(A1),.b(B1),.cin(C1),.sum(S1)
    );
    full_adder fl3(
        .a(A2),.b(B2),.cin(C2),.sum(S2)
    );
    full_adder fl4(
        .a(A3),.b(B3),.cin(C3),.sum(S3)
    );
endmodule