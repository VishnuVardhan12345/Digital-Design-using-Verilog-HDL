module jk (
    input J,K,clk,
    output reg Q,Qn
);
    always @(posedge clk ) begin
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
endmodule