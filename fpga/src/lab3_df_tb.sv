module lab3_df_tb();
    logic reset;
    logic anode1, anode2;
    logic [3:0] row, col;
    logic [6:0] seg;

    lab3_df_tb duttop(.reset(reset), .row(row), .seg(seg), .anode1(anode1), .anode2(anode2), .col(col));

    initial begin
        reset = 1; #5;
        reset = 0; #5;
        row = 4'b0000; #100000;
        row = 4'b0001; #500000;
        row = 4'b0000; #300000;
        row = 4'b0100; #500000;
        row = 4'b0101; #200000;
        row = 4'b0001; #300000;
        row = 4'b0000; #200000;
        row = 4'b1000; #300000;


        end
endmodule