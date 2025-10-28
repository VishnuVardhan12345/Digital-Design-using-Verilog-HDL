module dff (
    input D,clk,
    output reg Q,Qn
);
    always @(posedge clk) begin
        Q<=D;
        Qn<= ~D;
    end
endmodule

module dtojk (
    input J,K,clk,
    output Q,Qn
);
    wire D;
    assign D=(J&~Q)+(~K&Q);
    dff d1(
        .clk(clk),.D(D),.Q(Q),.Qn(Qn)
    );
endmodule