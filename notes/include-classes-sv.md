# Good practices for including different classes in System Verilog

If you have a testbench with a lot of classes, it is a good practice to give to each class a single .svh file. 

Then create a package that contains all the includes of all the classes

```systemverilog
package memory_pkg;
	import uvm_pkg::*;
`include "tester.svh"
`include "monitor.svh"
`include "scoreboard.svh"
endpackage
```

Remember to compile the package before it is imported

The compile.f is a list of files to compile

```bash

memory_pkg.sv
memory_if.sv
memory.sv
top.sv
```
