/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Wed Jul  1 02:21:29 2020
/////////////////////////////////////////////////////////////


module counter_0_DW01_inc_0 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;

  wire   [14:2] carry;

  ADDHXL U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  XOR2X1 U1 ( .A(carry[14]), .B(A[14]), .Y(SUM[14]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module counter_0 ( clk, reset, recount_counter, count_out );
  output [14:0] count_out;
  input clk, reset, recount_counter;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         n1;

  counter_0_DW01_inc_0 add_82 ( .A(count_out), .SUM({N17, N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  DFFTRX1 \count_out_reg[13]  ( .D(N16), .RN(n1), .CK(clk), .Q(count_out[13])
         );
  DFFTRX1 \count_out_reg[12]  ( .D(N15), .RN(n1), .CK(clk), .Q(count_out[12])
         );
  DFFTRX1 \count_out_reg[9]  ( .D(N12), .RN(n1), .CK(clk), .Q(count_out[9]) );
  DFFTRX1 \count_out_reg[7]  ( .D(N10), .RN(n1), .CK(clk), .Q(count_out[7]) );
  DFFTRX1 \count_out_reg[8]  ( .D(N11), .RN(n1), .CK(clk), .Q(count_out[8]) );
  DFFTRX1 \count_out_reg[6]  ( .D(N9), .RN(n1), .CK(clk), .Q(count_out[6]) );
  DFFTRX1 \count_out_reg[11]  ( .D(N14), .RN(n1), .CK(clk), .Q(count_out[11])
         );
  DFFTRX1 \count_out_reg[10]  ( .D(N13), .RN(n1), .CK(clk), .Q(count_out[10])
         );
  DFFTRX1 \count_out_reg[14]  ( .D(N17), .RN(n1), .CK(clk), .Q(count_out[14])
         );
  DFFTRX1 \count_out_reg[0]  ( .D(N3), .RN(n1), .CK(clk), .Q(count_out[0]) );
  DFFTRX1 \count_out_reg[1]  ( .D(N4), .RN(n1), .CK(clk), .Q(count_out[1]) );
  DFFTRX1 \count_out_reg[2]  ( .D(N5), .RN(n1), .CK(clk), .Q(count_out[2]) );
  DFFTRX1 \count_out_reg[3]  ( .D(N6), .RN(n1), .CK(clk), .Q(count_out[3]) );
  DFFTRX1 \count_out_reg[5]  ( .D(N8), .RN(n1), .CK(clk), .Q(count_out[5]) );
  DFFTRX1 \count_out_reg[4]  ( .D(N7), .RN(n1), .CK(clk), .Q(count_out[4]) );
  NOR2X1 U3 ( .A(reset), .B(recount_counter), .Y(n1) );
endmodule


module busy_mod_little ( count_out, busy, recount_counter, clk, reset );
  input [14:0] count_out;
  input clk, reset;
  output busy, recount_counter;
  wire   state, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n1, n2, n3, n4;

  DFFQX1 recount_counter_reg ( .D(n21), .CK(clk), .Q(recount_counter) );
  DFFQX1 busy_reg ( .D(n20), .CK(clk), .Q(busy) );
  DFFQX1 state_reg ( .D(n22), .CK(clk), .Q(state) );
  NOR3BXL U3 ( .AN(n11), .B(n12), .C(n13), .Y(n9) );
  CLKINVX1 U4 ( .A(n9), .Y(n3) );
  AND3X2 U5 ( .A(count_out[3]), .B(count_out[13]), .C(count_out[2]), .Y(n11)
         );
  NAND4BX1 U6 ( .AN(n14), .B(count_out[9]), .C(count_out[7]), .D(count_out[8]), 
        .Y(n13) );
  NAND4BX1 U7 ( .AN(n15), .B(count_out[10]), .C(count_out[11]), .D(
        count_out[12]), .Y(n12) );
  NAND3BX1 U8 ( .AN(count_out[14]), .B(count_out[0]), .C(count_out[1]), .Y(n15) );
  OAI32X1 U9 ( .A0(n1), .A1(state), .A2(reset), .B0(n2), .B1(n10), .Y(n22) );
  CLKINVX1 U10 ( .A(n10), .Y(n1) );
  OAI221XL U11 ( .A0(n2), .A1(n7), .B0(state), .B1(n3), .C0(n4), .Y(n10) );
  OR4X1 U12 ( .A(count_out[6]), .B(count_out[7]), .C(count_out[8]), .D(
        count_out[9]), .Y(n18) );
  NAND3X1 U13 ( .A(count_out[5]), .B(count_out[4]), .C(count_out[6]), .Y(n14)
         );
  NAND2X1 U14 ( .A(n16), .B(n17), .Y(n7) );
  NOR4X1 U15 ( .A(n19), .B(n15), .C(count_out[11]), .D(count_out[10]), .Y(n16)
         );
  NOR4X1 U16 ( .A(n18), .B(count_out[3]), .C(count_out[5]), .D(count_out[4]), 
        .Y(n17) );
  OR3X2 U17 ( .A(count_out[13]), .B(count_out[2]), .C(count_out[12]), .Y(n19)
         );
  NAND2X1 U18 ( .A(n4), .B(n8), .Y(n21) );
  OAI21XL U19 ( .A0(n9), .A1(state), .B0(recount_counter), .Y(n8) );
  OAI31XL U20 ( .A0(n3), .A1(reset), .A2(n5), .B0(n6), .Y(n20) );
  NAND2X1 U21 ( .A(busy), .B(n5), .Y(n6) );
  NOR3BXL U22 ( .AN(n7), .B(reset), .C(n2), .Y(n5) );
  CLKINVX1 U23 ( .A(state), .Y(n2) );
  CLKINVX1 U24 ( .A(reset), .Y(n4) );
endmodule


module busy_mod ( busy, clk, reset );
  input clk, reset;
  output busy;
  wire   recount_counter;
  wire   [14:0] count_out;

  counter_0 n1 ( .clk(clk), .reset(reset), .recount_counter(recount_counter), 
        .count_out(count_out) );
  busy_mod_little n2 ( .count_out(count_out), .busy(busy), .recount_counter(
        recount_counter), .clk(clk), .reset(reset) );
endmodule


module busy_accumulate ( busy, busy_accumulate_quantity, reset, clk );
  output [4:0] busy_accumulate_quantity;
  input busy, reset, clk;
  wire   N5, N6, N7, N8, N9, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         \add_10/carry[4] , \add_10/carry[3] , \add_10/carry[2] , n1, n2, n3;

  DFFQX1 \busy_accumulate_quantity_reg[4]  ( .D(n11), .CK(clk), .Q(
        busy_accumulate_quantity[4]) );
  DFFQX1 \busy_accumulate_quantity_reg[0]  ( .D(n12), .CK(clk), .Q(
        busy_accumulate_quantity[0]) );
  DFFQX1 \busy_accumulate_quantity_reg[1]  ( .D(n8), .CK(clk), .Q(
        busy_accumulate_quantity[1]) );
  DFFQX1 \busy_accumulate_quantity_reg[2]  ( .D(n9), .CK(clk), .Q(
        busy_accumulate_quantity[2]) );
  DFFQX1 \busy_accumulate_quantity_reg[3]  ( .D(n10), .CK(clk), .Q(
        busy_accumulate_quantity[3]) );
  CLKINVX1 U3 ( .A(n4), .Y(n1) );
  ADDHXL U4 ( .A(busy_accumulate_quantity[2]), .B(\add_10/carry[2] ), .CO(
        \add_10/carry[3] ), .S(N7) );
  ADDHXL U5 ( .A(busy_accumulate_quantity[1]), .B(busy_accumulate_quantity[0]), 
        .CO(\add_10/carry[2] ), .S(N6) );
  AO22X1 U6 ( .A0(busy_accumulate_quantity[4]), .A1(n2), .B0(N9), .B1(n1), .Y(
        n11) );
  AO22X1 U7 ( .A0(busy_accumulate_quantity[0]), .A1(n2), .B0(N5), .B1(n1), .Y(
        n12) );
  AO22X1 U8 ( .A0(busy_accumulate_quantity[3]), .A1(n2), .B0(N8), .B1(n1), .Y(
        n10) );
  AO22X1 U9 ( .A0(busy_accumulate_quantity[2]), .A1(n2), .B0(N7), .B1(n1), .Y(
        n9) );
  AO22X1 U10 ( .A0(busy_accumulate_quantity[1]), .A1(n2), .B0(N6), .B1(n1), 
        .Y(n8) );
  CLKINVX1 U11 ( .A(n5), .Y(n2) );
  OAI211X1 U12 ( .A0(n6), .A1(n7), .B0(n4), .C0(n3), .Y(n5) );
  NAND2X1 U13 ( .A(busy_accumulate_quantity[4]), .B(
        busy_accumulate_quantity[3]), .Y(n7) );
  NAND3X1 U14 ( .A(busy_accumulate_quantity[1]), .B(
        busy_accumulate_quantity[0]), .C(busy_accumulate_quantity[2]), .Y(n6)
         );
  ADDHXL U15 ( .A(busy_accumulate_quantity[3]), .B(\add_10/carry[3] ), .CO(
        \add_10/carry[4] ), .S(N8) );
  NAND2X1 U16 ( .A(busy), .B(n3), .Y(n4) );
  CLKINVX1 U17 ( .A(reset), .Y(n3) );
  CLKINVX1 U18 ( .A(busy_accumulate_quantity[0]), .Y(N5) );
  XOR2X1 U19 ( .A(\add_10/carry[4] ), .B(busy_accumulate_quantity[4]), .Y(N9)
         );
endmodule


module pixel_in_split ( pixel_in, busy, R, G, B, clk );
  input [23:0] pixel_in;
  output [7:0] R;
  output [7:0] G;
  output [7:0] B;
  input busy, clk;
  wire   n1;

  DFFTRX1 \B_reg[3]  ( .D(pixel_in[3]), .RN(n1), .CK(clk), .Q(B[3]) );
  DFFTRX1 \B_reg[7]  ( .D(pixel_in[7]), .RN(n1), .CK(clk), .Q(B[7]) );
  DFFTRX1 \B_reg[6]  ( .D(pixel_in[6]), .RN(n1), .CK(clk), .Q(B[6]) );
  DFFTRX1 \B_reg[2]  ( .D(pixel_in[2]), .RN(n1), .CK(clk), .Q(B[2]) );
  DFFTRX1 \B_reg[0]  ( .D(pixel_in[0]), .RN(n1), .CK(clk), .Q(B[0]) );
  DFFTRX1 \R_reg[1]  ( .D(pixel_in[17]), .RN(n1), .CK(clk), .Q(R[1]) );
  DFFTRX1 \R_reg[5]  ( .D(pixel_in[21]), .RN(n1), .CK(clk), .Q(R[5]) );
  DFFTRX1 \R_reg[4]  ( .D(pixel_in[20]), .RN(n1), .CK(clk), .Q(R[4]) );
  DFFTRX1 \R_reg[0]  ( .D(pixel_in[16]), .RN(n1), .CK(clk), .Q(R[0]) );
  DFFTRX1 \B_reg[4]  ( .D(pixel_in[4]), .RN(n1), .CK(clk), .Q(B[4]) );
  DFFTRX1 \B_reg[1]  ( .D(pixel_in[1]), .RN(n1), .CK(clk), .Q(B[1]) );
  DFFTRX1 \B_reg[5]  ( .D(pixel_in[5]), .RN(n1), .CK(clk), .Q(B[5]) );
  DFFTRX1 \R_reg[7]  ( .D(pixel_in[23]), .RN(n1), .CK(clk), .Q(R[7]) );
  DFFTRX1 \R_reg[6]  ( .D(pixel_in[22]), .RN(n1), .CK(clk), .Q(R[6]) );
  DFFTRX1 \R_reg[2]  ( .D(pixel_in[18]), .RN(n1), .CK(clk), .Q(R[2]) );
  DFFTRX1 \R_reg[3]  ( .D(pixel_in[19]), .RN(n1), .CK(clk), .Q(R[3]) );
  DFFTRX1 \G_reg[0]  ( .D(pixel_in[8]), .RN(n1), .CK(clk), .Q(G[0]) );
  DFFTRX1 \G_reg[1]  ( .D(pixel_in[9]), .RN(n1), .CK(clk), .Q(G[1]) );
  DFFTRX1 \G_reg[6]  ( .D(pixel_in[14]), .RN(n1), .CK(clk), .Q(G[6]) );
  DFFTRX1 \G_reg[4]  ( .D(pixel_in[12]), .RN(n1), .CK(clk), .Q(G[4]) );
  DFFTRX1 \G_reg[2]  ( .D(pixel_in[10]), .RN(n1), .CK(clk), .Q(G[2]) );
  DFFTRX1 \G_reg[3]  ( .D(pixel_in[11]), .RN(n1), .CK(clk), .Q(G[3]) );
  DFFTRX1 \G_reg[5]  ( .D(pixel_in[13]), .RN(n1), .CK(clk), .Q(G[5]) );
  DFFTRX1 \G_reg[7]  ( .D(pixel_in[15]), .RN(n1), .CK(clk), .Q(G[7]) );
  CLKINVX1 U3 ( .A(busy), .Y(n1) );
endmodule


module comparator_0 ( a, b, out_a, out_b );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out_a;
  output [7:0] out_b;
  wire   N1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  OAI22XL U1 ( .A0(n22), .A1(n18), .B0(n1), .B1(n29), .Y(out_a[3]) );
  OAI22XL U2 ( .A0(n22), .A1(n24), .B0(n1), .B1(n15), .Y(out_a[4]) );
  OAI22XL U3 ( .A0(n22), .A1(n23), .B0(n1), .B1(n16), .Y(out_a[5]) );
  OAI22XL U4 ( .A0(n20), .A1(n22), .B0(n1), .B1(n27), .Y(out_a[7]) );
  OAI22XL U5 ( .A0(n22), .A1(n19), .B0(n1), .B1(n28), .Y(out_a[6]) );
  OAI22XL U6 ( .A0(n22), .A1(n17), .B0(n1), .B1(n30), .Y(out_a[2]) );
  CLKINVX1 U7 ( .A(n1), .Y(n22) );
  OAI22XL U8 ( .A0(n22), .A1(n25), .B0(n1), .B1(n14), .Y(out_a[1]) );
  OAI22XL U9 ( .A0(n22), .A1(n26), .B0(n1), .B1(n31), .Y(out_a[0]) );
  OAI22XL U10 ( .A0(n22), .A1(n31), .B0(n1), .B1(n26), .Y(out_b[0]) );
  OAI22XL U11 ( .A0(n22), .A1(n14), .B0(n1), .B1(n25), .Y(out_b[1]) );
  OAI22XL U12 ( .A0(n22), .A1(n30), .B0(n1), .B1(n17), .Y(out_b[2]) );
  OAI22XL U13 ( .A0(n22), .A1(n29), .B0(n1), .B1(n18), .Y(out_b[3]) );
  OAI22XL U14 ( .A0(n22), .A1(n15), .B0(n1), .B1(n24), .Y(out_b[4]) );
  OAI22XL U15 ( .A0(n22), .A1(n16), .B0(n1), .B1(n23), .Y(out_b[5]) );
  OAI22XL U16 ( .A0(n22), .A1(n28), .B0(n1), .B1(n19), .Y(out_b[6]) );
  OAI22XL U17 ( .A0(n22), .A1(n27), .B0(n1), .B1(n20), .Y(out_b[7]) );
  CLKBUFX3 U18 ( .A(N1), .Y(n1) );
  OAI31XL U19 ( .A0(n13), .A1(n12), .A2(n11), .B0(n10), .Y(N1) );
  CLKINVX1 U20 ( .A(n7), .Y(n21) );
  CLKINVX1 U21 ( .A(b[5]), .Y(n16) );
  CLKINVX1 U22 ( .A(a[3]), .Y(n18) );
  CLKINVX1 U23 ( .A(b[4]), .Y(n15) );
  CLKINVX1 U24 ( .A(b[1]), .Y(n14) );
  CLKINVX1 U25 ( .A(a[2]), .Y(n17) );
  CLKINVX1 U26 ( .A(a[6]), .Y(n19) );
  CLKINVX1 U27 ( .A(a[7]), .Y(n20) );
  CLKINVX1 U28 ( .A(b[6]), .Y(n28) );
  CLKINVX1 U29 ( .A(b[7]), .Y(n27) );
  CLKINVX1 U30 ( .A(b[3]), .Y(n29) );
  CLKINVX1 U31 ( .A(b[2]), .Y(n30) );
  CLKINVX1 U32 ( .A(b[0]), .Y(n31) );
  CLKINVX1 U33 ( .A(a[0]), .Y(n26) );
  CLKINVX1 U34 ( .A(a[4]), .Y(n24) );
  CLKINVX1 U35 ( .A(a[5]), .Y(n23) );
  CLKINVX1 U36 ( .A(a[1]), .Y(n25) );
  NOR2BX1 U37 ( .AN(b[3]), .B(a[3]), .Y(n2) );
  AOI21X1 U38 ( .A0(b[2]), .A1(n17), .B0(n2), .Y(n3) );
  OAI32X1 U39 ( .A0(n17), .A1(b[2]), .A2(n2), .B0(b[3]), .B1(n18), .Y(n4) );
  NAND2BX1 U40 ( .AN(a[5]), .B(b[5]), .Y(n8) );
  OAI221XL U41 ( .A0(a[4]), .A1(n15), .B0(n3), .B1(n4), .C0(n8), .Y(n13) );
  AOI2BB1X1 U42 ( .A0N(n14), .A1N(a[1]), .B0(b[0]), .Y(n5) );
  AOI221XL U43 ( .A0(a[1]), .A1(n14), .B0(n5), .B1(a[0]), .C0(n4), .Y(n12) );
  AND2X1 U44 ( .A(b[7]), .B(n20), .Y(n6) );
  AO21X1 U45 ( .A0(n19), .A1(b[6]), .B0(n6), .Y(n11) );
  OAI32X1 U46 ( .A0(n19), .A1(b[6]), .A2(n6), .B0(b[7]), .B1(n20), .Y(n7) );
  AOI32X1 U47 ( .A0(a[4]), .A1(n15), .A2(n8), .B0(n16), .B1(a[5]), .Y(n9) );
  AO22X1 U48 ( .A0(n21), .A1(n9), .B0(n11), .B1(n21), .Y(n10) );
endmodule


module comparator_2 ( a, b, out_a, out_b );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out_a;
  output [7:0] out_b;
  wire   N1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  OAI22XL U1 ( .A0(n22), .A1(n14), .B0(n1), .B1(n26), .Y(out_a[2]) );
  OAI22XL U2 ( .A0(n22), .A1(n28), .B0(n1), .B1(n20), .Y(out_a[5]) );
  OAI22XL U3 ( .A0(n22), .A1(n16), .B0(n1), .B1(n24), .Y(out_a[6]) );
  OAI22XL U4 ( .A0(n17), .A1(n22), .B0(n1), .B1(n23), .Y(out_a[7]) );
  OAI22XL U5 ( .A0(n22), .A1(n15), .B0(n1), .B1(n25), .Y(out_a[3]) );
  OAI22XL U6 ( .A0(n22), .A1(n29), .B0(n1), .B1(n19), .Y(out_a[4]) );
  OAI22XL U7 ( .A0(n22), .A1(n30), .B0(n1), .B1(n18), .Y(out_a[1]) );
  OAI22XL U8 ( .A0(n22), .A1(n31), .B0(n1), .B1(n27), .Y(out_a[0]) );
  CLKINVX1 U9 ( .A(n1), .Y(n22) );
  OAI22XL U10 ( .A0(n22), .A1(n27), .B0(n1), .B1(n31), .Y(out_b[0]) );
  OAI22XL U11 ( .A0(n22), .A1(n18), .B0(n1), .B1(n30), .Y(out_b[1]) );
  OAI22XL U12 ( .A0(n22), .A1(n26), .B0(n1), .B1(n14), .Y(out_b[2]) );
  OAI22XL U13 ( .A0(n22), .A1(n25), .B0(n1), .B1(n15), .Y(out_b[3]) );
  OAI22XL U14 ( .A0(n22), .A1(n19), .B0(n1), .B1(n29), .Y(out_b[4]) );
  OAI22XL U15 ( .A0(n22), .A1(n20), .B0(n1), .B1(n28), .Y(out_b[5]) );
  OAI22XL U16 ( .A0(n22), .A1(n24), .B0(n1), .B1(n16), .Y(out_b[6]) );
  OAI22XL U17 ( .A0(n22), .A1(n23), .B0(n1), .B1(n17), .Y(out_b[7]) );
  CLKINVX1 U18 ( .A(a[3]), .Y(n15) );
  CLKBUFX3 U19 ( .A(N1), .Y(n1) );
  OAI31XL U20 ( .A0(n13), .A1(n12), .A2(n11), .B0(n10), .Y(N1) );
  CLKINVX1 U21 ( .A(n7), .Y(n21) );
  CLKINVX1 U22 ( .A(b[5]), .Y(n20) );
  CLKINVX1 U23 ( .A(a[2]), .Y(n14) );
  CLKINVX1 U24 ( .A(a[6]), .Y(n16) );
  CLKINVX1 U25 ( .A(a[7]), .Y(n17) );
  CLKINVX1 U26 ( .A(b[4]), .Y(n19) );
  CLKINVX1 U27 ( .A(b[1]), .Y(n18) );
  CLKINVX1 U28 ( .A(b[7]), .Y(n23) );
  CLKINVX1 U29 ( .A(a[5]), .Y(n28) );
  CLKINVX1 U30 ( .A(a[4]), .Y(n29) );
  CLKINVX1 U31 ( .A(a[1]), .Y(n30) );
  CLKINVX1 U32 ( .A(a[0]), .Y(n31) );
  CLKINVX1 U33 ( .A(b[0]), .Y(n27) );
  CLKINVX1 U34 ( .A(b[2]), .Y(n26) );
  CLKINVX1 U35 ( .A(b[6]), .Y(n24) );
  CLKINVX1 U36 ( .A(b[3]), .Y(n25) );
  NOR2BX1 U37 ( .AN(b[3]), .B(a[3]), .Y(n2) );
  AOI21X1 U38 ( .A0(b[2]), .A1(n14), .B0(n2), .Y(n3) );
  OAI32X1 U39 ( .A0(n14), .A1(b[2]), .A2(n2), .B0(b[3]), .B1(n15), .Y(n4) );
  NAND2BX1 U40 ( .AN(a[5]), .B(b[5]), .Y(n8) );
  OAI221XL U41 ( .A0(a[4]), .A1(n19), .B0(n3), .B1(n4), .C0(n8), .Y(n13) );
  AOI2BB1X1 U42 ( .A0N(n18), .A1N(a[1]), .B0(b[0]), .Y(n5) );
  AOI221XL U43 ( .A0(a[1]), .A1(n18), .B0(n5), .B1(a[0]), .C0(n4), .Y(n12) );
  AND2X1 U44 ( .A(b[7]), .B(n17), .Y(n6) );
  AO21X1 U45 ( .A0(n16), .A1(b[6]), .B0(n6), .Y(n11) );
  OAI32X1 U46 ( .A0(n16), .A1(b[6]), .A2(n6), .B0(b[7]), .B1(n17), .Y(n7) );
  AOI32X1 U47 ( .A0(a[4]), .A1(n19), .A2(n8), .B0(n20), .B1(a[5]), .Y(n9) );
  AO22X1 U48 ( .A0(n21), .A1(n9), .B0(n11), .B1(n21), .Y(n10) );
endmodule


module comparator_1 ( a, b, out_a, out_b );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out_a;
  output [7:0] out_b;
  wire   N1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;

  OAI22XL U1 ( .A0(n22), .A1(n15), .B0(n1), .B1(n25), .Y(out_a[3]) );
  OAI22XL U2 ( .A0(n17), .A1(n22), .B0(n1), .B1(n23), .Y(out_a[7]) );
  OAI22XL U3 ( .A0(n22), .A1(n16), .B0(n1), .B1(n24), .Y(out_a[6]) );
  OAI22XL U4 ( .A0(n22), .A1(n14), .B0(n1), .B1(n26), .Y(out_a[2]) );
  OAI22XL U5 ( .A0(n22), .A1(n31), .B0(n1), .B1(n27), .Y(out_a[0]) );
  OAI22XL U6 ( .A0(n22), .A1(n18), .B0(n1), .B1(n30), .Y(out_b[1]) );
  OAI22XL U7 ( .A0(n22), .A1(n20), .B0(n1), .B1(n28), .Y(out_b[5]) );
  OAI22XL U8 ( .A0(n22), .A1(n19), .B0(n1), .B1(n29), .Y(out_b[4]) );
  CLKINVX1 U9 ( .A(n1), .Y(n22) );
  OAI22XL U10 ( .A0(n22), .A1(n26), .B0(n1), .B1(n14), .Y(out_b[2]) );
  OAI22XL U11 ( .A0(n22), .A1(n29), .B0(n1), .B1(n19), .Y(out_a[4]) );
  OAI22XL U12 ( .A0(n22), .A1(n24), .B0(n1), .B1(n16), .Y(out_b[6]) );
  OAI22XL U13 ( .A0(n22), .A1(n28), .B0(n1), .B1(n20), .Y(out_a[5]) );
  OAI22XL U14 ( .A0(n22), .A1(n30), .B0(n1), .B1(n18), .Y(out_a[1]) );
  OAI22XL U15 ( .A0(n22), .A1(n23), .B0(n1), .B1(n17), .Y(out_b[7]) );
  OAI22XL U16 ( .A0(n22), .A1(n25), .B0(n1), .B1(n15), .Y(out_b[3]) );
  OAI22XL U17 ( .A0(n22), .A1(n27), .B0(n1), .B1(n31), .Y(out_b[0]) );
  CLKBUFX3 U18 ( .A(N1), .Y(n1) );
  OAI31XL U19 ( .A0(n13), .A1(n12), .A2(n11), .B0(n10), .Y(N1) );
  CLKINVX1 U20 ( .A(n7), .Y(n21) );
  CLKINVX1 U21 ( .A(b[5]), .Y(n20) );
  CLKINVX1 U22 ( .A(a[7]), .Y(n17) );
  CLKINVX1 U23 ( .A(a[3]), .Y(n15) );
  CLKINVX1 U24 ( .A(a[2]), .Y(n14) );
  CLKINVX1 U25 ( .A(b[4]), .Y(n19) );
  CLKINVX1 U26 ( .A(a[6]), .Y(n16) );
  CLKINVX1 U27 ( .A(b[1]), .Y(n18) );
  CLKINVX1 U28 ( .A(b[6]), .Y(n24) );
  CLKINVX1 U29 ( .A(b[7]), .Y(n23) );
  CLKINVX1 U30 ( .A(b[2]), .Y(n26) );
  CLKINVX1 U31 ( .A(a[4]), .Y(n29) );
  CLKINVX1 U32 ( .A(a[5]), .Y(n28) );
  CLKINVX1 U33 ( .A(b[3]), .Y(n25) );
  CLKINVX1 U34 ( .A(a[1]), .Y(n30) );
  CLKINVX1 U35 ( .A(b[0]), .Y(n27) );
  CLKINVX1 U36 ( .A(a[0]), .Y(n31) );
  NOR2BX1 U37 ( .AN(b[3]), .B(a[3]), .Y(n2) );
  AOI21X1 U38 ( .A0(b[2]), .A1(n14), .B0(n2), .Y(n3) );
  OAI32X1 U39 ( .A0(n14), .A1(b[2]), .A2(n2), .B0(b[3]), .B1(n15), .Y(n4) );
  NAND2BX1 U40 ( .AN(a[5]), .B(b[5]), .Y(n8) );
  OAI221XL U41 ( .A0(a[4]), .A1(n19), .B0(n3), .B1(n4), .C0(n8), .Y(n13) );
  AOI2BB1X1 U42 ( .A0N(n18), .A1N(a[1]), .B0(b[0]), .Y(n5) );
  AOI221XL U43 ( .A0(a[1]), .A1(n18), .B0(n5), .B1(a[0]), .C0(n4), .Y(n12) );
  AND2X1 U44 ( .A(b[7]), .B(n17), .Y(n6) );
  AO21X1 U45 ( .A0(n16), .A1(b[6]), .B0(n6), .Y(n11) );
  OAI32X1 U46 ( .A0(n16), .A1(b[6]), .A2(n6), .B0(b[7]), .B1(n17), .Y(n7) );
  AOI32X1 U47 ( .A0(a[4]), .A1(n19), .A2(n8), .B0(n20), .B1(a[5]), .Y(n9) );
  AO22X1 U48 ( .A0(n21), .A1(n9), .B0(n11), .B1(n21), .Y(n10) );
endmodule


module minicomparator ( a, b, out_b );
  input [7:0] a;
  input [7:0] b;
  output [7:0] out_b;
  wire   N1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22;

  OAI31XL U1 ( .A0(n12), .A1(n11), .A2(n10), .B0(n9), .Y(N1) );
  CLKINVX1 U2 ( .A(N1), .Y(n22) );
  CLKINVX1 U3 ( .A(n6), .Y(n21) );
  AO22X1 U4 ( .A0(a[5]), .A1(N1), .B0(b[5]), .B1(n22), .Y(out_b[5]) );
  AO22X1 U5 ( .A0(a[1]), .A1(N1), .B0(b[1]), .B1(n22), .Y(out_b[1]) );
  AO22X1 U6 ( .A0(a[4]), .A1(N1), .B0(b[4]), .B1(n22), .Y(out_b[4]) );
  AO22X1 U7 ( .A0(a[0]), .A1(N1), .B0(b[0]), .B1(n22), .Y(out_b[0]) );
  CLKINVX1 U8 ( .A(a[7]), .Y(n17) );
  CLKINVX1 U9 ( .A(a[3]), .Y(n15) );
  CLKINVX1 U10 ( .A(b[5]), .Y(n20) );
  CLKINVX1 U11 ( .A(a[0]), .Y(n13) );
  AO22X1 U12 ( .A0(a[2]), .A1(N1), .B0(b[2]), .B1(n22), .Y(out_b[2]) );
  AO22X1 U13 ( .A0(a[6]), .A1(N1), .B0(b[6]), .B1(n22), .Y(out_b[6]) );
  AO22X1 U14 ( .A0(a[7]), .A1(N1), .B0(b[7]), .B1(n22), .Y(out_b[7]) );
  AO22X1 U15 ( .A0(a[3]), .A1(N1), .B0(b[3]), .B1(n22), .Y(out_b[3]) );
  CLKINVX1 U16 ( .A(a[2]), .Y(n14) );
  CLKINVX1 U17 ( .A(b[4]), .Y(n19) );
  CLKINVX1 U18 ( .A(a[6]), .Y(n16) );
  CLKINVX1 U19 ( .A(b[1]), .Y(n18) );
  NOR2BX1 U20 ( .AN(b[3]), .B(a[3]), .Y(n1) );
  AOI21X1 U21 ( .A0(b[2]), .A1(n14), .B0(n1), .Y(n2) );
  OAI32X1 U22 ( .A0(n14), .A1(b[2]), .A2(n1), .B0(b[3]), .B1(n15), .Y(n4) );
  NAND2BX1 U23 ( .AN(a[5]), .B(b[5]), .Y(n7) );
  OAI221XL U24 ( .A0(a[4]), .A1(n19), .B0(n2), .B1(n4), .C0(n7), .Y(n12) );
  AOI2BB2X1 U25 ( .B0(b[0]), .B1(n13), .A0N(n18), .A1N(a[1]), .Y(n3) );
  AOI211X1 U26 ( .A0(a[1]), .A1(n18), .B0(n4), .C0(n3), .Y(n11) );
  AND2X1 U27 ( .A(b[7]), .B(n17), .Y(n5) );
  AO21X1 U28 ( .A0(n16), .A1(b[6]), .B0(n5), .Y(n10) );
  OAI32X1 U29 ( .A0(n16), .A1(b[6]), .A2(n5), .B0(b[7]), .B1(n17), .Y(n6) );
  AOI32X1 U30 ( .A0(a[4]), .A1(n19), .A2(n7), .B0(n20), .B1(a[5]), .Y(n8) );
  AO22X1 U31 ( .A0(n21), .A1(n8), .B0(n10), .B1(n21), .Y(n9) );
endmodule


module assign_rgb ( q, w, e, r, t, clk );
  input [7:0] q;
  input [7:0] w;
  input [7:0] e;
  input [7:0] r;
  output [1:0] t;
  input clk;
  wire   N5, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n1;

  DFFTRX1 \t_reg[1]  ( .D(n10), .RN(n1), .CK(clk), .Q(t[1]) );
  DFFQX1 \t_reg[0]  ( .D(N5), .CK(clk), .Q(t[0]) );
  CLKINVX1 U3 ( .A(n11), .Y(n1) );
  NOR2X1 U4 ( .A(n11), .B(n10), .Y(N5) );
  AND2X2 U5 ( .A(n22), .B(n23), .Y(n11) );
  NOR4X1 U6 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n22) );
  NOR4X1 U7 ( .A(n24), .B(n25), .C(n26), .D(n27), .Y(n23) );
  XOR2X1 U8 ( .A(w[7]), .B(q[7]), .Y(n28) );
  XOR2X1 U9 ( .A(w[0]), .B(q[0]), .Y(n27) );
  XOR2X1 U10 ( .A(w[4]), .B(q[4]), .Y(n31) );
  XOR2X1 U11 ( .A(w[1]), .B(q[1]), .Y(n26) );
  XOR2X1 U12 ( .A(w[5]), .B(q[5]), .Y(n30) );
  XOR2X1 U13 ( .A(q[4]), .B(e[4]), .Y(n21) );
  XOR2X1 U14 ( .A(q[0]), .B(e[0]), .Y(n17) );
  XOR2X1 U15 ( .A(q[5]), .B(e[5]), .Y(n20) );
  XOR2X1 U16 ( .A(q[7]), .B(e[7]), .Y(n18) );
  XOR2X1 U17 ( .A(q[1]), .B(e[1]), .Y(n16) );
  XOR2X1 U18 ( .A(q[2]), .B(e[2]), .Y(n15) );
  XOR2X1 U19 ( .A(q[6]), .B(e[6]), .Y(n19) );
  XOR2X1 U20 ( .A(w[3]), .B(q[3]), .Y(n24) );
  XOR2X1 U21 ( .A(w[2]), .B(q[2]), .Y(n25) );
  XOR2X1 U22 ( .A(w[6]), .B(q[6]), .Y(n29) );
  NAND2X1 U23 ( .A(n12), .B(n13), .Y(n10) );
  NOR4X1 U24 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n13) );
  NOR4X1 U25 ( .A(n18), .B(n19), .C(n20), .D(n21), .Y(n12) );
  XOR2X1 U26 ( .A(q[3]), .B(e[3]), .Y(n14) );
endmodule


module one_pixel_rgb ( R, G, B, pixel_color_index, clk );
  input [7:0] R;
  input [7:0] G;
  input [7:0] B;
  output [1:0] pixel_color_index;
  input clk;

  wire   [7:0] V1;
  wire   [7:0] V3;
  wire   [7:0] X;
  wire   [7:0] Y;
  wire   [7:0] K;

  comparator_0 M1 ( .a(R), .b(G), .out_a(V1) );
  comparator_2 M2 ( .a(G), .b(B), .out_a(V3) );
  comparator_1 M3 ( .a(V1), .b(V3), .out_a(X), .out_b(Y) );
  minicomparator M4 ( .a(X), .b(Y), .out_b(K) );
  assign_rgb M5 ( .q(K), .w(R), .e(G), .r(B), .t(pixel_color_index), .clk(clk)
         );
endmodule


module counter_1_DW01_inc_0 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;

  wire   [14:2] carry;

  ADDHXL U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  XOR2X1 U1 ( .A(carry[14]), .B(A[14]), .Y(SUM[14]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module counter_1 ( clk, reset, recount_counter, count_out );
  output [14:0] count_out;
  input clk, reset, recount_counter;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         n1;

  counter_1_DW01_inc_0 add_82 ( .A(count_out), .SUM({N17, N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  DFFTRX1 \count_out_reg[14]  ( .D(N17), .RN(n1), .CK(clk), .Q(count_out[14])
         );
  DFFTRX1 \count_out_reg[11]  ( .D(N14), .RN(n1), .CK(clk), .Q(count_out[11])
         );
  DFFTRX1 \count_out_reg[10]  ( .D(N13), .RN(n1), .CK(clk), .Q(count_out[10])
         );
  DFFTRX1 \count_out_reg[8]  ( .D(N11), .RN(n1), .CK(clk), .Q(count_out[8]) );
  DFFTRX1 \count_out_reg[7]  ( .D(N10), .RN(n1), .CK(clk), .Q(count_out[7]) );
  DFFTRX1 \count_out_reg[9]  ( .D(N12), .RN(n1), .CK(clk), .Q(count_out[9]) );
  DFFTRX1 \count_out_reg[5]  ( .D(N8), .RN(n1), .CK(clk), .Q(count_out[5]) );
  DFFTRX1 \count_out_reg[13]  ( .D(N16), .RN(n1), .CK(clk), .Q(count_out[13])
         );
  DFFTRX1 \count_out_reg[12]  ( .D(N15), .RN(n1), .CK(clk), .Q(count_out[12])
         );
  DFFTRX1 \count_out_reg[6]  ( .D(N9), .RN(n1), .CK(clk), .Q(count_out[6]) );
  DFFTRX1 \count_out_reg[0]  ( .D(N3), .RN(n1), .CK(clk), .Q(count_out[0]) );
  DFFTRX1 \count_out_reg[1]  ( .D(N4), .RN(n1), .CK(clk), .Q(count_out[1]) );
  DFFTRX1 \count_out_reg[4]  ( .D(N7), .RN(n1), .CK(clk), .Q(count_out[4]) );
  DFFTRX1 \count_out_reg[3]  ( .D(N6), .RN(n1), .CK(clk), .Q(count_out[3]) );
  DFFTRX1 \count_out_reg[2]  ( .D(N5), .RN(n1), .CK(clk), .Q(count_out[2]) );
  NOR2X1 U3 ( .A(reset), .B(recount_counter), .Y(n1) );
endmodule


module accumulate_intensity_DW01_add_0 ( A, B, CI, SUM, CO );
  input [21:0] A;
  input [21:0] B;
  output [21:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [21:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  OR2X1 U1 ( .A(n3), .B(n14), .Y(n1) );
  CLKINVX1 U2 ( .A(carry[8]), .Y(n15) );
  XNOR2X1 U3 ( .A(A[21]), .B(n1), .Y(SUM[21]) );
  CLKINVX1 U4 ( .A(A[20]), .Y(n14) );
  XNOR2X1 U5 ( .A(A[20]), .B(n3), .Y(SUM[20]) );
  XNOR2X1 U6 ( .A(A[19]), .B(n13), .Y(SUM[19]) );
  XNOR2X1 U7 ( .A(A[18]), .B(n12), .Y(SUM[18]) );
  XNOR2X1 U8 ( .A(A[17]), .B(n2), .Y(SUM[17]) );
  XNOR2X1 U9 ( .A(A[16]), .B(n11), .Y(SUM[16]) );
  XNOR2X1 U10 ( .A(A[15]), .B(n10), .Y(SUM[15]) );
  XNOR2X1 U11 ( .A(A[14]), .B(n9), .Y(SUM[14]) );
  NAND2BX1 U12 ( .AN(n11), .B(A[16]), .Y(n2) );
  NAND2BX1 U13 ( .AN(n13), .B(A[19]), .Y(n3) );
  NOR2X1 U14 ( .A(n16), .B(n17), .Y(carry[1]) );
  CLKINVX1 U15 ( .A(B[0]), .Y(n17) );
  CLKINVX1 U16 ( .A(A[0]), .Y(n16) );
  NAND2BX1 U17 ( .AN(n15), .B(A[8]), .Y(n4) );
  NAND2BX1 U18 ( .AN(n4), .B(A[9]), .Y(n5) );
  NAND2BX1 U19 ( .AN(n5), .B(A[10]), .Y(n6) );
  NAND2BX1 U20 ( .AN(n6), .B(A[11]), .Y(n7) );
  NAND2BX1 U21 ( .AN(n7), .B(A[12]), .Y(n8) );
  NAND2BX1 U22 ( .AN(n8), .B(A[13]), .Y(n9) );
  NAND2BX1 U23 ( .AN(n9), .B(A[14]), .Y(n10) );
  NAND2BX1 U24 ( .AN(n10), .B(A[15]), .Y(n11) );
  NAND2BX1 U25 ( .AN(n2), .B(A[17]), .Y(n12) );
  NAND2BX1 U26 ( .AN(n12), .B(A[18]), .Y(n13) );
  XNOR2X1 U27 ( .A(A[13]), .B(n8), .Y(SUM[13]) );
  XNOR2X1 U28 ( .A(A[12]), .B(n7), .Y(SUM[12]) );
  XNOR2X1 U29 ( .A(A[11]), .B(n6), .Y(SUM[11]) );
  XNOR2X1 U30 ( .A(A[10]), .B(n5), .Y(SUM[10]) );
  XNOR2X1 U31 ( .A(A[9]), .B(n4), .Y(SUM[9]) );
  XNOR2X1 U32 ( .A(A[8]), .B(n15), .Y(SUM[8]) );
  XNOR2X1 U33 ( .A(B[0]), .B(n16), .Y(SUM[0]) );
endmodule


module accumulate_intensity_DW01_add_1 ( A, B, CI, SUM, CO );
  input [21:0] A;
  input [21:0] B;
  output [21:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [21:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  OR2X1 U1 ( .A(n13), .B(n14), .Y(n1) );
  CLKINVX1 U2 ( .A(carry[8]), .Y(n15) );
  XNOR2X1 U3 ( .A(A[21]), .B(n1), .Y(SUM[21]) );
  CLKINVX1 U4 ( .A(A[20]), .Y(n14) );
  XNOR2X1 U5 ( .A(A[20]), .B(n13), .Y(SUM[20]) );
  XNOR2X1 U6 ( .A(A[19]), .B(n6), .Y(SUM[19]) );
  XNOR2X1 U7 ( .A(A[18]), .B(n12), .Y(SUM[18]) );
  XNOR2X1 U8 ( .A(A[17]), .B(n11), .Y(SUM[17]) );
  XNOR2X1 U9 ( .A(A[16]), .B(n5), .Y(SUM[16]) );
  XNOR2X1 U10 ( .A(A[15]), .B(n10), .Y(SUM[15]) );
  XNOR2X1 U11 ( .A(A[14]), .B(n4), .Y(SUM[14]) );
  NAND2BX1 U12 ( .AN(n15), .B(A[8]), .Y(n2) );
  NAND2BX1 U13 ( .AN(n7), .B(A[10]), .Y(n3) );
  NAND2BX1 U14 ( .AN(n9), .B(A[13]), .Y(n4) );
  NAND2BX1 U15 ( .AN(n10), .B(A[15]), .Y(n5) );
  NAND2BX1 U16 ( .AN(n12), .B(A[18]), .Y(n6) );
  NOR2X1 U17 ( .A(n16), .B(n17), .Y(carry[1]) );
  CLKINVX1 U18 ( .A(B[0]), .Y(n17) );
  CLKINVX1 U19 ( .A(A[0]), .Y(n16) );
  NAND2BX1 U20 ( .AN(n2), .B(A[9]), .Y(n7) );
  NAND2BX1 U21 ( .AN(n3), .B(A[11]), .Y(n8) );
  NAND2BX1 U22 ( .AN(n8), .B(A[12]), .Y(n9) );
  NAND2BX1 U23 ( .AN(n4), .B(A[14]), .Y(n10) );
  NAND2BX1 U24 ( .AN(n5), .B(A[16]), .Y(n11) );
  NAND2BX1 U25 ( .AN(n11), .B(A[17]), .Y(n12) );
  NAND2BX1 U26 ( .AN(n6), .B(A[19]), .Y(n13) );
  XNOR2X1 U27 ( .A(A[13]), .B(n9), .Y(SUM[13]) );
  XNOR2X1 U28 ( .A(A[12]), .B(n8), .Y(SUM[12]) );
  XNOR2X1 U29 ( .A(A[11]), .B(n3), .Y(SUM[11]) );
  XNOR2X1 U30 ( .A(A[10]), .B(n7), .Y(SUM[10]) );
  XNOR2X1 U31 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  XNOR2X1 U32 ( .A(A[8]), .B(n15), .Y(SUM[8]) );
  XNOR2X1 U33 ( .A(B[0]), .B(n16), .Y(SUM[0]) );
endmodule


module accumulate_intensity_DW01_add_2 ( A, B, CI, SUM, CO );
  input [21:0] A;
  input [21:0] B;
  output [21:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [21:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  OR2X1 U1 ( .A(n6), .B(n14), .Y(n1) );
  CLKINVX1 U2 ( .A(carry[8]), .Y(n15) );
  XNOR2X1 U3 ( .A(A[21]), .B(n1), .Y(SUM[21]) );
  CLKINVX1 U4 ( .A(A[20]), .Y(n14) );
  XNOR2X1 U5 ( .A(A[20]), .B(n6), .Y(SUM[20]) );
  XNOR2X1 U6 ( .A(A[19]), .B(n13), .Y(SUM[19]) );
  XNOR2X1 U7 ( .A(A[18]), .B(n12), .Y(SUM[18]) );
  XNOR2X1 U8 ( .A(A[17]), .B(n5), .Y(SUM[17]) );
  XNOR2X1 U9 ( .A(A[16]), .B(n11), .Y(SUM[16]) );
  XNOR2X1 U10 ( .A(A[15]), .B(n4), .Y(SUM[15]) );
  XNOR2X1 U11 ( .A(A[14]), .B(n10), .Y(SUM[14]) );
  NAND2BX1 U12 ( .AN(n7), .B(A[9]), .Y(n2) );
  NAND2BX1 U13 ( .AN(n8), .B(A[11]), .Y(n3) );
  NAND2BX1 U14 ( .AN(n10), .B(A[14]), .Y(n4) );
  NAND2BX1 U15 ( .AN(n11), .B(A[16]), .Y(n5) );
  NAND2BX1 U16 ( .AN(n13), .B(A[19]), .Y(n6) );
  NOR2X1 U17 ( .A(n16), .B(n17), .Y(carry[1]) );
  CLKINVX1 U18 ( .A(B[0]), .Y(n17) );
  CLKINVX1 U19 ( .A(A[0]), .Y(n16) );
  NAND2BX1 U20 ( .AN(n15), .B(A[8]), .Y(n7) );
  NAND2BX1 U21 ( .AN(n2), .B(A[10]), .Y(n8) );
  NAND2BX1 U22 ( .AN(n3), .B(A[12]), .Y(n9) );
  NAND2BX1 U23 ( .AN(n9), .B(A[13]), .Y(n10) );
  NAND2BX1 U24 ( .AN(n4), .B(A[15]), .Y(n11) );
  NAND2BX1 U25 ( .AN(n5), .B(A[17]), .Y(n12) );
  NAND2BX1 U26 ( .AN(n12), .B(A[18]), .Y(n13) );
  XNOR2X1 U27 ( .A(A[13]), .B(n9), .Y(SUM[13]) );
  XNOR2X1 U28 ( .A(A[12]), .B(n3), .Y(SUM[12]) );
  XNOR2X1 U29 ( .A(A[11]), .B(n8), .Y(SUM[11]) );
  XNOR2X1 U30 ( .A(A[10]), .B(n2), .Y(SUM[10]) );
  XNOR2X1 U31 ( .A(A[9]), .B(n7), .Y(SUM[9]) );
  XNOR2X1 U32 ( .A(A[8]), .B(n15), .Y(SUM[8]) );
  XNOR2X1 U33 ( .A(B[0]), .B(n16), .Y(SUM[0]) );
endmodule


module accumulate_intensity ( R, G, B, int1_2, int2_2, int3_2, clk, reset, 
        recount_counter, count_out );
  input [7:0] R;
  input [7:0] G;
  input [7:0] B;
  output [21:0] int1_2;
  output [21:0] int2_2;
  output [21:0] int3_2;
  input [14:0] count_out;
  input clk, reset;
  output recount_counter;
  wire   state, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34,
         N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48,
         N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62,
         N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, n9, n10, n11,
         n12, n13, n14, n15, n16, n4, n5, n6, n7, n8, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [21:0] int1;
  wire   [21:0] int2;
  wire   [21:0] int3;

  accumulate_intensity_DW01_add_0 add_80 ( .A(int3), .B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, B}), 
        .CI(1'b0), .SUM({N73, N72, N71, N70, N69, N68, N67, N66, N65, N64, N63, 
        N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52}) );
  accumulate_intensity_DW01_add_1 add_79 ( .A(int2), .B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, G}), 
        .CI(1'b0), .SUM({N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, 
        N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30}) );
  accumulate_intensity_DW01_add_2 add_78 ( .A(int1), .B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, R}), 
        .CI(1'b0), .SUM({N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, 
        N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8}) );
  EDFFTRX1 \int3_reg[21]  ( .RN(n26), .D(N73), .E(n21), .CK(clk), .Q(int3[21])
         );
  EDFFTRX1 \int1_reg[21]  ( .RN(n28), .D(N29), .E(n19), .CK(clk), .Q(int1[21])
         );
  EDFFTRX1 \int2_reg[21]  ( .RN(n30), .D(N51), .E(n17), .CK(clk), .Q(int2[21])
         );
  DFFQX1 recount_counter_reg ( .D(n16), .CK(clk), .Q(recount_counter) );
  EDFFTRX1 \int3_reg[13]  ( .RN(n26), .D(N65), .E(n22), .CK(clk), .Q(int3[13])
         );
  EDFFTRX1 \int3_reg[14]  ( .RN(n26), .D(N66), .E(n22), .CK(clk), .Q(int3[14])
         );
  EDFFTRX1 \int3_reg[15]  ( .RN(n26), .D(N67), .E(n22), .CK(clk), .Q(int3[15])
         );
  EDFFTRX1 \int3_reg[16]  ( .RN(n26), .D(N68), .E(n22), .CK(clk), .Q(int3[16])
         );
  EDFFTRX1 \int3_reg[17]  ( .RN(n26), .D(N69), .E(n22), .CK(clk), .Q(int3[17])
         );
  EDFFTRX1 \int3_reg[18]  ( .RN(n26), .D(N70), .E(n22), .CK(clk), .Q(int3[18])
         );
  EDFFTRX1 \int3_reg[19]  ( .RN(n26), .D(N71), .E(n22), .CK(clk), .Q(int3[19])
         );
  EDFFTRX1 \int3_reg[20]  ( .RN(n26), .D(N72), .E(n22), .CK(clk), .Q(int3[20])
         );
  EDFFTRX1 \int1_reg[13]  ( .RN(n28), .D(N21), .E(n20), .CK(clk), .Q(int1[13])
         );
  EDFFTRX1 \int1_reg[14]  ( .RN(n28), .D(N22), .E(n20), .CK(clk), .Q(int1[14])
         );
  EDFFTRX1 \int1_reg[15]  ( .RN(n28), .D(N23), .E(n20), .CK(clk), .Q(int1[15])
         );
  EDFFTRX1 \int1_reg[16]  ( .RN(n28), .D(N24), .E(n20), .CK(clk), .Q(int1[16])
         );
  EDFFTRX1 \int1_reg[17]  ( .RN(n28), .D(N25), .E(n19), .CK(clk), .Q(int1[17])
         );
  EDFFTRX1 \int1_reg[18]  ( .RN(n28), .D(N26), .E(n19), .CK(clk), .Q(int1[18])
         );
  EDFFTRX1 \int1_reg[19]  ( .RN(n28), .D(N27), .E(n19), .CK(clk), .Q(int1[19])
         );
  EDFFTRX1 \int1_reg[20]  ( .RN(n28), .D(N28), .E(n19), .CK(clk), .Q(int1[20])
         );
  EDFFTRX1 \int2_reg[13]  ( .RN(n30), .D(N43), .E(n17), .CK(clk), .Q(int2[13])
         );
  EDFFTRX1 \int2_reg[14]  ( .RN(n30), .D(N44), .E(n17), .CK(clk), .Q(int2[14])
         );
  EDFFTRX1 \int2_reg[15]  ( .RN(n30), .D(N45), .E(n17), .CK(clk), .Q(int2[15])
         );
  EDFFTRX1 \int2_reg[16]  ( .RN(n30), .D(N46), .E(n17), .CK(clk), .Q(int2[16])
         );
  EDFFTRX1 \int2_reg[17]  ( .RN(n30), .D(N47), .E(n17), .CK(clk), .Q(int2[17])
         );
  EDFFTRX1 \int2_reg[18]  ( .RN(n30), .D(N48), .E(n17), .CK(clk), .Q(int2[18])
         );
  EDFFTRX1 \int2_reg[19]  ( .RN(n30), .D(N49), .E(n17), .CK(clk), .Q(int2[19])
         );
  EDFFTRX1 \int2_reg[20]  ( .RN(n30), .D(N50), .E(n17), .CK(clk), .Q(int2[20])
         );
  DFFTRX1 state_reg ( .D(n25), .RN(n4), .CK(clk), .Q(state) );
  EDFFTRX1 \int3_reg[6]  ( .RN(n25), .D(N58), .E(n23), .CK(clk), .Q(int3[6])
         );
  EDFFTRX1 \int3_reg[7]  ( .RN(n25), .D(N59), .E(n23), .CK(clk), .Q(int3[7])
         );
  EDFFTRX1 \int1_reg[6]  ( .RN(n27), .D(N14), .E(n21), .CK(clk), .Q(int1[6])
         );
  EDFFTRX1 \int1_reg[7]  ( .RN(n27), .D(N15), .E(n21), .CK(clk), .Q(int1[7])
         );
  EDFFTRX1 \int2_reg[6]  ( .RN(n29), .D(N36), .E(n18), .CK(clk), .Q(int2[6])
         );
  EDFFTRX1 \int2_reg[7]  ( .RN(n29), .D(N37), .E(n18), .CK(clk), .Q(int2[7])
         );
  EDFFTRX1 \int3_reg[8]  ( .RN(n25), .D(N60), .E(n23), .CK(clk), .Q(int3[8])
         );
  EDFFTRX1 \int3_reg[9]  ( .RN(n25), .D(N61), .E(n23), .CK(clk), .Q(int3[9])
         );
  EDFFTRX1 \int3_reg[10]  ( .RN(n25), .D(N62), .E(n23), .CK(clk), .Q(int3[10])
         );
  EDFFTRX1 \int3_reg[11]  ( .RN(n26), .D(N63), .E(n23), .CK(clk), .Q(int3[11])
         );
  EDFFTRX1 \int3_reg[12]  ( .RN(n26), .D(N64), .E(n22), .CK(clk), .Q(int3[12])
         );
  EDFFTRX1 \int1_reg[8]  ( .RN(n27), .D(N16), .E(n20), .CK(clk), .Q(int1[8])
         );
  EDFFTRX1 \int1_reg[9]  ( .RN(n27), .D(N17), .E(n20), .CK(clk), .Q(int1[9])
         );
  EDFFTRX1 \int1_reg[10]  ( .RN(n27), .D(N18), .E(n20), .CK(clk), .Q(int1[10])
         );
  EDFFTRX1 \int1_reg[11]  ( .RN(n28), .D(N19), .E(n20), .CK(clk), .Q(int1[11])
         );
  EDFFTRX1 \int1_reg[12]  ( .RN(n28), .D(N20), .E(n20), .CK(clk), .Q(int1[12])
         );
  EDFFTRX1 \int2_reg[8]  ( .RN(n29), .D(N38), .E(n18), .CK(clk), .Q(int2[8])
         );
  EDFFTRX1 \int2_reg[9]  ( .RN(n29), .D(N39), .E(n18), .CK(clk), .Q(int2[9])
         );
  EDFFTRX1 \int2_reg[10]  ( .RN(n29), .D(N40), .E(n18), .CK(clk), .Q(int2[10])
         );
  EDFFTRX1 \int2_reg[11]  ( .RN(n30), .D(N41), .E(n18), .CK(clk), .Q(int2[11])
         );
  EDFFTRX1 \int2_reg[12]  ( .RN(n30), .D(N42), .E(n18), .CK(clk), .Q(int2[12])
         );
  EDFFTRX1 \int3_reg[1]  ( .RN(n25), .D(N53), .E(n23), .CK(clk), .Q(int3[1])
         );
  EDFFTRX1 \int3_reg[2]  ( .RN(n25), .D(N54), .E(n23), .CK(clk), .Q(int3[2])
         );
  EDFFTRX1 \int3_reg[3]  ( .RN(n25), .D(N55), .E(n23), .CK(clk), .Q(int3[3])
         );
  EDFFTRX1 \int3_reg[4]  ( .RN(n25), .D(N56), .E(n23), .CK(clk), .Q(int3[4])
         );
  EDFFTRX1 \int3_reg[5]  ( .RN(n25), .D(N57), .E(n23), .CK(clk), .Q(int3[5])
         );
  EDFFTRX1 \int1_reg[1]  ( .RN(n27), .D(N9), .E(n21), .CK(clk), .Q(int1[1]) );
  EDFFTRX1 \int1_reg[2]  ( .RN(n27), .D(N10), .E(n21), .CK(clk), .Q(int1[2])
         );
  EDFFTRX1 \int1_reg[3]  ( .RN(n27), .D(N11), .E(n21), .CK(clk), .Q(int1[3])
         );
  EDFFTRX1 \int1_reg[4]  ( .RN(n27), .D(N12), .E(n21), .CK(clk), .Q(int1[4])
         );
  EDFFTRX1 \int1_reg[5]  ( .RN(n27), .D(N13), .E(n21), .CK(clk), .Q(int1[5])
         );
  EDFFTRX1 \int2_reg[1]  ( .RN(n29), .D(N31), .E(n19), .CK(clk), .Q(int2[1])
         );
  EDFFTRX1 \int2_reg[2]  ( .RN(n29), .D(N32), .E(n19), .CK(clk), .Q(int2[2])
         );
  EDFFTRX1 \int2_reg[3]  ( .RN(n29), .D(N33), .E(n19), .CK(clk), .Q(int2[3])
         );
  EDFFTRX1 \int2_reg[4]  ( .RN(n29), .D(N34), .E(n18), .CK(clk), .Q(int2[4])
         );
  EDFFTRX1 \int2_reg[5]  ( .RN(n29), .D(N35), .E(n18), .CK(clk), .Q(int2[5])
         );
  EDFFTRX1 \int3_reg[0]  ( .RN(n25), .D(N52), .E(n23), .CK(clk), .Q(int3[0])
         );
  EDFFTRX1 \int1_reg[0]  ( .RN(n27), .D(N8), .E(n21), .CK(clk), .Q(int1[0]) );
  EDFFTRX1 \int2_reg[0]  ( .RN(n29), .D(N30), .E(n19), .CK(clk), .Q(int2[0])
         );
  EDFFTRX1 \int3_2_reg[1]  ( .RN(n25), .D(int3[1]), .E(n4), .CK(clk), .Q(
        int3_2[1]) );
  EDFFTRX1 \int3_2_reg[2]  ( .RN(n25), .D(int3[2]), .E(n11), .CK(clk), .Q(
        int3_2[2]) );
  EDFFTRX1 \int3_2_reg[3]  ( .RN(n25), .D(int3[3]), .E(n11), .CK(clk), .Q(
        int3_2[3]) );
  EDFFTRX1 \int3_2_reg[4]  ( .RN(n25), .D(int3[4]), .E(n11), .CK(clk), .Q(
        int3_2[4]) );
  EDFFTRX1 \int3_2_reg[5]  ( .RN(n25), .D(int3[5]), .E(n11), .CK(clk), .Q(
        int3_2[5]) );
  EDFFTRX1 \int3_2_reg[6]  ( .RN(n25), .D(int3[6]), .E(n11), .CK(clk), .Q(
        int3_2[6]) );
  EDFFTRX1 \int3_2_reg[7]  ( .RN(n25), .D(int3[7]), .E(n11), .CK(clk), .Q(
        int3_2[7]) );
  EDFFTRX1 \int3_2_reg[8]  ( .RN(n25), .D(int3[8]), .E(n11), .CK(clk), .Q(
        int3_2[8]) );
  EDFFTRX1 \int3_2_reg[9]  ( .RN(n25), .D(int3[9]), .E(n11), .CK(clk), .Q(
        int3_2[9]) );
  EDFFTRX1 \int3_2_reg[10]  ( .RN(n26), .D(int3[10]), .E(n4), .CK(clk), .Q(
        int3_2[10]) );
  EDFFTRX1 \int3_2_reg[11]  ( .RN(n26), .D(int3[11]), .E(n4), .CK(clk), .Q(
        int3_2[11]) );
  EDFFTRX1 \int3_2_reg[12]  ( .RN(n26), .D(int3[12]), .E(n4), .CK(clk), .Q(
        int3_2[12]) );
  EDFFTRX1 \int3_2_reg[13]  ( .RN(n26), .D(int3[13]), .E(n4), .CK(clk), .Q(
        int3_2[13]) );
  EDFFTRX1 \int3_2_reg[14]  ( .RN(n26), .D(int3[14]), .E(n4), .CK(clk), .Q(
        int3_2[14]) );
  EDFFTRX1 \int3_2_reg[15]  ( .RN(n26), .D(int3[15]), .E(n8), .CK(clk), .Q(
        int3_2[15]) );
  EDFFTRX1 \int3_2_reg[16]  ( .RN(n26), .D(int3[16]), .E(n8), .CK(clk), .Q(
        int3_2[16]) );
  EDFFTRX1 \int3_2_reg[17]  ( .RN(n26), .D(int3[17]), .E(n8), .CK(clk), .Q(
        int3_2[17]) );
  EDFFTRX1 \int3_2_reg[18]  ( .RN(n26), .D(int3[18]), .E(n8), .CK(clk), .Q(
        int3_2[18]) );
  EDFFTRX1 \int3_2_reg[19]  ( .RN(n26), .D(int3[19]), .E(n8), .CK(clk), .Q(
        int3_2[19]) );
  EDFFTRX1 \int3_2_reg[20]  ( .RN(n26), .D(int3[20]), .E(n8), .CK(clk), .Q(
        int3_2[20]) );
  EDFFTRX1 \int3_2_reg[21]  ( .RN(n27), .D(int3[21]), .E(n8), .CK(clk), .Q(
        int3_2[21]) );
  EDFFTRX1 \int3_2_reg[0]  ( .RN(n27), .D(int3[0]), .E(n8), .CK(clk), .Q(
        int3_2[0]) );
  EDFFTRX1 \int1_2_reg[1]  ( .RN(n27), .D(int1[1]), .E(n8), .CK(clk), .Q(
        int1_2[1]) );
  EDFFTRX1 \int1_2_reg[2]  ( .RN(n27), .D(int1[2]), .E(n8), .CK(clk), .Q(
        int1_2[2]) );
  EDFFTRX1 \int1_2_reg[3]  ( .RN(n27), .D(int1[3]), .E(n8), .CK(clk), .Q(
        int1_2[3]) );
  EDFFTRX1 \int1_2_reg[4]  ( .RN(n27), .D(int1[4]), .E(n8), .CK(clk), .Q(
        int1_2[4]) );
  EDFFTRX1 \int1_2_reg[5]  ( .RN(n27), .D(int1[5]), .E(n8), .CK(clk), .Q(
        int1_2[5]) );
  EDFFTRX1 \int1_2_reg[6]  ( .RN(n27), .D(int1[6]), .E(n7), .CK(clk), .Q(
        int1_2[6]) );
  EDFFTRX1 \int1_2_reg[7]  ( .RN(n27), .D(int1[7]), .E(n7), .CK(clk), .Q(
        int1_2[7]) );
  EDFFTRX1 \int1_2_reg[8]  ( .RN(n27), .D(int1[8]), .E(n7), .CK(clk), .Q(
        int1_2[8]) );
  EDFFTRX1 \int1_2_reg[9]  ( .RN(n27), .D(int1[9]), .E(n7), .CK(clk), .Q(
        int1_2[9]) );
  EDFFTRX1 \int1_2_reg[10]  ( .RN(n28), .D(int1[10]), .E(n7), .CK(clk), .Q(
        int1_2[10]) );
  EDFFTRX1 \int1_2_reg[11]  ( .RN(n28), .D(int1[11]), .E(n7), .CK(clk), .Q(
        int1_2[11]) );
  EDFFTRX1 \int1_2_reg[12]  ( .RN(n28), .D(int1[12]), .E(n7), .CK(clk), .Q(
        int1_2[12]) );
  EDFFTRX1 \int1_2_reg[13]  ( .RN(n28), .D(int1[13]), .E(n7), .CK(clk), .Q(
        int1_2[13]) );
  EDFFTRX1 \int1_2_reg[14]  ( .RN(n28), .D(int1[14]), .E(n7), .CK(clk), .Q(
        int1_2[14]) );
  EDFFTRX1 \int1_2_reg[15]  ( .RN(n28), .D(int1[15]), .E(n7), .CK(clk), .Q(
        int1_2[15]) );
  EDFFTRX1 \int1_2_reg[16]  ( .RN(n28), .D(int1[16]), .E(n7), .CK(clk), .Q(
        int1_2[16]) );
  EDFFTRX1 \int1_2_reg[17]  ( .RN(n28), .D(int1[17]), .E(n7), .CK(clk), .Q(
        int1_2[17]) );
  EDFFTRX1 \int1_2_reg[18]  ( .RN(n28), .D(int1[18]), .E(n7), .CK(clk), .Q(
        int1_2[18]) );
  EDFFTRX1 \int1_2_reg[19]  ( .RN(n28), .D(int1[19]), .E(n6), .CK(clk), .Q(
        int1_2[19]) );
  EDFFTRX1 \int1_2_reg[20]  ( .RN(n28), .D(int1[20]), .E(n6), .CK(clk), .Q(
        int1_2[20]) );
  EDFFTRX1 \int1_2_reg[21]  ( .RN(n29), .D(int1[21]), .E(n6), .CK(clk), .Q(
        int1_2[21]) );
  EDFFTRX1 \int1_2_reg[0]  ( .RN(n29), .D(int1[0]), .E(n6), .CK(clk), .Q(
        int1_2[0]) );
  EDFFTRX1 \int2_2_reg[1]  ( .RN(n29), .D(int2[1]), .E(n6), .CK(clk), .Q(
        int2_2[1]) );
  EDFFTRX1 \int2_2_reg[2]  ( .RN(n29), .D(int2[2]), .E(n6), .CK(clk), .Q(
        int2_2[2]) );
  EDFFTRX1 \int2_2_reg[3]  ( .RN(n29), .D(int2[3]), .E(n6), .CK(clk), .Q(
        int2_2[3]) );
  EDFFTRX1 \int2_2_reg[4]  ( .RN(n29), .D(int2[4]), .E(n6), .CK(clk), .Q(
        int2_2[4]) );
  EDFFTRX1 \int2_2_reg[5]  ( .RN(n29), .D(int2[5]), .E(n6), .CK(clk), .Q(
        int2_2[5]) );
  EDFFTRX1 \int2_2_reg[6]  ( .RN(n29), .D(int2[6]), .E(n6), .CK(clk), .Q(
        int2_2[6]) );
  EDFFTRX1 \int2_2_reg[7]  ( .RN(n29), .D(int2[7]), .E(n6), .CK(clk), .Q(
        int2_2[7]) );
  EDFFTRX1 \int2_2_reg[8]  ( .RN(n29), .D(int2[8]), .E(n6), .CK(clk), .Q(
        int2_2[8]) );
  EDFFTRX1 \int2_2_reg[9]  ( .RN(n29), .D(int2[9]), .E(n6), .CK(clk), .Q(
        int2_2[9]) );
  EDFFTRX1 \int2_2_reg[10]  ( .RN(n30), .D(int2[10]), .E(n5), .CK(clk), .Q(
        int2_2[10]) );
  EDFFTRX1 \int2_2_reg[11]  ( .RN(n30), .D(int2[11]), .E(n5), .CK(clk), .Q(
        int2_2[11]) );
  EDFFTRX1 \int2_2_reg[12]  ( .RN(n30), .D(int2[12]), .E(n5), .CK(clk), .Q(
        int2_2[12]) );
  EDFFTRX1 \int2_2_reg[13]  ( .RN(n30), .D(int2[13]), .E(n5), .CK(clk), .Q(
        int2_2[13]) );
  EDFFTRX1 \int2_2_reg[14]  ( .RN(n30), .D(int2[14]), .E(n5), .CK(clk), .Q(
        int2_2[14]) );
  EDFFTRX1 \int2_2_reg[15]  ( .RN(n30), .D(int2[15]), .E(n5), .CK(clk), .Q(
        int2_2[15]) );
  EDFFTRX1 \int2_2_reg[16]  ( .RN(n30), .D(int2[16]), .E(n5), .CK(clk), .Q(
        int2_2[16]) );
  EDFFTRX1 \int2_2_reg[17]  ( .RN(n30), .D(int2[17]), .E(n5), .CK(clk), .Q(
        int2_2[17]) );
  EDFFTRX1 \int2_2_reg[18]  ( .RN(n30), .D(int2[18]), .E(n5), .CK(clk), .Q(
        int2_2[18]) );
  EDFFTRX1 \int2_2_reg[19]  ( .RN(n30), .D(int2[19]), .E(n5), .CK(clk), .Q(
        int2_2[19]) );
  EDFFTRX1 \int2_2_reg[20]  ( .RN(n30), .D(int2[20]), .E(n5), .CK(clk), .Q(
        int2_2[20]) );
  EDFFTRX1 \int2_2_reg[21]  ( .RN(n31), .D(int2[21]), .E(n5), .CK(clk), .Q(
        int2_2[21]) );
  EDFFTRX1 \int2_2_reg[0]  ( .RN(n31), .D(int2[0]), .E(n5), .CK(clk), .Q(
        int2_2[0]) );
  NOR2X1 U3 ( .A(reset), .B(state), .Y(n10) );
  CLKINVX1 U4 ( .A(n22), .Y(n5) );
  CLKINVX1 U5 ( .A(n21), .Y(n6) );
  CLKINVX1 U6 ( .A(n20), .Y(n7) );
  CLKINVX1 U10 ( .A(n19), .Y(n8) );
  CLKBUFX3 U11 ( .A(n24), .Y(n18) );
  CLKBUFX3 U12 ( .A(n24), .Y(n19) );
  CLKBUFX3 U13 ( .A(n24), .Y(n20) );
  CLKBUFX3 U14 ( .A(n24), .Y(n21) );
  CLKBUFX3 U15 ( .A(n24), .Y(n22) );
  CLKBUFX3 U16 ( .A(n17), .Y(n23) );
  CLKBUFX3 U17 ( .A(n24), .Y(n17) );
  CLKINVX1 U18 ( .A(n4), .Y(n24) );
  CLKBUFX3 U19 ( .A(n10), .Y(n30) );
  CLKBUFX3 U20 ( .A(n10), .Y(n29) );
  CLKBUFX3 U21 ( .A(n10), .Y(n28) );
  CLKBUFX3 U22 ( .A(n10), .Y(n27) );
  CLKBUFX3 U23 ( .A(n10), .Y(n26) );
  CLKBUFX3 U24 ( .A(n10), .Y(n25) );
  CLKBUFX3 U25 ( .A(n10), .Y(n31) );
  NAND4BX1 U26 ( .AN(count_out[14]), .B(count_out[0]), .C(count_out[11]), .D(
        count_out[10]), .Y(n14) );
  NAND4X1 U27 ( .A(count_out[2]), .B(count_out[1]), .C(count_out[13]), .D(
        count_out[12]), .Y(n15) );
  CLKBUFX3 U28 ( .A(n11), .Y(n4) );
  NOR4X1 U29 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(n11) );
  NAND4X1 U30 ( .A(count_out[6]), .B(count_out[5]), .C(count_out[4]), .D(
        count_out[3]), .Y(n12) );
  NAND3X1 U31 ( .A(count_out[8]), .B(count_out[7]), .C(count_out[9]), .Y(n13)
         );
  OAI211X1 U32 ( .A0(state), .A1(n23), .B0(n32), .C0(n9), .Y(n16) );
  CLKINVX1 U33 ( .A(reset), .Y(n32) );
  NAND2X1 U34 ( .A(state), .B(recount_counter), .Y(n9) );
endmodule


module one_accumulate_intensity ( R, G, B, image_in_index, max_out_intensity, 
        clk, reset );
  input [7:0] R;
  input [7:0] G;
  input [7:0] B;
  input [4:0] image_in_index;
  output [28:0] max_out_intensity;
  input clk, reset;
  wire   recount_counter;
  wire   [14:0] count_out;
  wire   [21:0] int1_2;
  wire   [21:0] int2_2;
  wire   [21:0] int3_2;

  counter_1 F1 ( .clk(clk), .reset(reset), .recount_counter(recount_counter), 
        .count_out(count_out) );
  accumulate_intensity F2 ( .R(R), .G(G), .B(B), .int1_2(int1_2), .int2_2(
        int2_2), .int3_2(int3_2), .clk(clk), .reset(reset), .recount_counter(
        recount_counter), .count_out(count_out) );
  comparator2 F3 ( .p1(int1_2), .p2(int2_2), .p3(int3_2), .p4(
        max_out_intensity[28:7]) );
  assign_intensity_rgb F4 ( .p1(max_out_intensity[28:7]), .p2(int1_2), .p3(
        int2_2), .p4(int3_2), .p5(max_out_intensity[6:5]), .p6(clk) );
  CLKBUFX3 U1 ( .A(image_in_index[4]), .Y(max_out_intensity[4]) );
  CLKBUFX3 U2 ( .A(image_in_index[3]), .Y(max_out_intensity[3]) );
  CLKBUFX3 U3 ( .A(image_in_index[2]), .Y(max_out_intensity[2]) );
  CLKBUFX3 U4 ( .A(image_in_index[1]), .Y(max_out_intensity[1]) );
  CLKBUFX3 U5 ( .A(image_in_index[0]), .Y(max_out_intensity[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_1 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6;

  ADDFXL U2 ( .A(A[5]), .B(B[5]), .CI(n2), .CO(CO), .S(SUM[5]) );
  ADDFXL U3 ( .A(A[4]), .B(B[4]), .CI(n3), .CO(n2), .S(SUM[4]) );
  ADDFXL U4 ( .A(A[3]), .B(B[3]), .CI(n4), .CO(n3), .S(SUM[3]) );
  ADDFXL U5 ( .A(A[2]), .B(B[2]), .CI(n5), .CO(n4), .S(SUM[2]) );
  ADDFXL U6 ( .A(A[1]), .B(B[1]), .CI(n6), .CO(n5), .S(SUM[1]) );
  ADDFXL U7 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n6), .S(SUM[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_2 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7;

  ADDFXL U2 ( .A(A[6]), .B(B[6]), .CI(n2), .CO(CO), .S(SUM[6]) );
  ADDFXL U3 ( .A(A[5]), .B(B[5]), .CI(n3), .CO(n2), .S(SUM[5]) );
  ADDFXL U4 ( .A(A[4]), .B(B[4]), .CI(n4), .CO(n3), .S(SUM[4]) );
  ADDFXL U5 ( .A(A[3]), .B(B[3]), .CI(n5), .CO(n4), .S(SUM[3]) );
  ADDFXL U6 ( .A(A[2]), .B(B[2]), .CI(n6), .CO(n5), .S(SUM[2]) );
  ADDFXL U7 ( .A(A[1]), .B(B[1]), .CI(n7), .CO(n6), .S(SUM[1]) );
  ADDFXL U8 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n7), .S(SUM[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_3 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8;

  ADDFXL U2 ( .A(A[7]), .B(B[7]), .CI(n2), .CO(CO), .S(SUM[7]) );
  ADDFXL U3 ( .A(A[6]), .B(B[6]), .CI(n3), .CO(n2), .S(SUM[6]) );
  ADDFXL U4 ( .A(A[5]), .B(B[5]), .CI(n4), .CO(n3), .S(SUM[5]) );
  ADDFXL U5 ( .A(A[4]), .B(B[4]), .CI(n5), .CO(n4), .S(SUM[4]) );
  ADDFXL U6 ( .A(A[3]), .B(B[3]), .CI(n6), .CO(n5), .S(SUM[3]) );
  ADDFXL U7 ( .A(A[2]), .B(B[2]), .CI(n7), .CO(n6), .S(SUM[2]) );
  ADDFXL U8 ( .A(A[1]), .B(B[1]), .CI(n8), .CO(n7), .S(SUM[1]) );
  ADDFXL U9 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n8), .S(SUM[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_4 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;

  ADDFXL U2 ( .A(A[8]), .B(B[8]), .CI(n2), .CO(CO), .S(SUM[8]) );
  ADDFXL U3 ( .A(A[7]), .B(B[7]), .CI(n3), .CO(n2), .S(SUM[7]) );
  ADDFXL U4 ( .A(A[6]), .B(B[6]), .CI(n4), .CO(n3), .S(SUM[6]) );
  ADDFXL U5 ( .A(A[5]), .B(B[5]), .CI(n5), .CO(n4), .S(SUM[5]) );
  ADDFXL U6 ( .A(A[4]), .B(B[4]), .CI(n6), .CO(n5), .S(SUM[4]) );
  ADDFXL U7 ( .A(A[3]), .B(B[3]), .CI(n7), .CO(n6), .S(SUM[3]) );
  ADDFXL U8 ( .A(A[2]), .B(B[2]), .CI(n8), .CO(n7), .S(SUM[2]) );
  ADDFXL U9 ( .A(A[1]), .B(B[1]), .CI(n9), .CO(n8), .S(SUM[1]) );
  ADDFXL U10 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n9), .S(SUM[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_5 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10;

  ADDFXL U2 ( .A(A[9]), .B(B[9]), .CI(n2), .CO(CO), .S(SUM[9]) );
  ADDFXL U3 ( .A(A[8]), .B(B[8]), .CI(n3), .CO(n2), .S(SUM[8]) );
  ADDFXL U4 ( .A(A[7]), .B(B[7]), .CI(n4), .CO(n3), .S(SUM[7]) );
  ADDFXL U5 ( .A(A[6]), .B(B[6]), .CI(n5), .CO(n4), .S(SUM[6]) );
  ADDFXL U6 ( .A(A[5]), .B(B[5]), .CI(n6), .CO(n5), .S(SUM[5]) );
  ADDFXL U7 ( .A(A[4]), .B(B[4]), .CI(n7), .CO(n6), .S(SUM[4]) );
  ADDFXL U8 ( .A(A[3]), .B(B[3]), .CI(n8), .CO(n7), .S(SUM[3]) );
  ADDFXL U9 ( .A(A[2]), .B(B[2]), .CI(n9), .CO(n8), .S(SUM[2]) );
  ADDFXL U10 ( .A(A[1]), .B(B[1]), .CI(n10), .CO(n9), .S(SUM[1]) );
  ADDFXL U11 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n10), .S(SUM[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_6 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  ADDFXL U2 ( .A(A[10]), .B(B[10]), .CI(n2), .CO(CO), .S(SUM[10]) );
  ADDFXL U3 ( .A(A[9]), .B(B[9]), .CI(n3), .CO(n2), .S(SUM[9]) );
  ADDFXL U4 ( .A(A[8]), .B(B[8]), .CI(n4), .CO(n3), .S(SUM[8]) );
  ADDFXL U5 ( .A(A[7]), .B(B[7]), .CI(n5), .CO(n4), .S(SUM[7]) );
  ADDFXL U6 ( .A(A[6]), .B(B[6]), .CI(n6), .CO(n5), .S(SUM[6]) );
  ADDFXL U7 ( .A(A[5]), .B(B[5]), .CI(n7), .CO(n6), .S(SUM[5]) );
  ADDFXL U8 ( .A(A[4]), .B(B[4]), .CI(n8), .CO(n7), .S(SUM[4]) );
  ADDFXL U9 ( .A(A[3]), .B(B[3]), .CI(n9), .CO(n8), .S(SUM[3]) );
  ADDFXL U10 ( .A(A[2]), .B(B[2]), .CI(n10), .CO(n9), .S(SUM[2]) );
  ADDFXL U11 ( .A(A[1]), .B(B[1]), .CI(n11), .CO(n10), .S(SUM[1]) );
  ADDFXL U12 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n11), .S(SUM[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_7 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  ADDFXL U2 ( .A(A[11]), .B(B[11]), .CI(n2), .CO(CO), .S(SUM[11]) );
  ADDFXL U3 ( .A(A[10]), .B(B[10]), .CI(n3), .CO(n2), .S(SUM[10]) );
  ADDFXL U4 ( .A(A[9]), .B(B[9]), .CI(n4), .CO(n3), .S(SUM[9]) );
  ADDFXL U5 ( .A(A[8]), .B(B[8]), .CI(n5), .CO(n4), .S(SUM[8]) );
  ADDFXL U6 ( .A(A[7]), .B(B[7]), .CI(n6), .CO(n5), .S(SUM[7]) );
  ADDFXL U7 ( .A(A[6]), .B(B[6]), .CI(n7), .CO(n6), .S(SUM[6]) );
  ADDFXL U8 ( .A(A[5]), .B(B[5]), .CI(n8), .CO(n7), .S(SUM[5]) );
  ADDFXL U9 ( .A(A[4]), .B(B[4]), .CI(n9), .CO(n8), .S(SUM[4]) );
  ADDFXL U10 ( .A(A[3]), .B(B[3]), .CI(n10), .CO(n9), .S(SUM[3]) );
  ADDFXL U11 ( .A(A[2]), .B(B[2]), .CI(n11), .CO(n10), .S(SUM[2]) );
  ADDFXL U12 ( .A(A[1]), .B(B[1]), .CI(n12), .CO(n11), .S(SUM[1]) );
  ADDFXL U13 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n12), .S(SUM[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_8 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;

  ADDFXL U2 ( .A(A[12]), .B(B[12]), .CI(n2), .CO(CO), .S(SUM[12]) );
  ADDFXL U3 ( .A(A[11]), .B(B[11]), .CI(n3), .CO(n2), .S(SUM[11]) );
  ADDFXL U4 ( .A(A[10]), .B(B[10]), .CI(n4), .CO(n3), .S(SUM[10]) );
  ADDFXL U5 ( .A(A[9]), .B(B[9]), .CI(n5), .CO(n4), .S(SUM[9]) );
  ADDFXL U6 ( .A(A[8]), .B(B[8]), .CI(n6), .CO(n5), .S(SUM[8]) );
  ADDFXL U7 ( .A(A[7]), .B(B[7]), .CI(n7), .CO(n6), .S(SUM[7]) );
  ADDFXL U8 ( .A(A[6]), .B(B[6]), .CI(n8), .CO(n7), .S(SUM[6]) );
  ADDFXL U9 ( .A(A[5]), .B(B[5]), .CI(n9), .CO(n8), .S(SUM[5]) );
  ADDFXL U10 ( .A(A[4]), .B(B[4]), .CI(n10), .CO(n9), .S(SUM[4]) );
  ADDFXL U11 ( .A(A[3]), .B(B[3]), .CI(n11), .CO(n10), .S(SUM[3]) );
  ADDFXL U12 ( .A(A[2]), .B(B[2]), .CI(n12), .CO(n11), .S(SUM[2]) );
  ADDFXL U13 ( .A(A[1]), .B(B[1]), .CI(n13), .CO(n12), .S(SUM[1]) );
  ADDFXL U14 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n13), .S(SUM[0]) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_9 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  ADDFXL U3 ( .A(A[12]), .B(B[12]), .CI(n3), .CO(n2), .S(SUM[12]) );
  ADDFXL U4 ( .A(A[11]), .B(B[11]), .CI(n4), .CO(n3), .S(SUM[11]) );
  ADDFXL U5 ( .A(A[10]), .B(B[10]), .CI(n5), .CO(n4), .S(SUM[10]) );
  ADDFXL U6 ( .A(A[9]), .B(B[9]), .CI(n6), .CO(n5), .S(SUM[9]) );
  ADDFXL U7 ( .A(A[8]), .B(B[8]), .CI(n7), .CO(n6), .S(SUM[8]) );
  ADDFXL U8 ( .A(A[7]), .B(B[7]), .CI(n8), .CO(n7), .S(SUM[7]) );
  ADDFXL U9 ( .A(A[6]), .B(B[6]), .CI(n9), .CO(n8), .S(SUM[6]) );
  ADDFXL U10 ( .A(A[5]), .B(B[5]), .CI(n10), .CO(n9), .S(SUM[5]) );
  ADDFXL U11 ( .A(A[4]), .B(B[4]), .CI(n11), .CO(n10), .S(SUM[4]) );
  ADDFXL U12 ( .A(A[3]), .B(B[3]), .CI(n12), .CO(n11), .S(SUM[3]) );
  ADDFXL U13 ( .A(A[2]), .B(B[2]), .CI(n13), .CO(n12), .S(SUM[2]) );
  ADDFXL U14 ( .A(A[1]), .B(B[1]), .CI(n14), .CO(n13), .S(SUM[1]) );
  ADDFXL U15 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n14), .S(SUM[0]) );
  OR2X1 U19 ( .A(A[13]), .B(n2), .Y(CO) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_10 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  ADDFXL U3 ( .A(A[12]), .B(B[12]), .CI(n3), .CO(n2), .S(SUM[12]) );
  ADDFXL U4 ( .A(A[11]), .B(B[11]), .CI(n4), .CO(n3), .S(SUM[11]) );
  ADDFXL U5 ( .A(A[10]), .B(B[10]), .CI(n5), .CO(n4), .S(SUM[10]) );
  ADDFXL U6 ( .A(A[9]), .B(B[9]), .CI(n6), .CO(n5), .S(SUM[9]) );
  ADDFXL U7 ( .A(A[8]), .B(B[8]), .CI(n7), .CO(n6), .S(SUM[8]) );
  ADDFXL U8 ( .A(A[7]), .B(B[7]), .CI(n8), .CO(n7), .S(SUM[7]) );
  ADDFXL U9 ( .A(A[6]), .B(B[6]), .CI(n9), .CO(n8), .S(SUM[6]) );
  ADDFXL U10 ( .A(A[5]), .B(B[5]), .CI(n10), .CO(n9), .S(SUM[5]) );
  ADDFXL U11 ( .A(A[4]), .B(B[4]), .CI(n11), .CO(n10), .S(SUM[4]) );
  ADDFXL U12 ( .A(A[3]), .B(B[3]), .CI(n12), .CO(n11), .S(SUM[3]) );
  ADDFXL U13 ( .A(A[2]), .B(B[2]), .CI(n13), .CO(n12), .S(SUM[2]) );
  ADDFXL U14 ( .A(A[1]), .B(B[1]), .CI(n14), .CO(n13), .S(SUM[1]) );
  ADDFXL U15 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n14), .S(SUM[0]) );
  OR2X1 U19 ( .A(A[13]), .B(n2), .Y(CO) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_11 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  ADDFXL U3 ( .A(A[12]), .B(B[12]), .CI(n3), .CO(n2), .S(SUM[12]) );
  ADDFXL U4 ( .A(A[11]), .B(B[11]), .CI(n4), .CO(n3), .S(SUM[11]) );
  ADDFXL U5 ( .A(A[10]), .B(B[10]), .CI(n5), .CO(n4), .S(SUM[10]) );
  ADDFXL U6 ( .A(A[9]), .B(B[9]), .CI(n6), .CO(n5), .S(SUM[9]) );
  ADDFXL U7 ( .A(A[8]), .B(B[8]), .CI(n7), .CO(n6), .S(SUM[8]) );
  ADDFXL U8 ( .A(A[7]), .B(B[7]), .CI(n8), .CO(n7), .S(SUM[7]) );
  ADDFXL U9 ( .A(A[6]), .B(B[6]), .CI(n9), .CO(n8), .S(SUM[6]) );
  ADDFXL U10 ( .A(A[5]), .B(B[5]), .CI(n10), .CO(n9), .S(SUM[5]) );
  ADDFXL U11 ( .A(A[4]), .B(B[4]), .CI(n11), .CO(n10), .S(SUM[4]) );
  ADDFXL U12 ( .A(A[3]), .B(B[3]), .CI(n12), .CO(n11), .S(SUM[3]) );
  ADDFXL U13 ( .A(A[2]), .B(B[2]), .CI(n13), .CO(n12), .S(SUM[2]) );
  ADDFXL U14 ( .A(A[1]), .B(B[1]), .CI(n14), .CO(n13), .S(SUM[1]) );
  ADDFXL U15 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n14), .S(SUM[0]) );
  OR2X1 U19 ( .A(A[13]), .B(n2), .Y(CO) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_12 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  ADDFXL U3 ( .A(A[12]), .B(B[12]), .CI(n3), .CO(n2), .S(SUM[12]) );
  ADDFXL U4 ( .A(A[11]), .B(B[11]), .CI(n4), .CO(n3), .S(SUM[11]) );
  ADDFXL U5 ( .A(A[10]), .B(B[10]), .CI(n5), .CO(n4), .S(SUM[10]) );
  ADDFXL U6 ( .A(A[9]), .B(B[9]), .CI(n6), .CO(n5), .S(SUM[9]) );
  ADDFXL U7 ( .A(A[8]), .B(B[8]), .CI(n7), .CO(n6), .S(SUM[8]) );
  ADDFXL U8 ( .A(A[7]), .B(B[7]), .CI(n8), .CO(n7), .S(SUM[7]) );
  ADDFXL U9 ( .A(A[6]), .B(B[6]), .CI(n9), .CO(n8), .S(SUM[6]) );
  ADDFXL U10 ( .A(A[5]), .B(B[5]), .CI(n10), .CO(n9), .S(SUM[5]) );
  ADDFXL U11 ( .A(A[4]), .B(B[4]), .CI(n11), .CO(n10), .S(SUM[4]) );
  ADDFXL U12 ( .A(A[3]), .B(B[3]), .CI(n12), .CO(n11), .S(SUM[3]) );
  ADDFXL U13 ( .A(A[2]), .B(B[2]), .CI(n13), .CO(n12), .S(SUM[2]) );
  ADDFXL U14 ( .A(A[1]), .B(B[1]), .CI(n14), .CO(n13), .S(SUM[1]) );
  ADDFXL U15 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n14), .S(SUM[0]) );
  OR2X1 U19 ( .A(A[13]), .B(n2), .Y(CO) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_13 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  ADDFXL U3 ( .A(A[12]), .B(B[12]), .CI(n3), .CO(n2), .S(SUM[12]) );
  ADDFXL U4 ( .A(A[11]), .B(B[11]), .CI(n4), .CO(n3), .S(SUM[11]) );
  ADDFXL U5 ( .A(A[10]), .B(B[10]), .CI(n5), .CO(n4), .S(SUM[10]) );
  ADDFXL U6 ( .A(A[9]), .B(B[9]), .CI(n6), .CO(n5), .S(SUM[9]) );
  ADDFXL U7 ( .A(A[8]), .B(B[8]), .CI(n7), .CO(n6), .S(SUM[8]) );
  ADDFXL U8 ( .A(A[7]), .B(B[7]), .CI(n8), .CO(n7), .S(SUM[7]) );
  ADDFXL U9 ( .A(A[6]), .B(B[6]), .CI(n9), .CO(n8), .S(SUM[6]) );
  ADDFXL U10 ( .A(A[5]), .B(B[5]), .CI(n10), .CO(n9), .S(SUM[5]) );
  ADDFXL U11 ( .A(A[4]), .B(B[4]), .CI(n11), .CO(n10), .S(SUM[4]) );
  ADDFXL U12 ( .A(A[3]), .B(B[3]), .CI(n12), .CO(n11), .S(SUM[3]) );
  ADDFXL U13 ( .A(A[2]), .B(B[2]), .CI(n13), .CO(n12), .S(SUM[2]) );
  ADDFXL U14 ( .A(A[1]), .B(B[1]), .CI(n14), .CO(n13), .S(SUM[1]) );
  ADDFXL U15 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n14), .S(SUM[0]) );
  OR2X1 U19 ( .A(A[13]), .B(n2), .Y(CO) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_14 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  ADDFXL U3 ( .A(A[12]), .B(B[12]), .CI(n3), .CO(n2), .S(SUM[12]) );
  ADDFXL U4 ( .A(A[11]), .B(B[11]), .CI(n4), .CO(n3), .S(SUM[11]) );
  ADDFXL U5 ( .A(A[10]), .B(B[10]), .CI(n5), .CO(n4), .S(SUM[10]) );
  ADDFXL U6 ( .A(A[9]), .B(B[9]), .CI(n6), .CO(n5), .S(SUM[9]) );
  ADDFXL U7 ( .A(A[8]), .B(B[8]), .CI(n7), .CO(n6), .S(SUM[8]) );
  ADDFXL U8 ( .A(A[7]), .B(B[7]), .CI(n8), .CO(n7), .S(SUM[7]) );
  ADDFXL U9 ( .A(A[6]), .B(B[6]), .CI(n9), .CO(n8), .S(SUM[6]) );
  ADDFXL U10 ( .A(A[5]), .B(B[5]), .CI(n10), .CO(n9), .S(SUM[5]) );
  ADDFXL U11 ( .A(A[4]), .B(B[4]), .CI(n11), .CO(n10), .S(SUM[4]) );
  ADDFXL U12 ( .A(A[3]), .B(B[3]), .CI(n12), .CO(n11), .S(SUM[3]) );
  ADDFXL U13 ( .A(A[2]), .B(B[2]), .CI(n13), .CO(n12), .S(SUM[2]) );
  ADDFXL U14 ( .A(A[1]), .B(B[1]), .CI(n14), .CO(n13), .S(SUM[1]) );
  ADDFXL U15 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n14), .S(SUM[0]) );
  OR2X1 U19 ( .A(A[13]), .B(n2), .Y(CO) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_15 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  ADDFXL U3 ( .A(A[12]), .B(B[12]), .CI(n3), .CO(n2), .S(SUM[12]) );
  ADDFXL U4 ( .A(A[11]), .B(B[11]), .CI(n4), .CO(n3), .S(SUM[11]) );
  ADDFXL U5 ( .A(A[10]), .B(B[10]), .CI(n5), .CO(n4), .S(SUM[10]) );
  ADDFXL U6 ( .A(A[9]), .B(B[9]), .CI(n6), .CO(n5), .S(SUM[9]) );
  ADDFXL U7 ( .A(A[8]), .B(B[8]), .CI(n7), .CO(n6), .S(SUM[8]) );
  ADDFXL U8 ( .A(A[7]), .B(B[7]), .CI(n8), .CO(n7), .S(SUM[7]) );
  ADDFXL U9 ( .A(A[6]), .B(B[6]), .CI(n9), .CO(n8), .S(SUM[6]) );
  ADDFXL U10 ( .A(A[5]), .B(B[5]), .CI(n10), .CO(n9), .S(SUM[5]) );
  ADDFXL U11 ( .A(A[4]), .B(B[4]), .CI(n11), .CO(n10), .S(SUM[4]) );
  ADDFXL U12 ( .A(A[3]), .B(B[3]), .CI(n12), .CO(n11), .S(SUM[3]) );
  ADDFXL U13 ( .A(A[2]), .B(B[2]), .CI(n13), .CO(n12), .S(SUM[2]) );
  ADDFXL U14 ( .A(A[1]), .B(B[1]), .CI(n14), .CO(n13), .S(SUM[1]) );
  ADDFXL U15 ( .A(A[0]), .B(B[0]), .CI(CI), .CO(n14), .S(SUM[0]) );
  OR2X1 U19 ( .A(A[13]), .B(n2), .Y(CO) );
endmodule


module one_pic_avg_intensity_mod_DW01_add_16 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89;

  CLKINVX1 U20 ( .A(n89), .Y(n72) );
  CLKINVX1 U21 ( .A(n86), .Y(n69) );
  CLKINVX1 U22 ( .A(n83), .Y(n66) );
  CLKINVX1 U23 ( .A(B[10]), .Y(n75) );
  CLKINVX1 U24 ( .A(A[10]), .Y(n73) );
  CLKINVX1 U25 ( .A(A[12]), .Y(n74) );
  CLKINVX1 U26 ( .A(n87), .Y(n70) );
  CLKINVX1 U27 ( .A(n88), .Y(n71) );
  CLKINVX1 U28 ( .A(n84), .Y(n67) );
  CLKINVX1 U29 ( .A(n85), .Y(n68) );
  CLKINVX1 U30 ( .A(n81), .Y(n64) );
  CLKINVX1 U31 ( .A(n82), .Y(n65) );
  CLKINVX1 U32 ( .A(B[12]), .Y(n76) );
  OAI221XL U33 ( .A0(n77), .A1(n74), .B0(n76), .B1(n74), .C0(n78), .Y(CO) );
  AOI2BB1X1 U34 ( .A0N(n76), .A1N(n77), .B0(A[13]), .Y(n78) );
  AOI222XL U35 ( .A0(n79), .A1(A[11]), .B0(n79), .B1(B[11]), .C0(B[11]), .C1(
        A[11]), .Y(n77) );
  OAI222XL U36 ( .A0(n80), .A1(n73), .B0(n80), .B1(n75), .C0(n75), .C1(n73), 
        .Y(n79) );
  AOI222XL U37 ( .A0(n64), .A1(A[9]), .B0(n64), .B1(B[9]), .C0(B[9]), .C1(A[9]), .Y(n80) );
  AOI222XL U38 ( .A0(n65), .A1(A[8]), .B0(n65), .B1(B[8]), .C0(B[8]), .C1(A[8]), .Y(n81) );
  AOI222XL U39 ( .A0(n66), .A1(A[7]), .B0(n66), .B1(B[7]), .C0(B[7]), .C1(A[7]), .Y(n82) );
  AOI222XL U40 ( .A0(n67), .A1(A[6]), .B0(n67), .B1(B[6]), .C0(B[6]), .C1(A[6]), .Y(n83) );
  AOI222XL U41 ( .A0(n68), .A1(A[5]), .B0(n68), .B1(B[5]), .C0(B[5]), .C1(A[5]), .Y(n84) );
  AOI222XL U42 ( .A0(n69), .A1(A[4]), .B0(n69), .B1(B[4]), .C0(B[4]), .C1(A[4]), .Y(n85) );
  AOI222XL U43 ( .A0(n70), .A1(A[3]), .B0(n70), .B1(B[3]), .C0(B[3]), .C1(A[3]), .Y(n86) );
  AOI222XL U44 ( .A0(n71), .A1(A[2]), .B0(n71), .B1(B[2]), .C0(B[2]), .C1(A[2]), .Y(n87) );
  AOI222XL U45 ( .A0(n72), .A1(A[1]), .B0(n72), .B1(B[1]), .C0(B[1]), .C1(A[1]), .Y(n88) );
  AOI222XL U46 ( .A0(CI), .A1(A[0]), .B0(B[0]), .B1(CI), .C0(B[0]), .C1(A[0]), 
        .Y(n89) );
endmodule


module one_pic_avg_intensity_mod_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [28:0] a;
  input [13:0] b;
  output [28:0] quotient;
  output [13:0] remainder;
  output divide_by_0;
  wire   n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         \u_div/SumTmp[8][0] , \u_div/SumTmp[8][1] , \u_div/SumTmp[8][2] ,
         \u_div/SumTmp[8][3] , \u_div/SumTmp[8][4] , \u_div/SumTmp[8][5] ,
         \u_div/SumTmp[8][6] , \u_div/SumTmp[8][7] , \u_div/SumTmp[8][8] ,
         \u_div/SumTmp[8][9] , \u_div/SumTmp[8][10] , \u_div/SumTmp[8][11] ,
         \u_div/SumTmp[8][12] , \u_div/SumTmp[8][13] , \u_div/SumTmp[9][0] ,
         \u_div/SumTmp[9][1] , \u_div/SumTmp[9][2] , \u_div/SumTmp[9][3] ,
         \u_div/SumTmp[9][4] , \u_div/SumTmp[9][5] , \u_div/SumTmp[9][6] ,
         \u_div/SumTmp[9][7] , \u_div/SumTmp[9][8] , \u_div/SumTmp[9][9] ,
         \u_div/SumTmp[9][10] , \u_div/SumTmp[9][11] , \u_div/SumTmp[9][12] ,
         \u_div/SumTmp[9][13] , \u_div/SumTmp[10][0] , \u_div/SumTmp[10][1] ,
         \u_div/SumTmp[10][2] , \u_div/SumTmp[10][3] , \u_div/SumTmp[10][4] ,
         \u_div/SumTmp[10][5] , \u_div/SumTmp[10][6] , \u_div/SumTmp[10][7] ,
         \u_div/SumTmp[10][8] , \u_div/SumTmp[10][9] , \u_div/SumTmp[10][10] ,
         \u_div/SumTmp[10][11] , \u_div/SumTmp[10][12] ,
         \u_div/SumTmp[10][13] , \u_div/SumTmp[11][0] , \u_div/SumTmp[11][1] ,
         \u_div/SumTmp[11][2] , \u_div/SumTmp[11][3] , \u_div/SumTmp[11][4] ,
         \u_div/SumTmp[11][5] , \u_div/SumTmp[11][6] , \u_div/SumTmp[11][7] ,
         \u_div/SumTmp[11][8] , \u_div/SumTmp[11][9] , \u_div/SumTmp[11][10] ,
         \u_div/SumTmp[11][11] , \u_div/SumTmp[11][12] ,
         \u_div/SumTmp[11][13] , \u_div/SumTmp[12][0] , \u_div/SumTmp[12][1] ,
         \u_div/SumTmp[12][2] , \u_div/SumTmp[12][3] , \u_div/SumTmp[12][4] ,
         \u_div/SumTmp[12][5] , \u_div/SumTmp[12][6] , \u_div/SumTmp[12][7] ,
         \u_div/SumTmp[12][8] , \u_div/SumTmp[12][9] , \u_div/SumTmp[12][10] ,
         \u_div/SumTmp[12][11] , \u_div/SumTmp[12][12] ,
         \u_div/SumTmp[12][13] , \u_div/SumTmp[13][0] , \u_div/SumTmp[13][1] ,
         \u_div/SumTmp[13][2] , \u_div/SumTmp[13][3] , \u_div/SumTmp[13][4] ,
         \u_div/SumTmp[13][5] , \u_div/SumTmp[13][6] , \u_div/SumTmp[13][7] ,
         \u_div/SumTmp[13][8] , \u_div/SumTmp[13][9] , \u_div/SumTmp[13][10] ,
         \u_div/SumTmp[13][11] , \u_div/SumTmp[13][12] ,
         \u_div/SumTmp[13][13] , \u_div/SumTmp[14][0] , \u_div/SumTmp[14][1] ,
         \u_div/SumTmp[14][2] , \u_div/SumTmp[14][3] , \u_div/SumTmp[14][4] ,
         \u_div/SumTmp[14][5] , \u_div/SumTmp[14][6] , \u_div/SumTmp[14][7] ,
         \u_div/SumTmp[14][8] , \u_div/SumTmp[14][9] , \u_div/SumTmp[14][10] ,
         \u_div/SumTmp[14][11] , \u_div/SumTmp[14][12] ,
         \u_div/SumTmp[14][13] , \u_div/SumTmp[15][0] , \u_div/SumTmp[15][1] ,
         \u_div/SumTmp[15][2] , \u_div/SumTmp[15][3] , \u_div/SumTmp[15][4] ,
         \u_div/SumTmp[15][5] , \u_div/SumTmp[15][6] , \u_div/SumTmp[15][7] ,
         \u_div/SumTmp[15][8] , \u_div/SumTmp[15][9] , \u_div/SumTmp[15][10] ,
         \u_div/SumTmp[15][11] , \u_div/SumTmp[15][12] ,
         \u_div/SumTmp[15][13] , \u_div/SumTmp[16][0] , \u_div/SumTmp[16][1] ,
         \u_div/SumTmp[16][2] , \u_div/SumTmp[16][3] , \u_div/SumTmp[16][4] ,
         \u_div/SumTmp[16][5] , \u_div/SumTmp[16][6] , \u_div/SumTmp[16][7] ,
         \u_div/SumTmp[16][8] , \u_div/SumTmp[16][9] , \u_div/SumTmp[16][10] ,
         \u_div/SumTmp[16][11] , \u_div/SumTmp[16][12] , \u_div/SumTmp[17][0] ,
         \u_div/SumTmp[17][1] , \u_div/SumTmp[17][2] , \u_div/SumTmp[17][3] ,
         \u_div/SumTmp[17][4] , \u_div/SumTmp[17][5] , \u_div/SumTmp[17][6] ,
         \u_div/SumTmp[17][7] , \u_div/SumTmp[17][8] , \u_div/SumTmp[17][9] ,
         \u_div/SumTmp[17][10] , \u_div/SumTmp[17][11] , \u_div/SumTmp[18][0] ,
         \u_div/SumTmp[18][1] , \u_div/SumTmp[18][2] , \u_div/SumTmp[18][3] ,
         \u_div/SumTmp[18][4] , \u_div/SumTmp[18][5] , \u_div/SumTmp[18][6] ,
         \u_div/SumTmp[18][7] , \u_div/SumTmp[18][8] , \u_div/SumTmp[18][9] ,
         \u_div/SumTmp[18][10] , \u_div/SumTmp[19][0] , \u_div/SumTmp[19][1] ,
         \u_div/SumTmp[19][2] , \u_div/SumTmp[19][3] , \u_div/SumTmp[19][4] ,
         \u_div/SumTmp[19][5] , \u_div/SumTmp[19][6] , \u_div/SumTmp[19][7] ,
         \u_div/SumTmp[19][8] , \u_div/SumTmp[19][9] , \u_div/SumTmp[20][0] ,
         \u_div/SumTmp[20][1] , \u_div/SumTmp[20][2] , \u_div/SumTmp[20][3] ,
         \u_div/SumTmp[20][4] , \u_div/SumTmp[20][5] , \u_div/SumTmp[20][6] ,
         \u_div/SumTmp[20][7] , \u_div/SumTmp[20][8] , \u_div/SumTmp[21][0] ,
         \u_div/SumTmp[21][1] , \u_div/SumTmp[21][2] , \u_div/SumTmp[21][3] ,
         \u_div/SumTmp[21][4] , \u_div/SumTmp[21][5] , \u_div/SumTmp[21][6] ,
         \u_div/SumTmp[21][7] , \u_div/SumTmp[22][0] , \u_div/SumTmp[22][1] ,
         \u_div/SumTmp[22][2] , \u_div/SumTmp[22][3] , \u_div/SumTmp[22][4] ,
         \u_div/SumTmp[22][5] , \u_div/SumTmp[22][6] , \u_div/SumTmp[23][0] ,
         \u_div/SumTmp[23][1] , \u_div/SumTmp[23][2] , \u_div/SumTmp[23][3] ,
         \u_div/SumTmp[23][4] , \u_div/SumTmp[23][5] , \u_div/SumTmp[24][0] ,
         \u_div/SumTmp[24][1] , \u_div/SumTmp[24][2] , \u_div/SumTmp[24][3] ,
         \u_div/SumTmp[24][4] , \u_div/SumTmp[25][0] , \u_div/SumTmp[25][1] ,
         \u_div/SumTmp[25][2] , \u_div/SumTmp[25][3] , \u_div/SumTmp[26][0] ,
         \u_div/SumTmp[26][1] , \u_div/SumTmp[26][2] , \u_div/SumTmp[27][0] ,
         \u_div/SumTmp[27][1] , \u_div/SumTmp[28][0] , \u_div/CryTmp[7][1] ,
         \u_div/CryTmp[8][1] , \u_div/CryTmp[9][1] , \u_div/CryTmp[10][1] ,
         \u_div/CryTmp[11][1] , \u_div/CryTmp[12][1] , \u_div/CryTmp[13][1] ,
         \u_div/CryTmp[14][1] , \u_div/CryTmp[15][1] , \u_div/CryTmp[16][1] ,
         \u_div/CryTmp[16][13] , \u_div/CryTmp[17][1] , \u_div/CryTmp[17][12] ,
         \u_div/CryTmp[18][1] , \u_div/CryTmp[18][11] , \u_div/CryTmp[19][1] ,
         \u_div/CryTmp[19][10] , \u_div/CryTmp[20][1] , \u_div/CryTmp[20][9] ,
         \u_div/CryTmp[21][1] , \u_div/CryTmp[21][8] , \u_div/CryTmp[22][1] ,
         \u_div/CryTmp[22][7] , \u_div/CryTmp[23][1] , \u_div/CryTmp[23][6] ,
         \u_div/CryTmp[24][1] , \u_div/CryTmp[24][5] , \u_div/CryTmp[25][1] ,
         \u_div/CryTmp[26][1] , \u_div/CryTmp[27][1] , \u_div/PartRem[8][1] ,
         \u_div/PartRem[8][2] , \u_div/PartRem[8][3] , \u_div/PartRem[8][4] ,
         \u_div/PartRem[8][5] , \u_div/PartRem[8][6] , \u_div/PartRem[8][7] ,
         \u_div/PartRem[8][8] , \u_div/PartRem[8][9] , \u_div/PartRem[8][10] ,
         \u_div/PartRem[8][11] , \u_div/PartRem[8][12] ,
         \u_div/PartRem[8][13] , \u_div/PartRem[8][14] , \u_div/PartRem[9][1] ,
         \u_div/PartRem[9][2] , \u_div/PartRem[9][3] , \u_div/PartRem[9][4] ,
         \u_div/PartRem[9][5] , \u_div/PartRem[9][6] , \u_div/PartRem[9][7] ,
         \u_div/PartRem[9][8] , \u_div/PartRem[9][9] , \u_div/PartRem[9][10] ,
         \u_div/PartRem[9][11] , \u_div/PartRem[9][12] ,
         \u_div/PartRem[9][13] , \u_div/PartRem[9][14] ,
         \u_div/PartRem[10][1] , \u_div/PartRem[10][2] ,
         \u_div/PartRem[10][3] , \u_div/PartRem[10][4] ,
         \u_div/PartRem[10][5] , \u_div/PartRem[10][6] ,
         \u_div/PartRem[10][7] , \u_div/PartRem[10][8] ,
         \u_div/PartRem[10][9] , \u_div/PartRem[10][10] ,
         \u_div/PartRem[10][11] , \u_div/PartRem[10][12] ,
         \u_div/PartRem[10][13] , \u_div/PartRem[10][14] ,
         \u_div/PartRem[11][1] , \u_div/PartRem[11][2] ,
         \u_div/PartRem[11][3] , \u_div/PartRem[11][4] ,
         \u_div/PartRem[11][5] , \u_div/PartRem[11][6] ,
         \u_div/PartRem[11][7] , \u_div/PartRem[11][8] ,
         \u_div/PartRem[11][9] , \u_div/PartRem[11][10] ,
         \u_div/PartRem[11][11] , \u_div/PartRem[11][12] ,
         \u_div/PartRem[11][13] , \u_div/PartRem[11][14] ,
         \u_div/PartRem[12][1] , \u_div/PartRem[12][2] ,
         \u_div/PartRem[12][3] , \u_div/PartRem[12][4] ,
         \u_div/PartRem[12][5] , \u_div/PartRem[12][6] ,
         \u_div/PartRem[12][7] , \u_div/PartRem[12][8] ,
         \u_div/PartRem[12][9] , \u_div/PartRem[12][10] ,
         \u_div/PartRem[12][11] , \u_div/PartRem[12][12] ,
         \u_div/PartRem[12][13] , \u_div/PartRem[12][14] ,
         \u_div/PartRem[13][1] , \u_div/PartRem[13][2] ,
         \u_div/PartRem[13][3] , \u_div/PartRem[13][4] ,
         \u_div/PartRem[13][5] , \u_div/PartRem[13][6] ,
         \u_div/PartRem[13][7] , \u_div/PartRem[13][8] ,
         \u_div/PartRem[13][9] , \u_div/PartRem[13][10] ,
         \u_div/PartRem[13][11] , \u_div/PartRem[13][12] ,
         \u_div/PartRem[13][13] , \u_div/PartRem[13][14] ,
         \u_div/PartRem[14][1] , \u_div/PartRem[14][2] ,
         \u_div/PartRem[14][3] , \u_div/PartRem[14][4] ,
         \u_div/PartRem[14][5] , \u_div/PartRem[14][6] ,
         \u_div/PartRem[14][7] , \u_div/PartRem[14][8] ,
         \u_div/PartRem[14][9] , \u_div/PartRem[14][10] ,
         \u_div/PartRem[14][11] , \u_div/PartRem[14][12] ,
         \u_div/PartRem[14][13] , \u_div/PartRem[14][14] ,
         \u_div/PartRem[15][1] , \u_div/PartRem[15][2] ,
         \u_div/PartRem[15][3] , \u_div/PartRem[15][4] ,
         \u_div/PartRem[15][5] , \u_div/PartRem[15][6] ,
         \u_div/PartRem[15][7] , \u_div/PartRem[15][8] ,
         \u_div/PartRem[15][9] , \u_div/PartRem[15][10] ,
         \u_div/PartRem[15][11] , \u_div/PartRem[15][12] ,
         \u_div/PartRem[15][13] , \u_div/PartRem[15][14] ,
         \u_div/PartRem[16][1] , \u_div/PartRem[16][2] ,
         \u_div/PartRem[16][3] , \u_div/PartRem[16][4] ,
         \u_div/PartRem[16][5] , \u_div/PartRem[16][6] ,
         \u_div/PartRem[16][7] , \u_div/PartRem[16][8] ,
         \u_div/PartRem[16][9] , \u_div/PartRem[16][10] ,
         \u_div/PartRem[16][11] , \u_div/PartRem[16][12] ,
         \u_div/PartRem[16][13] , \u_div/PartRem[17][1] ,
         \u_div/PartRem[17][2] , \u_div/PartRem[17][3] ,
         \u_div/PartRem[17][4] , \u_div/PartRem[17][5] ,
         \u_div/PartRem[17][6] , \u_div/PartRem[17][7] ,
         \u_div/PartRem[17][8] , \u_div/PartRem[17][9] ,
         \u_div/PartRem[17][10] , \u_div/PartRem[17][11] ,
         \u_div/PartRem[17][12] , \u_div/PartRem[18][1] ,
         \u_div/PartRem[18][2] , \u_div/PartRem[18][3] ,
         \u_div/PartRem[18][4] , \u_div/PartRem[18][5] ,
         \u_div/PartRem[18][6] , \u_div/PartRem[18][7] ,
         \u_div/PartRem[18][8] , \u_div/PartRem[18][9] ,
         \u_div/PartRem[18][10] , \u_div/PartRem[18][11] ,
         \u_div/PartRem[19][1] , \u_div/PartRem[19][2] ,
         \u_div/PartRem[19][3] , \u_div/PartRem[19][4] ,
         \u_div/PartRem[19][5] , \u_div/PartRem[19][6] ,
         \u_div/PartRem[19][7] , \u_div/PartRem[19][8] ,
         \u_div/PartRem[19][9] , \u_div/PartRem[19][10] ,
         \u_div/PartRem[20][1] , \u_div/PartRem[20][2] ,
         \u_div/PartRem[20][3] , \u_div/PartRem[20][4] ,
         \u_div/PartRem[20][5] , \u_div/PartRem[20][6] ,
         \u_div/PartRem[20][7] , \u_div/PartRem[20][8] ,
         \u_div/PartRem[20][9] , \u_div/PartRem[21][1] ,
         \u_div/PartRem[21][2] , \u_div/PartRem[21][3] ,
         \u_div/PartRem[21][4] , \u_div/PartRem[21][5] ,
         \u_div/PartRem[21][6] , \u_div/PartRem[21][7] ,
         \u_div/PartRem[21][8] , \u_div/PartRem[22][1] ,
         \u_div/PartRem[22][2] , \u_div/PartRem[22][3] ,
         \u_div/PartRem[22][4] , \u_div/PartRem[22][5] ,
         \u_div/PartRem[22][6] , \u_div/PartRem[22][7] ,
         \u_div/PartRem[23][1] , \u_div/PartRem[23][2] ,
         \u_div/PartRem[23][3] , \u_div/PartRem[23][4] ,
         \u_div/PartRem[23][5] , \u_div/PartRem[23][6] ,
         \u_div/PartRem[24][1] , \u_div/PartRem[24][2] ,
         \u_div/PartRem[24][3] , \u_div/PartRem[24][4] ,
         \u_div/PartRem[24][5] , \u_div/PartRem[25][1] ,
         \u_div/PartRem[25][2] , \u_div/PartRem[25][3] ,
         \u_div/PartRem[25][4] , \u_div/PartRem[26][1] ,
         \u_div/PartRem[26][2] , \u_div/PartRem[26][3] ,
         \u_div/PartRem[27][1] , \u_div/PartRem[27][2] ,
         \u_div/PartRem[28][1] , \u_div/u_add_PartRem_1_23/n5 ,
         \u_div/u_add_PartRem_1_23/n4 , \u_div/u_add_PartRem_1_23/n3 ,
         \u_div/u_add_PartRem_1_23/n2 , n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77;
  wire   [13:0] \u_div/BInv ;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6;

  one_pic_avg_intensity_mod_DW01_add_1 \u_div/u_add_PartRem_1_22  ( .A({
        \u_div/PartRem[23][6] , \u_div/PartRem[23][5] , \u_div/PartRem[23][4] , 
        \u_div/PartRem[23][3] , \u_div/PartRem[23][2] , \u_div/PartRem[23][1] }), .B({\u_div/BInv [6:2], n42}), .CI(\u_div/CryTmp[22][1] ), .SUM({
        \u_div/SumTmp[22][6] , \u_div/SumTmp[22][5] , \u_div/SumTmp[22][4] , 
        \u_div/SumTmp[22][3] , \u_div/SumTmp[22][2] , \u_div/SumTmp[22][1] }), 
        .CO(\u_div/CryTmp[22][7] ) );
  one_pic_avg_intensity_mod_DW01_add_2 \u_div/u_add_PartRem_1_21  ( .A({
        \u_div/PartRem[22][7] , \u_div/PartRem[22][6] , \u_div/PartRem[22][5] , 
        \u_div/PartRem[22][4] , \u_div/PartRem[22][3] , \u_div/PartRem[22][2] , 
        \u_div/PartRem[22][1] }), .B({\u_div/BInv [7:2], n42}), .CI(
        \u_div/CryTmp[21][1] ), .SUM({\u_div/SumTmp[21][7] , 
        \u_div/SumTmp[21][6] , \u_div/SumTmp[21][5] , \u_div/SumTmp[21][4] , 
        \u_div/SumTmp[21][3] , \u_div/SumTmp[21][2] , \u_div/SumTmp[21][1] }), 
        .CO(\u_div/CryTmp[21][8] ) );
  one_pic_avg_intensity_mod_DW01_add_3 \u_div/u_add_PartRem_1_20  ( .A({
        \u_div/PartRem[21][8] , \u_div/PartRem[21][7] , \u_div/PartRem[21][6] , 
        \u_div/PartRem[21][5] , \u_div/PartRem[21][4] , \u_div/PartRem[21][3] , 
        \u_div/PartRem[21][2] , \u_div/PartRem[21][1] }), .B({n45, 
        \u_div/BInv [7:2], n42}), .CI(\u_div/CryTmp[20][1] ), .SUM({
        \u_div/SumTmp[20][8] , \u_div/SumTmp[20][7] , \u_div/SumTmp[20][6] , 
        \u_div/SumTmp[20][5] , \u_div/SumTmp[20][4] , \u_div/SumTmp[20][3] , 
        \u_div/SumTmp[20][2] , \u_div/SumTmp[20][1] }), .CO(
        \u_div/CryTmp[20][9] ) );
  one_pic_avg_intensity_mod_DW01_add_4 \u_div/u_add_PartRem_1_19  ( .A({
        \u_div/PartRem[20][9] , \u_div/PartRem[20][8] , \u_div/PartRem[20][7] , 
        \u_div/PartRem[20][6] , \u_div/PartRem[20][5] , \u_div/PartRem[20][4] , 
        \u_div/PartRem[20][3] , \u_div/PartRem[20][2] , \u_div/PartRem[20][1] }), .B({\u_div/BInv [9], n45, \u_div/BInv [7:2], n42}), .CI(
        \u_div/CryTmp[19][1] ), .SUM({\u_div/SumTmp[19][9] , 
        \u_div/SumTmp[19][8] , \u_div/SumTmp[19][7] , \u_div/SumTmp[19][6] , 
        \u_div/SumTmp[19][5] , \u_div/SumTmp[19][4] , \u_div/SumTmp[19][3] , 
        \u_div/SumTmp[19][2] , \u_div/SumTmp[19][1] }), .CO(
        \u_div/CryTmp[19][10] ) );
  one_pic_avg_intensity_mod_DW01_add_5 \u_div/u_add_PartRem_1_18  ( .A({
        \u_div/PartRem[19][10] , \u_div/PartRem[19][9] , 
        \u_div/PartRem[19][8] , \u_div/PartRem[19][7] , \u_div/PartRem[19][6] , 
        \u_div/PartRem[19][5] , \u_div/PartRem[19][4] , \u_div/PartRem[19][3] , 
        \u_div/PartRem[19][2] , \u_div/PartRem[19][1] }), .B({
        \u_div/BInv [10:9], n45, \u_div/BInv [7:2], n42}), .CI(
        \u_div/CryTmp[18][1] ), .SUM({\u_div/SumTmp[18][10] , 
        \u_div/SumTmp[18][9] , \u_div/SumTmp[18][8] , \u_div/SumTmp[18][7] , 
        \u_div/SumTmp[18][6] , \u_div/SumTmp[18][5] , \u_div/SumTmp[18][4] , 
        \u_div/SumTmp[18][3] , \u_div/SumTmp[18][2] , \u_div/SumTmp[18][1] }), 
        .CO(\u_div/CryTmp[18][11] ) );
  one_pic_avg_intensity_mod_DW01_add_6 \u_div/u_add_PartRem_1_17  ( .A({
        \u_div/PartRem[18][11] , \u_div/PartRem[18][10] , 
        \u_div/PartRem[18][9] , \u_div/PartRem[18][8] , \u_div/PartRem[18][7] , 
        \u_div/PartRem[18][6] , \u_div/PartRem[18][5] , \u_div/PartRem[18][4] , 
        \u_div/PartRem[18][3] , \u_div/PartRem[18][2] , \u_div/PartRem[18][1] }), .B({n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], n42}), .CI(
        \u_div/CryTmp[17][1] ), .SUM({\u_div/SumTmp[17][11] , 
        \u_div/SumTmp[17][10] , \u_div/SumTmp[17][9] , \u_div/SumTmp[17][8] , 
        \u_div/SumTmp[17][7] , \u_div/SumTmp[17][6] , \u_div/SumTmp[17][5] , 
        \u_div/SumTmp[17][4] , \u_div/SumTmp[17][3] , \u_div/SumTmp[17][2] , 
        \u_div/SumTmp[17][1] }), .CO(\u_div/CryTmp[17][12] ) );
  one_pic_avg_intensity_mod_DW01_add_7 \u_div/u_add_PartRem_1_16  ( .A({
        \u_div/PartRem[17][12] , \u_div/PartRem[17][11] , 
        \u_div/PartRem[17][10] , \u_div/PartRem[17][9] , 
        \u_div/PartRem[17][8] , \u_div/PartRem[17][7] , \u_div/PartRem[17][6] , 
        \u_div/PartRem[17][5] , \u_div/PartRem[17][4] , \u_div/PartRem[17][3] , 
        \u_div/PartRem[17][2] , \u_div/PartRem[17][1] }), .B({n50, n48, 
        \u_div/BInv [10:9], n45, \u_div/BInv [7:2], n42}), .CI(
        \u_div/CryTmp[16][1] ), .SUM({\u_div/SumTmp[16][12] , 
        \u_div/SumTmp[16][11] , \u_div/SumTmp[16][10] , \u_div/SumTmp[16][9] , 
        \u_div/SumTmp[16][8] , \u_div/SumTmp[16][7] , \u_div/SumTmp[16][6] , 
        \u_div/SumTmp[16][5] , \u_div/SumTmp[16][4] , \u_div/SumTmp[16][3] , 
        \u_div/SumTmp[16][2] , \u_div/SumTmp[16][1] }), .CO(
        \u_div/CryTmp[16][13] ) );
  one_pic_avg_intensity_mod_DW01_add_8 \u_div/u_add_PartRem_1_15  ( .A({
        \u_div/PartRem[16][13] , \u_div/PartRem[16][12] , 
        \u_div/PartRem[16][11] , \u_div/PartRem[16][10] , 
        \u_div/PartRem[16][9] , \u_div/PartRem[16][8] , \u_div/PartRem[16][7] , 
        \u_div/PartRem[16][6] , \u_div/PartRem[16][5] , \u_div/PartRem[16][4] , 
        \u_div/PartRem[16][3] , \u_div/PartRem[16][2] , \u_div/PartRem[16][1] }), .B({\u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[15][1] ), .SUM({\u_div/SumTmp[15][13] , 
        \u_div/SumTmp[15][12] , \u_div/SumTmp[15][11] , \u_div/SumTmp[15][10] , 
        \u_div/SumTmp[15][9] , \u_div/SumTmp[15][8] , \u_div/SumTmp[15][7] , 
        \u_div/SumTmp[15][6] , \u_div/SumTmp[15][5] , \u_div/SumTmp[15][4] , 
        \u_div/SumTmp[15][3] , \u_div/SumTmp[15][2] , \u_div/SumTmp[15][1] }), 
        .CO(n82) );
  one_pic_avg_intensity_mod_DW01_add_9 \u_div/u_add_PartRem_0_14  ( .A({
        \u_div/PartRem[15][14] , \u_div/PartRem[15][13] , 
        \u_div/PartRem[15][12] , \u_div/PartRem[15][11] , 
        \u_div/PartRem[15][10] , \u_div/PartRem[15][9] , 
        \u_div/PartRem[15][8] , \u_div/PartRem[15][7] , \u_div/PartRem[15][6] , 
        \u_div/PartRem[15][5] , \u_div/PartRem[15][4] , \u_div/PartRem[15][3] , 
        \u_div/PartRem[15][2] , \u_div/PartRem[15][1] }), .B({1'b1, 
        \u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[14][1] ), .SUM({SYNOPSYS_UNCONNECTED__0, 
        \u_div/SumTmp[14][13] , \u_div/SumTmp[14][12] , \u_div/SumTmp[14][11] , 
        \u_div/SumTmp[14][10] , \u_div/SumTmp[14][9] , \u_div/SumTmp[14][8] , 
        \u_div/SumTmp[14][7] , \u_div/SumTmp[14][6] , \u_div/SumTmp[14][5] , 
        \u_div/SumTmp[14][4] , \u_div/SumTmp[14][3] , \u_div/SumTmp[14][2] , 
        \u_div/SumTmp[14][1] }), .CO(n83) );
  one_pic_avg_intensity_mod_DW01_add_10 \u_div/u_add_PartRem_0_13  ( .A({
        \u_div/PartRem[14][14] , \u_div/PartRem[14][13] , 
        \u_div/PartRem[14][12] , \u_div/PartRem[14][11] , 
        \u_div/PartRem[14][10] , \u_div/PartRem[14][9] , 
        \u_div/PartRem[14][8] , \u_div/PartRem[14][7] , \u_div/PartRem[14][6] , 
        \u_div/PartRem[14][5] , \u_div/PartRem[14][4] , \u_div/PartRem[14][3] , 
        \u_div/PartRem[14][2] , \u_div/PartRem[14][1] }), .B({1'b1, 
        \u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[13][1] ), .SUM({SYNOPSYS_UNCONNECTED__1, 
        \u_div/SumTmp[13][13] , \u_div/SumTmp[13][12] , \u_div/SumTmp[13][11] , 
        \u_div/SumTmp[13][10] , \u_div/SumTmp[13][9] , \u_div/SumTmp[13][8] , 
        \u_div/SumTmp[13][7] , \u_div/SumTmp[13][6] , \u_div/SumTmp[13][5] , 
        \u_div/SumTmp[13][4] , \u_div/SumTmp[13][3] , \u_div/SumTmp[13][2] , 
        \u_div/SumTmp[13][1] }), .CO(n84) );
  one_pic_avg_intensity_mod_DW01_add_11 \u_div/u_add_PartRem_0_12  ( .A({
        \u_div/PartRem[13][14] , \u_div/PartRem[13][13] , 
        \u_div/PartRem[13][12] , \u_div/PartRem[13][11] , 
        \u_div/PartRem[13][10] , \u_div/PartRem[13][9] , 
        \u_div/PartRem[13][8] , \u_div/PartRem[13][7] , \u_div/PartRem[13][6] , 
        \u_div/PartRem[13][5] , \u_div/PartRem[13][4] , \u_div/PartRem[13][3] , 
        \u_div/PartRem[13][2] , \u_div/PartRem[13][1] }), .B({1'b1, 
        \u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[12][1] ), .SUM({SYNOPSYS_UNCONNECTED__2, 
        \u_div/SumTmp[12][13] , \u_div/SumTmp[12][12] , \u_div/SumTmp[12][11] , 
        \u_div/SumTmp[12][10] , \u_div/SumTmp[12][9] , \u_div/SumTmp[12][8] , 
        \u_div/SumTmp[12][7] , \u_div/SumTmp[12][6] , \u_div/SumTmp[12][5] , 
        \u_div/SumTmp[12][4] , \u_div/SumTmp[12][3] , \u_div/SumTmp[12][2] , 
        \u_div/SumTmp[12][1] }), .CO(n85) );
  one_pic_avg_intensity_mod_DW01_add_12 \u_div/u_add_PartRem_0_11  ( .A({
        \u_div/PartRem[12][14] , \u_div/PartRem[12][13] , 
        \u_div/PartRem[12][12] , \u_div/PartRem[12][11] , 
        \u_div/PartRem[12][10] , \u_div/PartRem[12][9] , 
        \u_div/PartRem[12][8] , \u_div/PartRem[12][7] , \u_div/PartRem[12][6] , 
        \u_div/PartRem[12][5] , \u_div/PartRem[12][4] , \u_div/PartRem[12][3] , 
        \u_div/PartRem[12][2] , \u_div/PartRem[12][1] }), .B({1'b1, 
        \u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[11][1] ), .SUM({SYNOPSYS_UNCONNECTED__3, 
        \u_div/SumTmp[11][13] , \u_div/SumTmp[11][12] , \u_div/SumTmp[11][11] , 
        \u_div/SumTmp[11][10] , \u_div/SumTmp[11][9] , \u_div/SumTmp[11][8] , 
        \u_div/SumTmp[11][7] , \u_div/SumTmp[11][6] , \u_div/SumTmp[11][5] , 
        \u_div/SumTmp[11][4] , \u_div/SumTmp[11][3] , \u_div/SumTmp[11][2] , 
        \u_div/SumTmp[11][1] }), .CO(n86) );
  one_pic_avg_intensity_mod_DW01_add_13 \u_div/u_add_PartRem_0_10  ( .A({
        \u_div/PartRem[11][14] , \u_div/PartRem[11][13] , 
        \u_div/PartRem[11][12] , \u_div/PartRem[11][11] , 
        \u_div/PartRem[11][10] , \u_div/PartRem[11][9] , 
        \u_div/PartRem[11][8] , \u_div/PartRem[11][7] , \u_div/PartRem[11][6] , 
        \u_div/PartRem[11][5] , \u_div/PartRem[11][4] , \u_div/PartRem[11][3] , 
        \u_div/PartRem[11][2] , \u_div/PartRem[11][1] }), .B({1'b1, 
        \u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[10][1] ), .SUM({SYNOPSYS_UNCONNECTED__4, 
        \u_div/SumTmp[10][13] , \u_div/SumTmp[10][12] , \u_div/SumTmp[10][11] , 
        \u_div/SumTmp[10][10] , \u_div/SumTmp[10][9] , \u_div/SumTmp[10][8] , 
        \u_div/SumTmp[10][7] , \u_div/SumTmp[10][6] , \u_div/SumTmp[10][5] , 
        \u_div/SumTmp[10][4] , \u_div/SumTmp[10][3] , \u_div/SumTmp[10][2] , 
        \u_div/SumTmp[10][1] }), .CO(n87) );
  one_pic_avg_intensity_mod_DW01_add_14 \u_div/u_add_PartRem_0_9  ( .A({
        \u_div/PartRem[10][14] , \u_div/PartRem[10][13] , 
        \u_div/PartRem[10][12] , \u_div/PartRem[10][11] , 
        \u_div/PartRem[10][10] , \u_div/PartRem[10][9] , 
        \u_div/PartRem[10][8] , \u_div/PartRem[10][7] , \u_div/PartRem[10][6] , 
        \u_div/PartRem[10][5] , \u_div/PartRem[10][4] , \u_div/PartRem[10][3] , 
        \u_div/PartRem[10][2] , \u_div/PartRem[10][1] }), .B({1'b1, 
        \u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[9][1] ), .SUM({SYNOPSYS_UNCONNECTED__5, 
        \u_div/SumTmp[9][13] , \u_div/SumTmp[9][12] , \u_div/SumTmp[9][11] , 
        \u_div/SumTmp[9][10] , \u_div/SumTmp[9][9] , \u_div/SumTmp[9][8] , 
        \u_div/SumTmp[9][7] , \u_div/SumTmp[9][6] , \u_div/SumTmp[9][5] , 
        \u_div/SumTmp[9][4] , \u_div/SumTmp[9][3] , \u_div/SumTmp[9][2] , 
        \u_div/SumTmp[9][1] }), .CO(n88) );
  one_pic_avg_intensity_mod_DW01_add_15 \u_div/u_add_PartRem_0_8  ( .A({
        \u_div/PartRem[9][14] , \u_div/PartRem[9][13] , \u_div/PartRem[9][12] , 
        \u_div/PartRem[9][11] , \u_div/PartRem[9][10] , \u_div/PartRem[9][9] , 
        \u_div/PartRem[9][8] , \u_div/PartRem[9][7] , \u_div/PartRem[9][6] , 
        \u_div/PartRem[9][5] , \u_div/PartRem[9][4] , \u_div/PartRem[9][3] , 
        \u_div/PartRem[9][2] , \u_div/PartRem[9][1] }), .B({1'b1, 
        \u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[8][1] ), .SUM({SYNOPSYS_UNCONNECTED__6, 
        \u_div/SumTmp[8][13] , \u_div/SumTmp[8][12] , \u_div/SumTmp[8][11] , 
        \u_div/SumTmp[8][10] , \u_div/SumTmp[8][9] , \u_div/SumTmp[8][8] , 
        \u_div/SumTmp[8][7] , \u_div/SumTmp[8][6] , \u_div/SumTmp[8][5] , 
        \u_div/SumTmp[8][4] , \u_div/SumTmp[8][3] , \u_div/SumTmp[8][2] , 
        \u_div/SumTmp[8][1] }), .CO(n89) );
  one_pic_avg_intensity_mod_DW01_add_16 \u_div/u_add_PartRem_0_7  ( .A({
        \u_div/PartRem[8][14] , \u_div/PartRem[8][13] , \u_div/PartRem[8][12] , 
        \u_div/PartRem[8][11] , \u_div/PartRem[8][10] , \u_div/PartRem[8][9] , 
        \u_div/PartRem[8][8] , \u_div/PartRem[8][7] , \u_div/PartRem[8][6] , 
        \u_div/PartRem[8][5] , \u_div/PartRem[8][4] , \u_div/PartRem[8][3] , 
        \u_div/PartRem[8][2] , \u_div/PartRem[8][1] }), .B({1'b1, 
        \u_div/BInv [13], n50, n48, \u_div/BInv [10:9], n45, \u_div/BInv [7:2], 
        n42}), .CI(\u_div/CryTmp[7][1] ), .CO(quotient[7]) );
  ADDFXL \u_div/u_add_PartRem_1_23/U6  ( .A(\u_div/PartRem[24][1] ), .B(n42), 
        .CI(\u_div/CryTmp[23][1] ), .CO(\u_div/u_add_PartRem_1_23/n5 ), .S(
        \u_div/SumTmp[23][1] ) );
  ADDFXL \u_div/u_add_PartRem_1_23/U5  ( .A(\u_div/PartRem[24][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/u_add_PartRem_1_23/n5 ), .CO(
        \u_div/u_add_PartRem_1_23/n4 ), .S(\u_div/SumTmp[23][2] ) );
  ADDFXL \u_div/u_add_PartRem_1_23/U4  ( .A(\u_div/PartRem[24][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/u_add_PartRem_1_23/n4 ), .CO(
        \u_div/u_add_PartRem_1_23/n3 ), .S(\u_div/SumTmp[23][3] ) );
  ADDFXL \u_div/u_add_PartRem_1_23/U3  ( .A(\u_div/PartRem[24][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/u_add_PartRem_1_23/n3 ), .CO(
        \u_div/u_add_PartRem_1_23/n2 ), .S(\u_div/SumTmp[23][4] ) );
  ADDFXL \u_div/u_add_PartRem_1_23/U2  ( .A(\u_div/PartRem[24][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/u_add_PartRem_1_23/n2 ), .CO(
        \u_div/CryTmp[23][6] ), .S(\u_div/SumTmp[23][5] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_0  ( .A(a[8]), .B(\u_div/SumTmp[8][0] ), 
        .S0(quotient[8]), .Y(\u_div/PartRem[8][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_0  ( .A(a[13]), .B(\u_div/SumTmp[13][0] ), 
        .S0(quotient[13]), .Y(\u_div/PartRem[13][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_0  ( .A(a[10]), .B(\u_div/SumTmp[10][0] ), 
        .S0(quotient[10]), .Y(\u_div/PartRem[10][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_0  ( .A(a[15]), .B(\u_div/SumTmp[15][0] ), 
        .S0(quotient[15]), .Y(\u_div/PartRem[15][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_0  ( .A(a[14]), .B(\u_div/SumTmp[14][0] ), 
        .S0(quotient[14]), .Y(\u_div/PartRem[14][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_0  ( .A(a[12]), .B(\u_div/SumTmp[12][0] ), 
        .S0(quotient[12]), .Y(\u_div/PartRem[12][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_0  ( .A(a[11]), .B(\u_div/SumTmp[11][0] ), 
        .S0(quotient[11]), .Y(\u_div/PartRem[11][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_0  ( .A(a[9]), .B(\u_div/SumTmp[9][0] ), 
        .S0(quotient[9]), .Y(\u_div/PartRem[9][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_0  ( .A(a[16]), .B(\u_div/SumTmp[16][0] ), 
        .S0(quotient[16]), .Y(\u_div/PartRem[16][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_0  ( .A(a[17]), .B(\u_div/SumTmp[17][0] ), 
        .S0(quotient[17]), .Y(\u_div/PartRem[17][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_0  ( .A(a[18]), .B(\u_div/SumTmp[18][0] ), 
        .S0(quotient[18]), .Y(\u_div/PartRem[18][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_0  ( .A(a[19]), .B(\u_div/SumTmp[19][0] ), 
        .S0(quotient[19]), .Y(\u_div/PartRem[19][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_0  ( .A(a[20]), .B(\u_div/SumTmp[20][0] ), 
        .S0(quotient[20]), .Y(\u_div/PartRem[20][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_21_0  ( .A(a[21]), .B(\u_div/SumTmp[21][0] ), 
        .S0(quotient[21]), .Y(\u_div/PartRem[21][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_24_4  ( .A(\u_div/PartRem[25][4] ), .B(
        \u_div/SumTmp[24][4] ), .S0(quotient[24]), .Y(\u_div/PartRem[24][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_24_0  ( .A(a[24]), .B(\u_div/SumTmp[24][0] ), 
        .S0(quotient[24]), .Y(\u_div/PartRem[24][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_28_0  ( .A(a[28]), .B(\u_div/SumTmp[28][0] ), 
        .S0(quotient[28]), .Y(\u_div/PartRem[28][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_25_0  ( .A(a[25]), .B(\u_div/SumTmp[25][0] ), 
        .S0(quotient[25]), .Y(\u_div/PartRem[25][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_26_0  ( .A(a[26]), .B(\u_div/SumTmp[26][0] ), 
        .S0(quotient[26]), .Y(\u_div/PartRem[26][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_23_0  ( .A(a[23]), .B(\u_div/SumTmp[23][0] ), 
        .S0(quotient[23]), .Y(\u_div/PartRem[23][1] ) );
  MX2XL \u_div/u_mx_PartRem_0_22_0  ( .A(a[22]), .B(\u_div/SumTmp[22][0] ), 
        .S0(quotient[22]), .Y(\u_div/PartRem[22][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_27_0  ( .A(a[27]), .B(\u_div/SumTmp[27][0] ), 
        .S0(quotient[27]), .Y(\u_div/PartRem[27][1] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_12  ( .A(\u_div/PartRem[17][12] ), .B(
        \u_div/SumTmp[16][12] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][13] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_11  ( .A(\u_div/PartRem[17][11] ), .B(
        \u_div/SumTmp[16][11] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][12] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_10  ( .A(\u_div/PartRem[17][10] ), .B(
        \u_div/SumTmp[16][10] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_9  ( .A(\u_div/PartRem[17][9] ), .B(
        \u_div/SumTmp[16][9] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_8  ( .A(\u_div/PartRem[17][8] ), .B(
        \u_div/SumTmp[16][8] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_7  ( .A(\u_div/PartRem[17][7] ), .B(
        \u_div/SumTmp[16][7] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_6  ( .A(\u_div/PartRem[17][6] ), .B(
        \u_div/SumTmp[16][6] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_5  ( .A(\u_div/PartRem[17][5] ), .B(
        \u_div/SumTmp[16][5] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_4  ( .A(\u_div/PartRem[17][4] ), .B(
        \u_div/SumTmp[16][4] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_1  ( .A(\u_div/PartRem[13][1] ), .B(
        \u_div/SumTmp[12][1] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_1  ( .A(\u_div/PartRem[10][1] ), .B(
        \u_div/SumTmp[9][1] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][2] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_3  ( .A(\u_div/PartRem[17][3] ), .B(
        \u_div/SumTmp[16][3] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_1  ( .A(\u_div/PartRem[15][1] ), .B(
        \u_div/SumTmp[14][1] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_1  ( .A(\u_div/PartRem[14][1] ), .B(
        \u_div/SumTmp[13][1] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_1  ( .A(\u_div/PartRem[12][1] ), .B(
        \u_div/SumTmp[11][1] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_1  ( .A(\u_div/PartRem[11][1] ), .B(
        \u_div/SumTmp[10][1] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_2  ( .A(\u_div/PartRem[17][2] ), .B(
        \u_div/SumTmp[16][2] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_1  ( .A(\u_div/PartRem[16][1] ), .B(
        \u_div/SumTmp[15][1] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_16_1  ( .A(\u_div/PartRem[17][1] ), .B(
        \u_div/SumTmp[16][1] ), .S0(quotient[16]), .Y(\u_div/PartRem[16][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_1  ( .A(\u_div/PartRem[18][1] ), .B(
        \u_div/SumTmp[17][1] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_1  ( .A(\u_div/PartRem[19][1] ), .B(
        \u_div/SumTmp[18][1] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_1  ( .A(\u_div/PartRem[20][1] ), .B(
        \u_div/SumTmp[19][1] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_21_1  ( .A(\u_div/PartRem[22][1] ), .B(
        \u_div/SumTmp[21][1] ), .S0(quotient[21]), .Y(\u_div/PartRem[21][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_1  ( .A(\u_div/PartRem[21][1] ), .B(
        \u_div/SumTmp[20][1] ), .S0(quotient[20]), .Y(\u_div/PartRem[20][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_24_3  ( .A(\u_div/PartRem[25][3] ), .B(
        \u_div/SumTmp[24][3] ), .S0(quotient[24]), .Y(\u_div/PartRem[24][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_24_2  ( .A(\u_div/PartRem[25][2] ), .B(
        \u_div/SumTmp[24][2] ), .S0(quotient[24]), .Y(\u_div/PartRem[24][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_24_1  ( .A(\u_div/PartRem[25][1] ), .B(
        \u_div/SumTmp[24][1] ), .S0(quotient[24]), .Y(\u_div/PartRem[24][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_25_2  ( .A(\u_div/PartRem[26][2] ), .B(
        \u_div/SumTmp[25][2] ), .S0(quotient[25]), .Y(\u_div/PartRem[25][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_25_1  ( .A(\u_div/PartRem[26][1] ), .B(
        \u_div/SumTmp[25][1] ), .S0(quotient[25]), .Y(\u_div/PartRem[25][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_26_2  ( .A(\u_div/PartRem[27][2] ), .B(
        \u_div/SumTmp[26][2] ), .S0(quotient[26]), .Y(\u_div/PartRem[26][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_26_1  ( .A(\u_div/PartRem[27][1] ), .B(
        \u_div/SumTmp[26][1] ), .S0(quotient[26]), .Y(\u_div/PartRem[26][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_23_5  ( .A(\u_div/PartRem[24][5] ), .B(
        \u_div/SumTmp[23][5] ), .S0(quotient[23]), .Y(\u_div/PartRem[23][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_23_1  ( .A(\u_div/PartRem[24][1] ), .B(
        \u_div/SumTmp[23][1] ), .S0(quotient[23]), .Y(\u_div/PartRem[23][2] )
         );
  MX2X1 \u_div/u_mx_PartRem_0_22_1  ( .A(\u_div/PartRem[23][1] ), .B(
        \u_div/SumTmp[22][1] ), .S0(quotient[22]), .Y(\u_div/PartRem[22][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_27_1  ( .A(\u_div/PartRem[28][1] ), .B(
        \u_div/SumTmp[27][1] ), .S0(quotient[27]), .Y(\u_div/PartRem[27][2] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_25_3  ( .A(\u_div/PartRem[26][3] ), .B(
        \u_div/SumTmp[25][3] ), .S0(quotient[25]), .Y(\u_div/PartRem[25][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_8  ( .A(\u_div/PartRem[9][8] ), .B(
        \u_div/SumTmp[8][8] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][9] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_5  ( .A(\u_div/PartRem[9][5] ), .B(
        \u_div/SumTmp[8][5] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][6] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_2  ( .A(\u_div/PartRem[9][2] ), .B(
        \u_div/SumTmp[8][2] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][3] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_7  ( .A(\u_div/PartRem[9][7] ), .B(
        \u_div/SumTmp[8][7] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][8] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_4  ( .A(\u_div/PartRem[9][4] ), .B(
        \u_div/SumTmp[8][4] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][5] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_1  ( .A(\u_div/PartRem[9][1] ), .B(
        \u_div/SumTmp[8][1] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][2] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_13  ( .A(\u_div/PartRem[9][13] ), .B(
        \u_div/SumTmp[8][13] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][14] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_11  ( .A(\u_div/PartRem[9][11] ), .B(
        \u_div/SumTmp[8][11] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][12] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_9  ( .A(\u_div/PartRem[9][9] ), .B(
        \u_div/SumTmp[8][9] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][10] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_6  ( .A(\u_div/PartRem[9][6] ), .B(
        \u_div/SumTmp[8][6] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][7] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_3  ( .A(\u_div/PartRem[9][3] ), .B(
        \u_div/SumTmp[8][3] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][4] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_12  ( .A(\u_div/PartRem[12][12] ), .B(
        \u_div/SumTmp[11][12] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][13] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_12  ( .A(\u_div/PartRem[11][12] ), .B(
        \u_div/SumTmp[10][12] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][13] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_12  ( .A(\u_div/PartRem[10][12] ), .B(
        \u_div/SumTmp[9][12] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][13] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_12  ( .A(\u_div/PartRem[16][12] ), .B(
        \u_div/SumTmp[15][12] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][13] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_12  ( .A(\u_div/PartRem[15][12] ), .B(
        \u_div/SumTmp[14][12] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][13] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_12  ( .A(\u_div/PartRem[14][12] ), .B(
        \u_div/SumTmp[13][12] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][13] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_12  ( .A(\u_div/PartRem[13][12] ), .B(
        \u_div/SumTmp[12][12] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][13] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_11  ( .A(\u_div/PartRem[13][11] ), .B(
        \u_div/SumTmp[12][11] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][12] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_11  ( .A(\u_div/PartRem[10][11] ), .B(
        \u_div/SumTmp[9][11] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][12] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_11  ( .A(\u_div/PartRem[12][11] ), .B(
        \u_div/SumTmp[11][11] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][12] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_11  ( .A(\u_div/PartRem[11][11] ), .B(
        \u_div/SumTmp[10][11] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][12] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_10  ( .A(\u_div/PartRem[10][10] ), .B(
        \u_div/SumTmp[9][10] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][11] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_11  ( .A(\u_div/PartRem[18][11] ), .B(
        \u_div/SumTmp[17][11] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][12] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_11  ( .A(\u_div/PartRem[16][11] ), .B(
        \u_div/SumTmp[15][11] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][12] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_11  ( .A(\u_div/PartRem[15][11] ), .B(
        \u_div/SumTmp[14][11] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][12] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_11  ( .A(\u_div/PartRem[14][11] ), .B(
        \u_div/SumTmp[13][11] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][12] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_10  ( .A(\u_div/PartRem[14][10] ), .B(
        \u_div/SumTmp[13][10] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_10  ( .A(\u_div/PartRem[11][10] ), .B(
        \u_div/SumTmp[10][10] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_9  ( .A(\u_div/PartRem[10][9] ), .B(
        \u_div/SumTmp[9][9] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][10] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_7  ( .A(\u_div/PartRem[10][7] ), .B(
        \u_div/SumTmp[9][7] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][8] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_10  ( .A(\u_div/PartRem[13][10] ), .B(
        \u_div/SumTmp[12][10] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_10  ( .A(\u_div/PartRem[12][10] ), .B(
        \u_div/SumTmp[11][10] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_9  ( .A(\u_div/PartRem[11][9] ), .B(
        \u_div/SumTmp[10][9] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_8  ( .A(\u_div/PartRem[10][8] ), .B(
        \u_div/SumTmp[9][8] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][9] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_10  ( .A(\u_div/PartRem[19][10] ), .B(
        \u_div/SumTmp[18][10] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_10  ( .A(\u_div/PartRem[18][10] ), .B(
        \u_div/SumTmp[17][10] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_10  ( .A(\u_div/PartRem[16][10] ), .B(
        \u_div/SumTmp[15][10] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_10  ( .A(\u_div/PartRem[15][10] ), .B(
        \u_div/SumTmp[14][10] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][11] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_9  ( .A(\u_div/PartRem[15][9] ), .B(
        \u_div/SumTmp[14][9] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_9  ( .A(\u_div/PartRem[12][9] ), .B(
        \u_div/SumTmp[11][9] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_8  ( .A(\u_div/PartRem[11][8] ), .B(
        \u_div/SumTmp[10][8] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_9  ( .A(\u_div/PartRem[14][9] ), .B(
        \u_div/SumTmp[13][9] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_9  ( .A(\u_div/PartRem[13][9] ), .B(
        \u_div/SumTmp[12][9] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_8  ( .A(\u_div/PartRem[12][8] ), .B(
        \u_div/SumTmp[11][8] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_7  ( .A(\u_div/PartRem[11][7] ), .y 
        \u_div/SumTmp[10][7] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_6  ( .A(\u_div/PartRem[10][6] ), .B(
        \u_div/SumTmp[9][6] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][7] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_9  ( .A(\u_div/PartRem[20][9] ), .B(
        \u_div/SumTmp[19][9] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_9  ( .A(\u_div/PartRem[19][9] ), .B(
        \u_div/SumTmp[18][9] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_9  ( .A(\u_div/PartRem[18][9] ), .B(
        \u_div/SumTmp[17][9] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_9  ( .A(\u_div/PartRem[16][9] ), .B(
        \u_div/SumTmp[15][9] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][10] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_8  ( .A(\u_div/PartRem[16][8] ), .B(
        \u_div/SumTmp[15][8] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_8  ( .A(\u_div/PartRem[13][8] ), .B(
        \u_div/SumTmp[12][8] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_7  ( .A(\u_div/PartRem[12][7] ), .B(
        \u_div/SumTmp[11][7] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_6  ( .A(\u_div/PartRem[11][6] ), .B(
        \u_div/SumTmp[10][6] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_8  ( .A(\u_div/PartRem[15][8] ), .B(
        \u_div/SumTmp[14][8] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_8  ( .A(\u_div/PartRem[14][8] ), .B(
        \u_div/SumTmp[13][8] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_7  ( .A(\u_div/PartRem[13][7] ), .B(
        \u_div/SumTmp[12][7] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_6  ( .A(\u_div/PartRem[12][6] ), .B(
        \u_div/SumTmp[11][6] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_5  ( .A(\u_div/PartRem[11][5] ), .B(
        \u_div/SumTmp[10][5] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_5  ( .A(\u_div/PartRem[10][5] ), .B(
        \u_div/SumTmp[9][5] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][6] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_8  ( .A(\u_div/PartRem[21][8] ), .B(
        \u_div/SumTmp[20][8] ), .S0(quotient[20]), .Y(\u_div/PartRem[20][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_8  ( .A(\u_div/PartRem[20][8] ), .B(
        \u_div/SumTmp[19][8] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_8  ( .A(\u_div/PartRem[19][8] ), .B(
        \u_div/SumTmp[18][8] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_8  ( .A(\u_div/PartRem[18][8] ), .B(
        \u_div/SumTmp[17][8] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][9] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_7  ( .A(\u_div/PartRem[14][7] ), .B(
        \u_div/SumTmp[13][7] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_6  ( .A(\u_div/PartRem[13][6] ), .B(
        \u_div/SumTmp[12][6] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_5  ( .A(\u_div/PartRem[12][5] ), .B(
        \u_div/SumTmp[11][5] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_4  ( .A(\u_div/PartRem[10][4] ), .B(
        \u_div/SumTmp[9][4] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][5] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_7  ( .A(\u_div/PartRem[16][7] ), .B(
        \u_div/SumTmp[15][7] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_7  ( .A(\u_div/PartRem[15][7] ), .B(
        \u_div/SumTmp[14][7] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_6  ( .A(\u_div/PartRem[14][6] ), .B(
        \u_div/SumTmp[13][6] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_5  ( .A(\u_div/PartRem[13][5] ), .B(
        \u_div/SumTmp[12][5] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_4  ( .A(\u_div/PartRem[12][4] ), .B(
        \u_div/SumTmp[11][4] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_4  ( .A(\u_div/PartRem[11][4] ), .B(
        \u_div/SumTmp[10][4] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_21_7  ( .A(\u_div/PartRem[22][7] ), .B(
        \u_div/SumTmp[21][7] ), .S0(quotient[21]), .Y(\u_div/PartRem[21][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_7  ( .A(\u_div/PartRem[21][7] ), .B(
        \u_div/SumTmp[20][7] ), .S0(quotient[20]), .Y(\u_div/PartRem[20][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_7  ( .A(\u_div/PartRem[20][7] ), .B(
        \u_div/SumTmp[19][7] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_7  ( .A(\u_div/PartRem[19][7] ), .B(
        \u_div/SumTmp[18][7] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_7  ( .A(\u_div/PartRem[18][7] ), .B(
        \u_div/SumTmp[17][7] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][8] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_6  ( .A(\u_div/PartRem[18][6] ), .B(
        \u_div/SumTmp[17][6] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_6  ( .A(\u_div/PartRem[15][6] ), .B(
        \u_div/SumTmp[14][6] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_5  ( .A(\u_div/PartRem[14][5] ), .B(
        \u_div/SumTmp[13][5] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_4  ( .A(\u_div/PartRem[13][4] ), .B(
        \u_div/SumTmp[12][4] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_3  ( .A(\u_div/PartRem[11][3] ), .B(
        \u_div/SumTmp[10][3] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_6  ( .A(\u_div/PartRem[16][6] ), .B(
        \u_div/SumTmp[15][6] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_5  ( .A(\u_div/PartRem[15][5] ), .B(
        \u_div/SumTmp[14][5] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_4  ( .A(\u_div/PartRem[14][4] ), .B(
        \u_div/SumTmp[13][4] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_3  ( .A(\u_div/PartRem[13][3] ), .B(
        \u_div/SumTmp[12][3] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_3  ( .A(\u_div/PartRem[12][3] ), .B(
        \u_div/SumTmp[11][3] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_3  ( .A(\u_div/PartRem[10][3] ), .B(
        \u_div/SumTmp[9][3] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][4] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_21_6  ( .A(\u_div/PartRem[22][6] ), .B(
        \u_div/SumTmp[21][6] ), .S0(quotient[21]), .Y(\u_div/PartRem[21][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_6  ( .A(\u_div/PartRem[21][6] ), .B(
        \u_div/SumTmp[20][6] ), .S0(quotient[20]), .Y(\u_div/PartRem[20][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_6  ( .A(\u_div/PartRem[20][6] ), .B(
        \u_div/SumTmp[19][6] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_6  ( .A(\u_div/PartRem[19][6] ), .B(
        \u_div/SumTmp[18][6] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_5  ( .A(\u_div/PartRem[19][5] ), .B(
        \u_div/SumTmp[18][5] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_5  ( .A(\u_div/PartRem[16][5] ), .B(
        \u_div/SumTmp[15][5] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_4  ( .A(\u_div/PartRem[15][4] ), .B(
        \u_div/SumTmp[14][4] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_3  ( .A(\u_div/PartRem[14][3] ), .B(
        \u_div/SumTmp[13][3] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_2  ( .A(\u_div/PartRem[12][2] ), .B(
        \u_div/SumTmp[11][2] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_5  ( .A(\u_div/PartRem[18][5] ), .B(
        \u_div/SumTmp[17][5] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_4  ( .A(\u_div/PartRem[16][4] ), .B(
        \u_div/SumTmp[15][4] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_3  ( .A(\u_div/PartRem[15][3] ), .B(
        \u_div/SumTmp[14][3] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_2  ( .A(\u_div/PartRem[14][2] ), .B(
        \u_div/SumTmp[13][2] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_2  ( .A(\u_div/PartRem[13][2] ), .B(
        \u_div/SumTmp[12][2] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_2  ( .A(\u_div/PartRem[11][2] ), .B(
        \u_div/SumTmp[10][2] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_2  ( .A(\u_div/PartRem[10][2] ), .B(
        \u_div/SumTmp[9][2] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][3] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_21_5  ( .A(\u_div/PartRem[22][5] ), .B(
        \u_div/SumTmp[21][5] ), .S0(quotient[21]), .Y(\u_div/PartRem[21][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_5  ( .A(\u_div/PartRem[21][5] ), .B(
        \u_div/SumTmp[20][5] ), .S0(quotient[20]), .Y(\u_div/PartRem[20][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_5  ( .A(\u_div/PartRem[20][5] ), .B(
        \u_div/SumTmp[19][5] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_4  ( .A(\u_div/PartRem[20][4] ), .B(
        \u_div/SumTmp[19][4] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_3  ( .A(\u_div/PartRem[16][3] ), .B(
        \u_div/SumTmp[15][3] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_2  ( .A(\u_div/PartRem[15][2] ), .B(
        \u_div/SumTmp[14][2] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_4  ( .A(\u_div/PartRem[19][4] ), .B(
        \u_div/SumTmp[18][4] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_4  ( .A(\u_div/PartRem[18][4] ), .B(
        \u_div/SumTmp[17][4] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_2  ( .A(\u_div/PartRem[16][2] ), .B(
        \u_div/SumTmp[15][2] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_21_4  ( .A(\u_div/PartRem[22][4] ), .B(
        \u_div/SumTmp[21][4] ), .S0(quotient[21]), .Y(\u_div/PartRem[21][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_4  ( .A(\u_div/PartRem[21][4] ), .B(
        \u_div/SumTmp[20][4] ), .S0(quotient[20]), .Y(\u_div/PartRem[20][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_3  ( .A(\u_div/PartRem[21][3] ), .B(
        \u_div/SumTmp[20][3] ), .S0(quotient[20]), .Y(\u_div/PartRem[20][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_3  ( .A(\u_div/PartRem[18][3] ), .B(
        \u_div/SumTmp[17][3] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_3  ( .A(\u_div/PartRem[20][3] ), .B(
        \u_div/SumTmp[19][3] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_3  ( .A(\u_div/PartRem[19][3] ), .B(
        \u_div/SumTmp[18][3] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_17_2  ( .A(\u_div/PartRem[18][2] ), .B(
        \u_div/SumTmp[17][2] ), .S0(quotient[17]), .Y(\u_div/PartRem[17][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_21_3  ( .A(\u_div/PartRem[22][3] ), .B(
        \u_div/SumTmp[21][3] ), .S0(quotient[21]), .Y(\u_div/PartRem[21][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_21_2  ( .A(\u_div/PartRem[22][2] ), .B(
        \u_div/SumTmp[21][2] ), .S0(quotient[21]), .Y(\u_div/PartRem[21][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_18_2  ( .A(\u_div/PartRem[19][2] ), .B(
        \u_div/SumTmp[18][2] ), .S0(quotient[18]), .Y(\u_div/PartRem[18][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_20_2  ( .A(\u_div/PartRem[21][2] ), .B(
        \u_div/SumTmp[20][2] ), .S0(quotient[20]), .Y(\u_div/PartRem[20][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_19_2  ( .A(\u_div/PartRem[20][2] ), .B(
        \u_div/SumTmp[19][2] ), .S0(quotient[19]), .Y(\u_div/PartRem[19][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_23_4  ( .A(\u_div/PartRem[24][4] ), .B(
        \u_div/SumTmp[23][4] ), .S0(quotient[23]), .Y(\u_div/PartRem[23][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_23_3  ( .A(\u_div/PartRem[24][3] ), .B(
        \u_div/SumTmp[23][3] ), .S0(quotient[23]), .Y(\u_div/PartRem[23][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_23_2  ( .A(\u_div/PartRem[24][2] ), .B(
        \u_div/SumTmp[23][2] ), .S0(quotient[23]), .Y(\u_div/PartRem[23][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_10_13  ( .A(\u_div/PartRem[11][13] ), .B(
        \u_div/SumTmp[10][13] ), .S0(quotient[10]), .Y(\u_div/PartRem[10][14] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_9_13  ( .A(\u_div/PartRem[10][13] ), .B(
        \u_div/SumTmp[9][13] ), .S0(quotient[9]), .Y(\u_div/PartRem[9][14] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_15_13  ( .A(\u_div/PartRem[16][13] ), .B(
        \u_div/SumTmp[15][13] ), .S0(quotient[15]), .Y(\u_div/PartRem[15][14] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_14_13  ( .A(\u_div/PartRem[15][13] ), .B(
        \u_div/SumTmp[14][13] ), .S0(quotient[14]), .Y(\u_div/PartRem[14][14] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_13_13  ( .A(\u_div/PartRem[14][13] ), .B(
        \u_div/SumTmp[13][13] ), .S0(quotient[13]), .Y(\u_div/PartRem[13][14] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_12_13  ( .A(\u_div/PartRem[13][13] ), .B(
        \u_div/SumTmp[12][13] ), .S0(quotient[12]), .Y(\u_div/PartRem[12][14] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_11_13  ( .A(\u_div/PartRem[12][13] ), .B(
        \u_div/SumTmp[11][13] ), .S0(quotient[11]), .Y(\u_div/PartRem[11][14] ) );
  CLKMX2X2 \u_div/u_mx_PartRem_0_22_6  ( .A(\u_div/PartRem[23][6] ), .B(
        \u_div/SumTmp[22][6] ), .S0(quotient[22]), .Y(\u_div/PartRem[22][7] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_22_5  ( .A(\u_div/PartRem[23][5] ), .B(
        \u_div/SumTmp[22][5] ), .S0(quotient[22]), .Y(\u_div/PartRem[22][6] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_22_4  ( .A(\u_div/PartRem[23][4] ), .B(
        \u_div/SumTmp[22][4] ), .S0(quotient[22]), .Y(\u_div/PartRem[22][5] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_22_3  ( .A(\u_div/PartRem[23][3] ), .B(
        \u_div/SumTmp[22][3] ), .S0(quotient[22]), .Y(\u_div/PartRem[22][4] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_22_2  ( .A(\u_div/PartRem[23][2] ), .B(
        \u_div/SumTmp[22][2] ), .S0(quotient[22]), .Y(\u_div/PartRem[22][3] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_12  ( .A(\u_div/PartRem[9][12] ), .B(
        \u_div/SumTmp[8][12] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][13] )
         );
  CLKMX2X2 \u_div/u_mx_PartRem_0_8_10  ( .A(\u_div/PartRem[9][10] ), .B(
        \u_div/SumTmp[8][10] ), .S0(quotient[8]), .Y(\u_div/PartRem[8][11] )
         );
  CLKINVX1 U1 ( .A(a[21]), .Y(n27) );
  CLKINVX1 U2 ( .A(a[22]), .Y(n26) );
  CLKINVX1 U3 ( .A(a[24]), .Y(n24) );
  CLKINVX1 U4 ( .A(a[20]), .Y(n28) );
  CLKINVX1 U5 ( .A(a[19]), .Y(n29) );
  CLKINVX1 U6 ( .A(a[23]), .Y(n25) );
  CLKINVX1 U7 ( .A(a[18]), .Y(n30) );
  CLKINVX1 U8 ( .A(a[17]), .Y(n31) );
  CLKINVX1 U9 ( .A(a[16]), .Y(n32) );
  CLKINVX1 U10 ( .A(a[8]), .Y(n40) );
  CLKINVX1 U11 ( .A(a[9]), .Y(n39) );
  CLKINVX1 U12 ( .A(a[11]), .Y(n37) );
  CLKINVX1 U13 ( .A(a[12]), .Y(n36) );
  CLKINVX1 U14 ( .A(a[14]), .Y(n34) );
  CLKINVX1 U15 ( .A(a[15]), .Y(n33) );
  CLKINVX1 U16 ( .A(a[10]), .Y(n38) );
  CLKINVX1 U17 ( .A(a[13]), .Y(n35) );
  CLKINVX1 U18 ( .A(a[25]), .Y(n23) );
  CLKINVX1 U19 ( .A(a[26]), .Y(n22) );
  CLKBUFX3 U20 ( .A(n82), .Y(quotient[15]) );
  CLKBUFX3 U21 ( .A(n87), .Y(quotient[10]) );
  CLKBUFX3 U22 ( .A(n86), .Y(quotient[11]) );
  CLKBUFX3 U23 ( .A(n85), .Y(quotient[12]) );
  CLKBUFX3 U24 ( .A(n84), .Y(quotient[13]) );
  CLKBUFX3 U25 ( .A(n83), .Y(quotient[14]) );
  CLKBUFX3 U26 ( .A(n89), .Y(quotient[8]) );
  CLKBUFX3 U27 ( .A(n88), .Y(quotient[9]) );
  CLKINVX1 U28 ( .A(\u_div/PartRem[25][4] ), .Y(n15) );
  CLKINVX1 U29 ( .A(n53), .Y(n14) );
  NOR2X1 U30 ( .A(n65), .B(n71), .Y(quotient[26]) );
  CLKINVX1 U31 ( .A(n59), .Y(n16) );
  CLKINVX1 U32 ( .A(n55), .Y(n13) );
  AND3X2 U33 ( .A(\u_div/CryTmp[18][11] ), .B(n49), .C(n48), .Y(quotient[18])
         );
  AND3X2 U34 ( .A(\u_div/CryTmp[21][8] ), .B(n46), .C(n45), .Y(quotient[21])
         );
  CLKINVX1 U35 ( .A(n64), .Y(n19) );
  CLKINVX1 U36 ( .A(n58), .Y(n17) );
  CLKINVX1 U37 ( .A(n62), .Y(n18) );
  CLKINVX1 U38 ( .A(a[27]), .Y(n21) );
  CLKINVX1 U39 ( .A(n77), .Y(n49) );
  CLKINVX1 U40 ( .A(n75), .Y(n46) );
  CLKBUFX3 U41 ( .A(n80), .Y(quotient[17]) );
  NOR2BX1 U42 ( .AN(\u_div/CryTmp[17][12] ), .B(n77), .Y(n80) );
  CLKBUFX3 U43 ( .A(n79), .Y(quotient[19]) );
  NOR2BX1 U44 ( .AN(\u_div/CryTmp[19][10] ), .B(n76), .Y(n79) );
  CLKBUFX3 U45 ( .A(n78), .Y(quotient[20]) );
  NOR2BX1 U46 ( .AN(\u_div/CryTmp[20][9] ), .B(n75), .Y(n78) );
  NOR3X1 U47 ( .A(n68), .B(n71), .C(b[2]), .Y(quotient[27]) );
  CLKINVX1 U48 ( .A(n73), .Y(n43) );
  CLKINVX1 U49 ( .A(b[12]), .Y(n50) );
  CLKINVX1 U50 ( .A(n76), .Y(n47) );
  CLKINVX1 U51 ( .A(a[28]), .Y(n20) );
  CLKINVX1 U52 ( .A(n74), .Y(n44) );
  CLKINVX1 U53 ( .A(a[7]), .Y(n41) );
  CLKBUFX3 U54 ( .A(n81), .Y(quotient[16]) );
  NOR2BX1 U55 ( .AN(\u_div/CryTmp[16][13] ), .B(b[13]), .Y(n81) );
  CLKINVX1 U56 ( .A(b[13]), .Y(\u_div/BInv [13]) );
  CLKINVX1 U57 ( .A(b[2]), .Y(\u_div/BInv [2]) );
  CLKINVX1 U58 ( .A(b[3]), .Y(\u_div/BInv [3]) );
  CLKINVX1 U59 ( .A(b[4]), .Y(\u_div/BInv [4]) );
  CLKINVX1 U60 ( .A(b[5]), .Y(\u_div/BInv [5]) );
  CLKINVX1 U61 ( .A(b[6]), .Y(\u_div/BInv [6]) );
  CLKINVX1 U62 ( .A(b[7]), .Y(\u_div/BInv [7]) );
  CLKINVX1 U63 ( .A(b[11]), .Y(n48) );
  CLKINVX1 U64 ( .A(b[1]), .Y(n42) );
  CLKINVX1 U65 ( .A(b[9]), .Y(\u_div/BInv [9]) );
  CLKINVX1 U66 ( .A(b[10]), .Y(\u_div/BInv [10]) );
  CLKINVX1 U67 ( .A(b[8]), .Y(n45) );
  AOI222XL U68 ( .A0(\u_div/CryTmp[24][1] ), .A1(\u_div/PartRem[25][1] ), .B0(
        n42), .B1(\u_div/CryTmp[24][1] ), .C0(n42), .C1(\u_div/PartRem[25][1] ), .Y(n53) );
  AOI222XL U69 ( .A0(n14), .A1(\u_div/PartRem[25][2] ), .B0(n14), .B1(
        \u_div/BInv [2]), .C0(\u_div/BInv [2]), .C1(\u_div/PartRem[25][2] ), 
        .Y(n55) );
  AOI222XL U70 ( .A0(n13), .A1(\u_div/PartRem[25][3] ), .B0(n13), .B1(
        \u_div/BInv [3]), .C0(\u_div/BInv [3]), .C1(\u_div/PartRem[25][3] ), 
        .Y(n56) );
  OAI222XL U71 ( .A0(n56), .A1(n15), .B0(n56), .B1(b[4]), .C0(b[4]), .C1(n15), 
        .Y(\u_div/CryTmp[24][5] ) );
  XOR2X1 U72 ( .A(\u_div/CryTmp[24][1] ), .B(n42), .Y(n51) );
  XOR2X1 U73 ( .A(\u_div/PartRem[25][1] ), .B(n51), .Y(\u_div/SumTmp[24][1] )
         );
  XOR2X1 U74 ( .A(\u_div/BInv [2]), .B(\u_div/PartRem[25][2] ), .Y(n52) );
  XNOR2X1 U75 ( .A(n53), .B(n52), .Y(\u_div/SumTmp[24][2] ) );
  XOR2X1 U76 ( .A(\u_div/BInv [3]), .B(\u_div/PartRem[25][3] ), .Y(n54) );
  XNOR2X1 U77 ( .A(n55), .B(n54), .Y(\u_div/SumTmp[24][3] ) );
  XNOR2X1 U78 ( .A(\u_div/PartRem[25][4] ), .B(\u_div/BInv [4]), .Y(n57) );
  XOR2X1 U79 ( .A(n57), .B(n56), .Y(\u_div/SumTmp[24][4] ) );
  AOI222XL U80 ( .A0(\u_div/CryTmp[25][1] ), .A1(\u_div/PartRem[26][1] ), .B0(
        n42), .B1(\u_div/CryTmp[25][1] ), .C0(n42), .C1(\u_div/PartRem[26][1] ), .Y(n62) );
  AOI222XL U81 ( .A0(n18), .A1(\u_div/PartRem[26][2] ), .B0(n18), .B1(
        \u_div/BInv [2]), .C0(\u_div/BInv [2]), .C1(\u_div/PartRem[26][2] ), 
        .Y(n58) );
  AOI222XL U82 ( .A0(n17), .A1(\u_div/PartRem[26][3] ), .B0(n17), .B1(
        \u_div/BInv [3]), .C0(\u_div/BInv [3]), .C1(\u_div/PartRem[26][3] ), 
        .Y(n59) );
  XOR2X1 U83 ( .A(\u_div/CryTmp[25][1] ), .B(n42), .Y(n60) );
  XOR2X1 U84 ( .A(\u_div/PartRem[26][1] ), .B(n60), .Y(\u_div/SumTmp[25][1] )
         );
  XOR2X1 U85 ( .A(\u_div/BInv [2]), .B(\u_div/PartRem[26][2] ), .Y(n61) );
  XNOR2X1 U86 ( .A(n62), .B(n61), .Y(\u_div/SumTmp[25][2] ) );
  XOR2X1 U87 ( .A(\u_div/BInv [3]), .B(\u_div/PartRem[26][3] ), .Y(n63) );
  XOR2X1 U88 ( .A(n17), .B(n63), .Y(\u_div/SumTmp[25][3] ) );
  AOI222XL U89 ( .A0(\u_div/CryTmp[26][1] ), .A1(\u_div/PartRem[27][1] ), .B0(
        n42), .B1(\u_div/CryTmp[26][1] ), .C0(n42), .C1(\u_div/PartRem[27][1] ), .Y(n64) );
  AOI222XL U90 ( .A0(n19), .A1(\u_div/PartRem[27][2] ), .B0(n19), .B1(
        \u_div/BInv [2]), .C0(\u_div/BInv [2]), .C1(\u_div/PartRem[27][2] ), 
        .Y(n65) );
  XOR2X1 U91 ( .A(\u_div/CryTmp[26][1] ), .B(n42), .Y(n66) );
  XOR2X1 U92 ( .A(\u_div/PartRem[27][1] ), .B(n66), .Y(\u_div/SumTmp[26][1] )
         );
  XOR2X1 U93 ( .A(\u_div/BInv [2]), .B(\u_div/PartRem[27][2] ), .Y(n67) );
  XOR2X1 U94 ( .A(n19), .B(n67), .Y(\u_div/SumTmp[26][2] ) );
  AOI222XL U95 ( .A0(\u_div/CryTmp[27][1] ), .A1(\u_div/PartRem[28][1] ), .B0(
        \u_div/CryTmp[27][1] ), .B1(n42), .C0(n42), .C1(\u_div/PartRem[28][1] ), .Y(n68) );
  XOR2X1 U96 ( .A(\u_div/CryTmp[27][1] ), .B(n42), .Y(n69) );
  XOR2X1 U97 ( .A(\u_div/PartRem[28][1] ), .B(n69), .Y(\u_div/SumTmp[27][1] )
         );
  OAI21XL U98 ( .A0(b[0]), .A1(n39), .B0(\u_div/CryTmp[9][1] ), .Y(
        \u_div/SumTmp[9][0] ) );
  OAI21XL U99 ( .A0(b[0]), .A1(n40), .B0(\u_div/CryTmp[8][1] ), .Y(
        \u_div/SumTmp[8][0] ) );
  XOR2X1 U100 ( .A(b[0]), .B(a[28]), .Y(\u_div/SumTmp[28][0] ) );
  OAI21XL U101 ( .A0(b[0]), .A1(n21), .B0(\u_div/CryTmp[27][1] ), .Y(
        \u_div/SumTmp[27][0] ) );
  OAI21XL U102 ( .A0(b[0]), .A1(n22), .B0(\u_div/CryTmp[26][1] ), .Y(
        \u_div/SumTmp[26][0] ) );
  OAI21XL U103 ( .A0(b[0]), .A1(n23), .B0(\u_div/CryTmp[25][1] ), .Y(
        \u_div/SumTmp[25][0] ) );
  OAI21XL U104 ( .A0(b[0]), .A1(n24), .B0(\u_div/CryTmp[24][1] ), .Y(
        \u_div/SumTmp[24][0] ) );
  OAI21XL U105 ( .A0(b[0]), .A1(n25), .B0(\u_div/CryTmp[23][1] ), .Y(
        \u_div/SumTmp[23][0] ) );
  OAI21XL U106 ( .A0(b[0]), .A1(n26), .B0(\u_div/CryTmp[22][1] ), .Y(
        \u_div/SumTmp[22][0] ) );
  OAI21XL U107 ( .A0(b[0]), .A1(n27), .B0(\u_div/CryTmp[21][1] ), .Y(
        \u_div/SumTmp[21][0] ) );
  OAI21XL U108 ( .A0(b[0]), .A1(n28), .B0(\u_div/CryTmp[20][1] ), .Y(
        \u_div/SumTmp[20][0] ) );
  OAI21XL U109 ( .A0(b[0]), .A1(n29), .B0(\u_div/CryTmp[19][1] ), .Y(
        \u_div/SumTmp[19][0] ) );
  OAI21XL U110 ( .A0(b[0]), .A1(n30), .B0(\u_div/CryTmp[18][1] ), .Y(
        \u_div/SumTmp[18][0] ) );
  OAI21XL U111 ( .A0(b[0]), .A1(n31), .B0(\u_div/CryTmp[17][1] ), .Y(
        \u_div/SumTmp[17][0] ) );
  OAI21XL U112 ( .A0(b[0]), .A1(n32), .B0(\u_div/CryTmp[16][1] ), .Y(
        \u_div/SumTmp[16][0] ) );
  OAI21XL U113 ( .A0(b[0]), .A1(n33), .B0(\u_div/CryTmp[15][1] ), .Y(
        \u_div/SumTmp[15][0] ) );
  OAI21XL U114 ( .A0(b[0]), .A1(n34), .B0(\u_div/CryTmp[14][1] ), .Y(
        \u_div/SumTmp[14][0] ) );
  OAI21XL U115 ( .A0(b[0]), .A1(n35), .B0(\u_div/CryTmp[13][1] ), .Y(
        \u_div/SumTmp[13][0] ) );
  OAI21XL U116 ( .A0(b[0]), .A1(n36), .B0(\u_div/CryTmp[12][1] ), .Y(
        \u_div/SumTmp[12][0] ) );
  OAI21XL U117 ( .A0(b[0]), .A1(n37), .B0(\u_div/CryTmp[11][1] ), .Y(
        \u_div/SumTmp[11][0] ) );
  OAI21XL U118 ( .A0(b[0]), .A1(n38), .B0(\u_div/CryTmp[10][1] ), .Y(
        \u_div/SumTmp[10][0] ) );
  NAND2X1 U119 ( .A(b[0]), .B(n39), .Y(\u_div/CryTmp[9][1] ) );
  NAND2X1 U120 ( .A(b[0]), .B(n40), .Y(\u_div/CryTmp[8][1] ) );
  NAND2X1 U121 ( .A(b[0]), .B(n41), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X1 U122 ( .A(b[0]), .B(n21), .Y(\u_div/CryTmp[27][1] ) );
  NAND2X1 U123 ( .A(b[0]), .B(n22), .Y(\u_div/CryTmp[26][1] ) );
  NAND2X1 U124 ( .A(b[0]), .B(n23), .Y(\u_div/CryTmp[25][1] ) );
  NAND2X1 U125 ( .A(b[0]), .B(n24), .Y(\u_div/CryTmp[24][1] ) );
  NAND2X1 U126 ( .A(b[0]), .B(n25), .Y(\u_div/CryTmp[23][1] ) );
  NAND2X1 U127 ( .A(b[0]), .B(n26), .Y(\u_div/CryTmp[22][1] ) );
  NAND2X1 U128 ( .A(b[0]), .B(n27), .Y(\u_div/CryTmp[21][1] ) );
  NAND2X1 U129 ( .A(b[0]), .B(n28), .Y(\u_div/CryTmp[20][1] ) );
  NAND2X1 U130 ( .A(b[0]), .B(n29), .Y(\u_div/CryTmp[19][1] ) );
  NAND2X1 U131 ( .A(b[0]), .B(n30), .Y(\u_div/CryTmp[18][1] ) );
  NAND2X1 U132 ( .A(b[0]), .B(n31), .Y(\u_div/CryTmp[17][1] ) );
  NAND2X1 U133 ( .A(b[0]), .B(n32), .Y(\u_div/CryTmp[16][1] ) );
  NAND2X1 U134 ( .A(b[0]), .B(n33), .Y(\u_div/CryTmp[15][1] ) );
  NAND2X1 U135 ( .A(b[0]), .B(n34), .Y(\u_div/CryTmp[14][1] ) );
  NAND2X1 U136 ( .A(b[0]), .B(n35), .Y(\u_div/CryTmp[13][1] ) );
  NAND2X1 U137 ( .A(b[0]), .B(n36), .Y(\u_div/CryTmp[12][1] ) );
  NAND2X1 U138 ( .A(b[0]), .B(n37), .Y(\u_div/CryTmp[11][1] ) );
  NAND2X1 U139 ( .A(b[0]), .B(n38), .Y(\u_div/CryTmp[10][1] ) );
  AOI211X1 U140 ( .A0(b[0]), .A1(n20), .B0(n70), .C0(n71), .Y(quotient[28]) );
  NAND2X1 U141 ( .A(n42), .B(\u_div/BInv [2]), .Y(n70) );
  NAND2X1 U142 ( .A(n72), .B(\u_div/BInv [3]), .Y(n71) );
  AND2X1 U143 ( .A(n16), .B(n72), .Y(quotient[25]) );
  NOR3X1 U144 ( .A(b[4]), .B(b[5]), .C(n73), .Y(n72) );
  AND3X1 U145 ( .A(\u_div/CryTmp[24][5] ), .B(n43), .C(\u_div/BInv [5]), .Y(
        quotient[24]) );
  NOR2BX1 U146 ( .AN(\u_div/CryTmp[23][6] ), .B(n73), .Y(quotient[23]) );
  NAND2X1 U147 ( .A(n44), .B(\u_div/BInv [6]), .Y(n73) );
  NOR2BX1 U148 ( .AN(\u_div/CryTmp[22][7] ), .B(n74), .Y(quotient[22]) );
  NAND3X1 U149 ( .A(\u_div/BInv [7]), .B(n45), .C(n46), .Y(n74) );
  NAND2X1 U150 ( .A(n47), .B(\u_div/BInv [9]), .Y(n75) );
  NAND3X1 U151 ( .A(\u_div/BInv [10]), .B(n48), .C(n49), .Y(n76) );
  NAND2X1 U152 ( .A(n50), .B(\u_div/BInv [13]), .Y(n77) );
endmodule


module one_pic_avg_intensity_mod_DW_mult_uns_0 ( a, b, product );
  input [21:0] a;
  input [6:0] b;
  output [28:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65;

  ADDFXL U2 ( .A(n24), .B(a[21]), .CI(n2), .CO(product[28]), .S(product[27])
         );
  ADDFXL U3 ( .A(n25), .B(n26), .CI(n3), .CO(n2), .S(product[26]) );
  ADDFXL U4 ( .A(n27), .B(n28), .CI(n4), .CO(n3), .S(product[25]) );
  ADDFXL U5 ( .A(n30), .B(n29), .CI(n5), .CO(n4), .S(product[24]) );
  ADDFXL U6 ( .A(n31), .B(n32), .CI(n6), .CO(n5), .S(product[23]) );
  ADDFXL U7 ( .A(n33), .B(n34), .CI(n7), .CO(n6), .S(product[22]) );
  ADDFXL U8 ( .A(n35), .B(n36), .CI(n8), .CO(n7), .S(product[21]) );
  ADDFXL U9 ( .A(n37), .B(n38), .CI(n9), .CO(n8), .S(product[20]) );
  ADDFXL U10 ( .A(n39), .B(n40), .CI(n10), .CO(n9), .S(product[19]) );
  ADDFXL U11 ( .A(n41), .B(n42), .CI(n11), .CO(n10), .S(product[18]) );
  ADDFXL U12 ( .A(n43), .B(n44), .CI(n12), .CO(n11), .S(product[17]) );
  ADDFXL U13 ( .A(n45), .B(n46), .CI(n13), .CO(n12), .S(product[16]) );
  ADDFXL U14 ( .A(n47), .B(n48), .CI(n14), .CO(n13), .S(product[15]) );
  ADDFXL U15 ( .A(n49), .B(n50), .CI(n15), .CO(n14), .S(product[14]) );
  ADDFXL U16 ( .A(n51), .B(n52), .CI(n16), .CO(n15), .S(product[13]) );
  ADDFXL U17 ( .A(n53), .B(n54), .CI(n17), .CO(n16), .S(product[12]) );
  ADDFXL U18 ( .A(n55), .B(n56), .CI(n18), .CO(n17), .S(product[11]) );
  ADDFXL U19 ( .A(n57), .B(n58), .CI(n19), .CO(n18), .S(product[10]) );
  ADDFXL U20 ( .A(n59), .B(n60), .CI(n20), .CO(n19), .S(product[9]) );
  ADDFXL U21 ( .A(n61), .B(n62), .CI(n21), .CO(n20), .S(product[8]) );
  ADDFXL U22 ( .A(n63), .B(n64), .CI(n22), .CO(n21), .S(product[7]) );
  ADDHXL U25 ( .A(a[21]), .B(a[20]), .CO(n24), .S(n25) );
  ADDHXL U26 ( .A(a[20]), .B(a[19]), .CO(n26), .S(n27) );
  ADDHXL U27 ( .A(a[19]), .B(a[18]), .CO(n28), .S(n29) );
  ADDFXL U28 ( .A(a[17]), .B(a[21]), .CI(a[18]), .CO(n30), .S(n31) );
  ADDFXL U29 ( .A(a[16]), .B(a[20]), .CI(a[17]), .CO(n32), .S(n33) );
  ADDFXL U30 ( .A(a[15]), .B(a[19]), .CI(a[16]), .CO(n34), .S(n35) );
  ADDFXL U31 ( .A(a[14]), .B(a[18]), .CI(a[15]), .CO(n36), .S(n37) );
  ADDFXL U32 ( .A(a[13]), .B(a[17]), .CI(a[14]), .CO(n38), .S(n39) );
  ADDFXL U33 ( .A(a[12]), .B(a[16]), .CI(a[13]), .CO(n40), .S(n41) );
  ADDFXL U34 ( .A(a[11]), .B(a[15]), .CI(a[12]), .CO(n42), .S(n43) );
  ADDFXL U35 ( .A(a[10]), .B(a[14]), .CI(a[11]), .CO(n44), .S(n45) );
  ADDFXL U36 ( .A(a[9]), .B(a[13]), .CI(a[10]), .CO(n46), .S(n47) );
  ADDFXL U37 ( .A(a[8]), .B(a[12]), .CI(a[9]), .CO(n48), .S(n49) );
  ADDFXL U38 ( .A(a[7]), .B(a[11]), .CI(a[8]), .CO(n50), .S(n51) );
  ADDFXL U39 ( .A(a[6]), .B(a[10]), .CI(a[7]), .CO(n52), .S(n53) );
  ADDFXL U40 ( .A(a[5]), .B(a[9]), .CI(a[6]), .CO(n54), .S(n55) );
  ADDFXL U41 ( .A(a[4]), .B(a[8]), .CI(a[5]), .CO(n56), .S(n57) );
  ADDFXL U42 ( .A(a[3]), .B(a[7]), .CI(a[4]), .CO(n58), .S(n59) );
  ADDFXL U43 ( .A(a[2]), .B(a[6]), .CI(a[3]), .CO(n60), .S(n61) );
  ADDFXL U44 ( .A(a[1]), .B(a[5]), .CI(a[2]), .CO(n62), .S(n63) );
  ADDHXL U45 ( .A(a[4]), .B(a[1]), .CO(n64), .S(n65) );
  CLKBUFX3 U50 ( .A(a[0]), .Y(product[2]) );
  CLKBUFX3 U51 ( .A(a[1]), .Y(product[3]) );
  CLKBUFX3 U52 ( .A(a[2]), .Y(product[4]) );
  AO22X1 U53 ( .A0(n65), .A1(a[0]), .B0(a[3]), .B1(a[0]), .Y(n22) );
endmodule


module one_pic_avg_intensity_mod ( max_out_intensity, one_pic_avg_intensity, 
        quantity_colorindex_imgindex );
  input [28:0] max_out_intensity;
  output [28:0] one_pic_avg_intensity;
  input [20:0] quantity_colorindex_imgindex;
  wire   N5, N6, N7, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34,
         N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48,
         N49, N50, N51, N52, N53, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n9, n10, n11, n21, n22, n23, n24, n25, n26;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10;

  one_pic_avg_intensity_mod_DW_div_uns_0 div_10 ( .a({N31, N30, N29, N28, N27, 
        N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, 
        N12, N11, N10, 1'b0, 1'b0, N7, N6, N5, 1'b0, 1'b0}), .b(
        quantity_colorindex_imgindex[13:0]), .quotient({N53, N52, N51, N50, 
        N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, 
        N35, N34, N33, N32, SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6}) );
  one_pic_avg_intensity_mod_DW_mult_uns_0 mult_10 ( .a(max_out_intensity[28:7]), .b({1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0}), .product({N31, N30, N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, 
        N13, N12, N11, N10, SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        N7, N6, N5, SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10}) );
  CLKBUFX3 U4 ( .A(max_out_intensity[5]), .Y(one_pic_avg_intensity[5]) );
  CLKBUFX3 U5 ( .A(max_out_intensity[6]), .Y(one_pic_avg_intensity[6]) );
  NOR2BX1 U6 ( .AN(N35), .B(n11), .Y(one_pic_avg_intensity[10]) );
  NOR2BX1 U7 ( .AN(N36), .B(n21), .Y(one_pic_avg_intensity[11]) );
  NOR2BX1 U8 ( .AN(N37), .B(n22), .Y(one_pic_avg_intensity[12]) );
  NOR2BX1 U9 ( .AN(N38), .B(n23), .Y(one_pic_avg_intensity[13]) );
  NOR2BX1 U10 ( .AN(N39), .B(n24), .Y(one_pic_avg_intensity[14]) );
  NOR2BX1 U11 ( .AN(N40), .B(n25), .Y(one_pic_avg_intensity[15]) );
  NOR2BX1 U12 ( .AN(N33), .B(n25), .Y(one_pic_avg_intensity[8]) );
  NOR2BX1 U13 ( .AN(N34), .B(n26), .Y(one_pic_avg_intensity[9]) );
  CLKINVX1 U14 ( .A(n9), .Y(n11) );
  CLKINVX1 U15 ( .A(n9), .Y(n21) );
  CLKINVX1 U16 ( .A(n9), .Y(n22) );
  CLKINVX1 U17 ( .A(n9), .Y(n23) );
  CLKINVX1 U18 ( .A(n10), .Y(n24) );
  CLKINVX1 U19 ( .A(n10), .Y(n25) );
  CLKINVX1 U20 ( .A(n10), .Y(n26) );
  NOR2BX1 U21 ( .AN(N47), .B(n24), .Y(one_pic_avg_intensity[22]) );
  NOR2BX1 U22 ( .AN(N48), .B(n12), .Y(one_pic_avg_intensity[23]) );
  NOR2BX1 U23 ( .AN(N51), .B(n22), .Y(one_pic_avg_intensity[26]) );
  NOR2BX1 U24 ( .AN(N50), .B(n21), .Y(one_pic_avg_intensity[25]) );
  NOR2BX1 U25 ( .AN(N32), .B(n25), .Y(one_pic_avg_intensity[7]) );
  NOR2BX1 U26 ( .AN(N43), .B(n11), .Y(one_pic_avg_intensity[18]) );
  NOR2BX1 U27 ( .AN(N46), .B(n22), .Y(one_pic_avg_intensity[21]) );
  NOR2BX1 U28 ( .AN(N42), .B(n26), .Y(one_pic_avg_intensity[17]) );
  NOR2BX1 U29 ( .AN(N44), .B(n23), .Y(one_pic_avg_intensity[19]) );
  NOR2BX1 U30 ( .AN(N45), .B(n21), .Y(one_pic_avg_intensity[20]) );
  NOR2BX1 U31 ( .AN(N52), .B(n23), .Y(one_pic_avg_intensity[27]) );
  CLKINVX1 U32 ( .A(n12), .Y(n9) );
  CLKINVX1 U33 ( .A(n12), .Y(n10) );
  NOR2BX1 U34 ( .AN(N49), .B(n11), .Y(one_pic_avg_intensity[24]) );
  NOR2BX1 U35 ( .AN(N53), .B(n24), .Y(one_pic_avg_intensity[28]) );
  NOR2BX1 U36 ( .AN(N41), .B(n26), .Y(one_pic_avg_intensity[16]) );
  CLKBUFX3 U37 ( .A(max_out_intensity[0]), .Y(one_pic_avg_intensity[0]) );
  CLKBUFX3 U38 ( .A(max_out_intensity[1]), .Y(one_pic_avg_intensity[1]) );
  CLKBUFX3 U39 ( .A(max_out_intensity[2]), .Y(one_pic_avg_intensity[2]) );
  CLKBUFX3 U40 ( .A(max_out_intensity[3]), .Y(one_pic_avg_intensity[3]) );
  CLKBUFX3 U41 ( .A(max_out_intensity[4]), .Y(one_pic_avg_intensity[4]) );
  XNOR2X1 U42 ( .A(quantity_colorindex_imgindex[5]), .B(max_out_intensity[5]), 
        .Y(n13) );
  NAND4X1 U43 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n12) );
  NOR4X1 U44 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(n16) );
  XNOR2X1 U45 ( .A(quantity_colorindex_imgindex[6]), .B(max_out_intensity[6]), 
        .Y(n15) );
  XNOR2X1 U46 ( .A(quantity_colorindex_imgindex[4]), .B(max_out_intensity[4]), 
        .Y(n14) );
  XOR2X1 U47 ( .A(quantity_colorindex_imgindex[0]), .B(max_out_intensity[0]), 
        .Y(n20) );
  XOR2X1 U48 ( .A(quantity_colorindex_imgindex[1]), .B(max_out_intensity[1]), 
        .Y(n19) );
  XOR2X1 U49 ( .A(quantity_colorindex_imgindex[3]), .B(max_out_intensity[3]), 
        .Y(n17) );
  XOR2X1 U50 ( .A(quantity_colorindex_imgindex[2]), .B(max_out_intensity[2]), 
        .Y(n18) );
endmodule


module ISE ( clk, reset, image_in_index, pixel_in, busy, out_valid, 
        color_index, image_out_index );
  input [4:0] image_in_index;
  input [23:0] pixel_in;
  output [1:0] color_index;
  output [4:0] image_out_index;
  input clk, reset;
  output busy, out_valid;

  wire   [7:0] R;
  wire   [7:0] G;
  wire   [7:0] B;
  wire   [1:0] pixel_color_index;
  wire   [20:0] quantity_colorindex_imgindex;
  wire   [28:7] max_out_intensity;

  busy_mod k1 ( .busy(busy), .clk(clk), .reset(reset) );
  busy_accumulate k2 ( .busy(busy), .reset(reset), .clk(clk) );
  pixel_in_split k3 ( .pixel_in(pixel_in), .busy(busy), .R(R), .G(G), .B(B), 
        .clk(clk) );
  one_pixel_rgb k4 ( .R(R), .G(G), .B(B), .pixel_color_index(pixel_color_index), .clk(clk) );
  one_pic_accumulate k5 ( .p1(pixel_color_index), .p2(image_in_index), .p3(
        quantity_colorindex_imgindex), .p4(clk) );
  one_accumulate_intensity k6 ( .R(R), .G(G), .B(B), .image_in_index(
        image_in_index), .max_out_intensity({max_out_intensity, color_index, 
        image_out_index}), .clk(clk), .reset(reset) );
  one_pic_avg_intensity_mod k7 ( .max_out_intensity({max_out_intensity, 
        color_index, image_out_index}), .quantity_colorindex_imgindex(
        quantity_colorindex_imgindex) );
endmodule

