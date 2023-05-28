# Interfaces and classes in systemVerilog

Objects don't have a port list in systemverilog. To access they we can use the interfaces

```systemverilog

//Include the definition of the tester class
`include "tester.svh"

module top;
	memory_interface mi();
	//Use the interface to connect the DUT that has a modport
	memory dut (mi.mem_mp);
	//Declare handle for tester class
	tester tst;

	initial beign
		//Make a new tester through a constructor and pass the interface
		tst = new(mi);
		fork
			tst.run;
		join_none
	end
endmodule
```

For doing that the class is defined in that way

```systemverilog
class tester;

	logic [3:0] tiny_addr;
//Declare a virtual interface. The virtual means that it is not implemented here, but somewhere else. 
	virtual interface memory_interface t;
// The argument of the constructor is an interface
	function new (virtual interface memoru_interface it);
		t = it;
	endfunction

...
...
```

In that way the class can access to the signals defined into the interface.

#### See also
- [Interfaces SystemVerilog](interfaces-systemverilog.md)
- [Classes sv](classes-sv.md)