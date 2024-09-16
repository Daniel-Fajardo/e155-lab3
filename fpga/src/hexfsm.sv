module hexfsm(
    input logic [3:0] col, row,
    output logic [3:0] hex
);
    always_comb
        case(col)
            4'b0001: if (row[0]) hex <= 4'b1010; // A
                else if (row[1]) hex <= 4'b0111; // 7
                else if (row[2]) hex <= 4'b0100; // 4
                else if (row[3]) hex <= 4'b0001; // 1
                else hex <= 4'bxxxx;
            4'b0010: if (row[0]) hex <= 4'b0000; // 0
                else if (row[1]) hex <= 4'b1000; // 8
                else if (row[2]) hex <= 4'b0101; // 5
                else if (row[3]) hex <= 4'b0010; // 2
                else hex <= 4'bxxxx;
            4'b0100: if (row[0]) hex <= 4'b1011; // B
                else if (row[1]) hex <= 4'b1001; // 9
                else if (row[2]) hex <= 4'b0110; // 6
                else if (row[3]) hex <= 4'b0011; // 3
                else hex <= 4'bxxxx;
            4'b1000: if (row[0]) hex <= 4'b1111; // F
                else if (row[1]) hex <= 4'b1110; // E
                else if (row[2]) hex <= 4'b1101; // D
                else if (row[3]) hex <= 4'b1100; // C
                else hex <= 4'bxxxx;
            default: hex <= 4'bxxxx;
        endcase
endmodule