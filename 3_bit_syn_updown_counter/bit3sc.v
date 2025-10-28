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

module bit3sc (
    input clk,
    input rst,
    input up_down,
    output [2:0] count
);

    wire [2:0] j, k;
    wire [2:0] q;
    wire l;

    jk f0 (.clk(clk), .rst(rst), .J(j[0]), .K(k[0]), .Q(q[0]));
    jk f1 (.clk(clk), .rst(rst), .J(j[1]), .K(k[1]), .Q(q[1]));
    jk f2 (.clk(clk), .rst(rst), .J(j[2]), .K(k[2]), .Q(q[2]));


    assign count = q;

    assign j[0] = 1;
    assign k[0] = 1;

    assign j[1] = (count[0] ~^ up_down);
    assign k[1] = (count[0] ~^ up_down);

    assign l=(~count[1]&~count[0]&~up_down)|(count[1]&count[0]&up_down);

    assign j[2] = l;
    assign k[2] = l;

endmodule