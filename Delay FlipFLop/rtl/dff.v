module dff(clk,
           reset,
           d,
           q,
           qb);

 //Port declarations
 input clk, reset, d;
 output q, qb;
 reg q;
 
 //Behavioral logic for D flip-flop.
 always@(posedge clk)
   begin
     if(reset)   
        q<=0;
     else
        q<=d;           
   end

 assign qb = ~ q;
       

 
endmodule         


