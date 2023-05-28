# Interfaces in systemVerilog

It looks like a module and it is instantiated as a module. 
It is like a module with signals in it. The interface uses `modports` to control signal direction.

Let's look at the definition of an interface
```systemverilog
//Declared as a module
interface memory_interface;

//Declare the variables that make the interface
//the direction doesn't go here
	logic [15:0] wr_data_reg;
	wire  [15:0] data;
	logic [15:0] addr;
	bit          clk;
	bit          read;
	bit          write;

//Continue below....
```

![](../media/Pasted%20image%2020230528155453.png)

The memory is the DUT and the tester generates stimulies. In order to access the DUT, you need to pass through the interface that define the direction of each signal

```systemverilog

// The modports define the directions of the signals, from the point of view of the component
modport mem_mp (
				inout data,
				input addr,
				input clk,
				input read,
				input write);

modport tester (
				output wr_data_reg,
				input clk,
				output addr,
				output read,
				output write);

assign data = (wr) ? wr_data_reg : 16'hZZZZ;
```

In the top testbench, the declaration are the followings
```systemverilog
module top;

	memory_interface mem_if();
	memory dut (mem_if.mem_mp);
	tester tst (mem_if.tester);
endmodule
```

To the other modules you give pointers to the same interface. So when they refer to the signals read, write, data, addr, clk, they refer to the same signals.

The other module are defined:
```systemverilog
module tester (memory_interface.tester t);
	logic [3:0] tiny_addr;

	initial begin
		t.write = 1'b1;
		for (int i=0; i< 'h10; i++) begub
			@(negedge tst.clk);
			t.wr_data_reg = i;
			t.addr = i;
		end
	end
endmodule
```

```systemverilog
module memory (memory_if.mem_mp m);
	logic [15:0] memo [2**16-1 : 0];

	assign m.data = (m-rd) ? mem[m.addr]  : 16'ZZZZ;

	always @(posedge m.clk)
		if (m.write)
			mem[m.addr] = m.data;
endmodule
```

even if they are m and t, the signal in which they refer to are the same.

#### See also
- [interfaces-and-classes-sv](interfaces-and-classes-sv.md)
- [layered-testbench](layered-testbench.md)