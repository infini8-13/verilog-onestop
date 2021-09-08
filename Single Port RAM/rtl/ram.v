module ram(data,
           we,
           enable,
           addr);
      
  input we,
        enable;
  input [3:0] addr;
  inout [7:0] data;
           
// 8-bit wide memory with 16 locations
  reg [7:0] mem [15:0];


// Writing data into memory
  always@(data,we,enable,addr)
    if (we && !enable)
       mem[addr]=data;

// Reading data from memory
  assign data= (enable && !we) ? mem[addr] : 8'hzz;

endmodule 

