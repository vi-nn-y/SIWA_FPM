module selector(x, y, Y3, pp);
  input [22:0]y;
  input [23:0]Y3;
  input [3:0]x; //x[3] = neg
  
  output [25:0]pp;
  
  wire [3:0]sel; //4Y, 2Y, 3Y, Y
  
  wire[25:0]Y, Y2, Y4;
  
  assign Y = {3'b001, y};
  assign Y2 = {2'b01, y, 1'b0};
  assign Y4 = {1'b1, y, 2'b00};
  
  encoder encoder(.x(x), .sel(sel));
  
  wire [25:0]net0, net1, net2, net3;
  
  assign net0 = sel[0] ? Y : 0;
  assign net1 = sel[1] ? {Y3[23], !Y3[23], Y3[22:0], y[0]} : 0;
  assign net2 = sel[2] ? Y2 : 0;
  assign net3 = sel[3] ? Y4 : 0;
  
  assign pp = (net0 | net1 | net2 | net3) ^ {26{x[3]}};
  
endmodule
