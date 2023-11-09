 
## 3 styles of writing synthesizable verilog code

1. **always at**

```verilog
	always@(posedge clock)
		Q <= D;
```

```verilog
	always@(clock or D)
		if(clock) Q <= D;
```

Every variable assigned in a block starting with 

```verilog
always@(posedge clock)  OR    always@(negedge clock)
```
becomes the output of an edge-triggered flip flop. This is the only way to build flip flops.


2. **continuous assignment**

```verilog
assign foo = a ? b^c : b | c;
```

foo is revaluated whenever anything in left hand side changes

It is used for combinational logic

3. **always@( * )**

Combinational logic specified by its behavior

```verilog
always@(a or b or c)
    begin
	    if(a) foo <= b ^ c;
        else  foo <= b | c;
    end
```
