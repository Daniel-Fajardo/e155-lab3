module chooseanode(
    	input logic clk, reset,
		input logic [3:0] s1, s2,
    	output logic anode1,
    	output logic anode2,
		output logic [3:0] s
);
    // synchronous logic to alternate state to 0 or 1
	logic state;
    always_ff @(posedge clk)
        if (!reset) state <= 0;
        else if (state==1) state <= 0;
        else state <= 1;

    always_comb
        if (state) begin
            anode1 <= 0;
            anode2 <= 1;
        end
        else begin
            anode1 <= 1;
            anode2 <= 0;
        end
	mux mux(s1[3:0], s2[3:0], state, s[3:0]);
	
endmodule