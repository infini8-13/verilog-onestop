module seq_det_tb();
       
  parameter cycle=10;

  reg  din,
       clock,
       reset;
 
  wire dout;

  seq_det SQD(.din(din),
              .clock(clock),
              .reset(reset),
              .dout(dout));
  
// Clock gen   
  always
  begin
    #(cycle/2);
    clock = 0;
    #(cycle/2);
    clock = 1; 
  end      

// initialize the input din of sequence detector.
  task initialize;
    begin
     din = 0;
    end
  endtask  

  task delay(input integer i);
    begin
       #i;
    end
  endtask
 
// reset design
  task RESET;
    begin
      reset = 1;
      delay(cycle);
      reset = 0;
    end
  endtask  



// provides input to design on negedge of clock
  task stimulus(input i);
    begin
      @(negedge clock);
      din = i;
    end
  endtask  

  initial $monitor("Reset=%b, state=%b, Din=%b, Output Dout=%b",
                   reset,SQD.present_state,din,dout);
  
  always@(SQD.present_state or dout)
  begin
     if (SQD.present_state==2'b11 && dout==1)
         $display("Correct output at state %b", SQD.present_state);
  end
 
  initial
  begin
    initialize;
    RESET;
    stimulus(0);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    RESET;
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    delay(10);    
    $finish;
  end

endmodule     
