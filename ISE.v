`include  "busy_mod.v"
`include   "busy_accumulate.v"
`include    "pixel_in_split.v"
`include     "one_pixel_rgb.v"
`include      "one_pic_accumulate.v"
`include       "one_accumulate_intensity.v"
`include        "one_pic_avg_intensity_mod.v"
`timescale 1ns/10ps




module ISE(clk, reset, image_in_index, pixel_in, busy, out_valid, color_index, image_out_index);
input           clk;
input           reset;
input   [4:0]   image_in_index;
input   [23:0]  pixel_in;
output          busy;
output          out_valid;
output  [1:0]   color_index;
output  [4:0]   image_out_index;

wire busy;
wire [7:0] R,G,B ;
wire [4:0] busy_accumulate_quantity;
wire [1:0] pixel_color_index;
wire [20:0]  quantity_colorindex_imgindex;
wire [28:0]  max_out_intensity;
wire [28:0] one_pic_avg_intensity;


busy_mod k1(busy,clk,reset);
busy_accumulate k2(busy,busy_accumulate_quantity,reset,clk);


pixel_in_split k3(pixel_in,busy,R,G,B,clk);
one_pixel_rgb k4(R,G,B,pixel_color_index,clk);
one_pic_accumulate k5(pixel_color_index,image_in_index,quantity_colorindex_imgindex,clk);

one_accumulate_intensity k6(R,G,B,image_in_index,max_out_intensity,clk,reset);
one_pic_avg_intensity_mod k7(max_out_intensity,one_pic_avg_intensity,quantity_colorindex_imgindex);


assign image_out_index=max_out_intensity[4:0];
assign color_index=max_out_intensity[6:5];



endmodule
