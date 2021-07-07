module dff_tb();

// Step 1. Define a parameter with name "cycle" which is equal to 10  
  reg clk,
      reset,
      d;
      
  wire q,
       qb;
       
  parameter cycle = 10;
// Step 2. Instantiate the d_ff design       
  d_ff dut (clk, reset, d, q, qb);
// Step 3. Understand the clock generation logic
  always
  begin
    #(cycle/2);
      clk = 1'b0;
    #(cycle/2);
      clk=~clk;
  end
	  
//Step 4. Understand the various tasks used and also how to use tasks in testbench.
  task rst_dut();
  begin
    reset=1'b1;
    #10;
    reset=1'b0;
  end
  endtask

  task din(input i);
  begin
    @(negedge clk);
    d=i;
  end
  endtask
           
  initial 
  begin
    rst_dut;
    din(0);
    din(1);
    din(0);
    din(1);
    din(1);
    rst_dut;
    din(0);
    din(1);
    #10;
    $finish;
  end

//Step5. Use $monitor task in a parallel initial block  to display inputs and outputs.
  initial $monitor("D Input = %b, Q output = %b, Not Q Output = %b, Reset = %b",
                   d, q, qb, reset);
endmodule
