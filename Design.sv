module dff(clk,rst,d,q);
  input clk;
  input rst;
  input d;
  output reg q;
  
  always @(posedge clk)
    begin
      if(rst == 1)
        q<=0;
		else
          q<=d;
    end
endmodule
