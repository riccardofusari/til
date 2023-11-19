# SystemVerilog Assertions for sequential circuits

Writing SVAs for sequential circuits is different because some operations take several clock cycles to complete.

In this cases, you can introduce a time delay with the `##` sign.

For example, a simple register reset signal assertion:

```systemverilog
property reset_p;
    @(posedge clk or negedge rst)
    !rst |-> ##1 data_out == 'h0
endproperty
```

at any positive edge clock or negative edge of the reset:
	rst = 0 implies that the NEXT clock cycle data_out has to be zero

```systemverilog
property reset_p;
    @(negedge clk) disable iff (!rst)
    ##1 data_out == $past(data_in);
endproperty
```

at any negative edge clock (unless reset = 0):
	the NEXT clock cycle, data_out has to be equal to the past data input


In this examples is just one clock cycle, but it can be any number.



