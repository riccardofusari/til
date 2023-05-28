# VHDL and System Verilog communication

Let's assume you want to test a VHDL memory
```vhdl
entity memory is
	port (
		clk: in std_logic;
		rd:  in std_logic;
		wr : in std_logic;
		addr : in std_logic_vector (15 downto 0);
		data: inout std_logic_vector (15 downto 0)
		);
end memory;

architecture rtl of memory is
...
begin
..
```

A wrapper is needed.

```systemverilog
module top;

	memory_if mi();
	memory_wrapper dut (mi.mem_mp);
	tester tst;

	initial begin
		tst = new(mi);
		fork
			tst.run;
		join_none
	end
endmodule
```

A wrapper is a module defined this way
```systemverilog
module memory_wrapper (memory_if.mem_mp m);

	memory VHDL_DUT;
		(   .clk(m.clk),
			.rd(m.rd),
			.wr(m.wr),
			.addr(m.addr),
			.data(m.data));
endmodule
```

so the wrapper is referring to the modport define into the interface. Whenever into the tester you refer to the m.* signal, you are referring to the same signal that pass through the interface and goes to the VHDL code.

#### See also
- [Interfaces SystemVerilog](interfaces-systemverilog.md)
- [Classes sv](classes-sv.md)