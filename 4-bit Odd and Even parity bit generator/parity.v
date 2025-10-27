module parity (
    input [3:0] a,
    input p,          
    output parity,    
    output even_parity, 
    output odd_parity  
);
    assign even_parity = a[3] ^ a[2] ^ a[1] ^ a[0];

    assign odd_parity = ~even_parity;

    assign parity = (p == 0) ? even_parity : odd_parity;
endmodule
