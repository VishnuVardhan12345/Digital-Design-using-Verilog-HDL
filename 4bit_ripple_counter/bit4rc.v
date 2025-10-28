module jk (
    input J,K,clk,rst,
    output reg Q,Qn
);
    always @(posedge clk ) begin
        if (rst) begin
            Q=0;
            Qn=1;
        end else begin
            case ({J,K})
            2'b00:
                begin
                    Q=Q;
                    Qn=~Q;
                end
            2'b01: 
                begin
                    Q=0;
                    Qn=~Q;
                end    
            2'b10:
                begin
                    Q=1;
                    Qn=~Q;
                end 
            2'b11:
                begin
                    Q= ~Q;
                    Qn=~Q;
                end 
        endcase
        end
    end
endmodule

module bit4rc (
    input clk,rst,
    output wire [3:0] Q
);
    wire [3:0] Qn;

    jk f0 (
        .J(1'b1),
        .K(1'b1),
        .clk(~clk),
        .rst(rst),
        .Q(Q[0]),
        .Qn(Qn[0])
    );

    jk f1 (
        .J(1'b1),
        .K(1'b1),
        .clk(~Q[0]),
        .rst(rst),
        .Q(Q[1]),
        .Qn(Qn[1])
    );

    jk f2 (
        .J(1'b1),
        .K(1'b1),
        .clk(~Q[1]),
        .rst(rst),
        .Q(Q[2]),
        .Qn(Qn[2])
    );

    jk f3 (
        .J(1'b1),
        .K(1'b1),
        .clk(~Q[2]),
        .rst(rst),
        .Q(Q[3]),
        .Qn(Qn[3])
    );
endmodule

