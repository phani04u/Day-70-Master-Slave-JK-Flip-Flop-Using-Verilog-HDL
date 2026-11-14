module MASTER_SLAVE_ff(
    input J,
    input CLK1,
    input K,
    output Q2,
    output Q_BAR2
);
    wire CLK2;
    wire Q1, Q_BAR1;
    wire M_J, M_K;
    assign CLK2 = ~CLK1;
    // Master input feedback logic
    assign M_J = J & Q_BAR2;
    assign M_K = K & Q2;
    // Master
    JK_FF master(
        .J(M_J),
        .K(M_K),
        .CLK(CLK1),
        .Q(Q1),
        .Q_BAR(Q_BAR1)
    );
    // Slave
    JK_FF slave(
        .J(Q1),
        .K(Q_BAR1),
        .CLK(CLK2),
        .Q(Q2),
        .Q_BAR(Q_BAR2)
    );
endmodule
