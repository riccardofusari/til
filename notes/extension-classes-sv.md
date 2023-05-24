# Extension of a class in SystemVerilog
It is possible to leverage a class with child classes.

A child class is declared with the `extends` keyword.

The constructor of a child class is called with `super.new(..)`

A child class can use the parent's methods.

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

class square_t extends rectangle_t;
	//This constructor calls parent's constructor with super
	function new(int side);
		super.new(side,side);
	endfunction
endclass

module class_example;
	//Here the memory is NOT allocated
	rectangle_t rectangle;
	square_t    square;
	initial begin
		//Here the memory IS allocated
		rectangle = new(50, 20);
		$display(rectangle.area);
		square = new(50);
		//We can use the method from the parent
		$display(square.area);
	end
endmodule
```