# Packages in system Verilog

Makes possible to modules to refer to a certain namespace defined from the package and imported into the module
```systemverilog
package vars_pkg;
	integer a = 10;
endpackage 
```

```systemverilog
import vars_pkg::*;
//the namespace of the variable a is imported here, so it is visible also by the module
module top;
	integer a;
	
	initial	begin
		a = 1;
		$display(a);
	end
endmodule : top
```
![](../media/Pasted%20image%2020230528172447.png)

Now the variables are the same so it is overwritten!

You can also use the packages for inserting classes and shared objects or instances

```systemverilog
package mypackage;

	typedef enum {read, write} op_t;
	---

class mem_op
	rand op_t op;

	function string convert2string();
		string s;
		$sformat(s, "op: %0s", op);
		return s;
	endfunction
endclass
// That's the sharde instance
	mem_op common_op = new();

endpackage
```

If you import this package inside your file, you can use both new class mem_op and the common_op shared instance

#### See also
- [macros-sv](macros-sv.md)
- [interfaces-systemverilog](interfaces-systemverilog.md)
