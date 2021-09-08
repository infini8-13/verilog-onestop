// Implementation of a 4 to 1 Multiplexer

module mux4_1(a,
              sel,
              y);

       

//Port directions to the variables
input [3:0] a ;
input [1:0] sel ;
output reg y;

//MUX behaviour as a parallel logic in behavioural modelling.
always@(*)
  begin
    case (sel)
        2'b00 	: y = a[0];
        2'b01 	: y = a[1];
        2'b10 	: y = a[2];
        2'b11 	: y = a[3];  
    endcase
  end

endmodule
  
