//Testbench for 4 to 1 Multiplexer.

module mux4_1_tb();

// Variables required for testbench
  reg [1:0]sel;
  reg [3:0]a;
  wire y;

  integer i, j;

// Instantiating the design 
  mux4_1 dut (a, sel, y);


  task initialize;
   begin 
    {a,sel} = 0;		// body here
   end
  endtask
  
  task inputs (input [3:0] in);
   begin
    a = in;
   end
  endtask  
  
  task select (input [1:0] s);
   begin
    sel = s;
   end
  endtask 
//  Calling the tasks from procedural block 
  initial
   begin
    initialize;
    #10 
    for(i=0;i<4;i=i+1)
      begin
       select(i);
       for(j=0;j<16;j=j+1)
        begin
         #10 inputs(j);
        end
      end    
   end
    

  initial $monitor("Input a=%b, select=%b, Output y=%b\n",
                    a, sel, y);

  initial #700 $finish;

endmodule
  
