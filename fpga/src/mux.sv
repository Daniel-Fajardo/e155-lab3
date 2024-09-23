module mux(
	input logic [3:0] s1, s2, 
	input logic state,
	output logic [3:0] s
);
	assign s = state ? s2 : s1;
endmodule