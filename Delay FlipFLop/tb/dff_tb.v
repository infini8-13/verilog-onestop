module dff_tb();


  reg clk,
      reset,
      d;
      
  wire q,
       qb;
       
  parameter cycle = 10;
	
//Instantiating the dff design       
  dff dut (clk, reset, d, q, qb);
	
//Clock gen with cycle parameter	
  always
  begin
    #(cycle/2);
      clk = 1'b0;
    #(cycle/2);
      clk=~clk;
  end
	  
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

  initial $monitor("D Input = %b, Q output = %b, Not Q Output = %b, Reset = %b",
                   d, q, qb, reset);
endmodule
