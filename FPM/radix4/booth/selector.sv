module selector(x, y, pp);
  input [22:0]y;
  input [2:0]x;
  
  output [24:0]pp;
  
  wire [2:0]sel; //single, double, neg
  wire [24:0]net0, net1, net2;
  
  encoder encoder(.x(x), .sel(sel));
  
  assign net0 = {25{sel[2]}} & {2'b01, y};  //{2'b01, y} : 0;
  assign net1 = {25{sel[1]}} & {1'b1, y, 1'b0};  //{1'b1, y, 1'b0} : 0;
  assign net2 = net0 | net1;
  
  assign pp = sel[0] ? ~net2 : net2;
  
endmodule