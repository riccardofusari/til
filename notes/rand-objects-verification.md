# Random variable into objects - SystemVerilog
It is possible to randomize the objects to create good stimulus.
Follows the example class:

```systemverilog
typedef logic[15:0] addr_t;
typedef logic[7:0] data_t;
typedef enum {read, write} mem_op_t;

// A class for memory operation
class memory_op;
//Random data members
	rand addr_t addr;
	rand data_t data;
	rand mem_opt_t mem_op;

// Constructor
	function new(addr_t = 0, data_t d = 0, mem_op_t o = read);
		addr = a;
		data = d;
		mem_op = o;
	endfunction

// Method
	function string convert2string();
		string s;
		$sformat(s, "addr %0h data %0h  op %s", addr, data, mem_op);
		return s;
	endfunction
endclass
```

And the top tb

```systemverilog
module top;
	mem_op op;
	initial begin
		op = new();
		repeat (5) begin
			assert(op.randomize());
			$display("op -> %s", op.convert2string);
		end
	end
endmodule
```

In that way all the data members of the object that are rand, are randomized.

It is also possible to do constrained randomization
```systemverilog
module top;

	memory_op op;

	initial begin
		op = new();
		repeat (5) begin
			assert(op.randomize() with {mem_op == read;});
			$display("op -> %s", op.convert2string);
		end
	end
endmodule
```
In that way only the other two members are random, mem_op is always read instead.
To push that further, you can create a child class that add constraints to the parent class

```systemverilog
class read_op extends memory_op;
	constraint read_only_c {mem_op == read;};
endclass
```

```systemverilog
module top;
	read_op op;
	initial begin
		op = new();
		repeat (5) begin
			assert(op.randomize());
			$display("op -> %s", op.convert2string);
		end
	end
endmodule
```

#### See also
- [Classes systemVerilog](classes-sv.md)
