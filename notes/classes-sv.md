# Classes of SystemVerilog

```systemverilog
class rectangle_t;
	int lenght;
	int width;

//Constructor
	function new(int 1, int w);
		lenght = 1;
		width  = w;
	endfunction

	function integer area;
		return lenght * width;
	endfunction
endclass
```

- Variable inside a class are data members
- The **constructor** is a function that creates a new instance of the class.
- The functions inside the class are called **methods**

The memory is not allocated when you declare a variable of type of a class (allocate just a pointer). Only when you initialize the object the memory is allocated (with the constructor).

```systemverilog
module class_example;

	//Here the memory is NOT allocated
	rectangle_t rectangle;
	initial begin
		//Here the memory IS allocated
		rectangle = new(50, 20);
		$display(rectangle.area);
	end
endmodule
```

### See also
- [Extension of a class](extension-classes-sv.md)