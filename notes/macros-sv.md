# Macros in System Verilog

They are the same as C, but with the \`

```systemverilog
`define info(msg)    uvm_top.uvm_report_info/$psprintf("%m"), msg);

import uvm_pkg::*;

module top;
	initial begin
		`info ("My info message");
	end
endmodule
```

like C, you can have also conditional macros

```systemverilog
`ifdef FIRST
module top;
	initial `info("message");
endmodule

`else

module top;
	initial `info("different message");
endmodule

`endif
```

and in your compilation script run.do

```bash
if [file exists work] {vdel -all}
vlib work
vlog top.sv +define+FIRST
vsim -novopt top
run -all
```

#### See also
- [packages-sv](packages-sv.md)