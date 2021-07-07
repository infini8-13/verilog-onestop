module mux4_1(a,
              sel,
              y);

       

// Step 1 : Define the port directions with proper datatypes & ranges.
input [3:0] a ;
input [1:0] sel ;
output reg y;

// Step 2 : Write the MUX behaviour as a parallel logic using case statement in behavioural modelling.
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
  
