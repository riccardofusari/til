Two types of fsm
- **Moore machine**: The output depend solely on state vector (simplest in design)
	There are no path that connect output except the vector state
- **Mealy machine**: The output depend on inputs and state vector (only use if it is significantly smaller or faster)

It is a good practice to put fsm in a module by themself and that there is a ff in between input and output

Based on some input, the moore machine send this to the combinational logic for computing the next state. In the mealy the output is changed immediately
So the mealy machine is faster, cause the state change before the clock rising.

Basic template for a Moore machine.
```verilog
module traffic_light_controller (input clock,input reset,input car,output red,output yellow,output green);

parameter [1:0]   //synopsys enum states
	S0 = 2'b00;
	S1 = 2'b01;
	S2 = 2'b10:
	S3 = 2'b11;

reg [1:0] current_state, next_state;
reg red, yellow, green;

always@(posedge clock or negedge reset)
	if(!reset) current_state <= S0;
	else current_state <= next_state;


always@(current_state or car)
	begin
		red = 0; yellow = 0; green = 0; /*Default values for preventing latches*/
		case(current_state)
			S0: begin 
				red = 1;
				if(car) next_state = S1;
				else	next_state = S0;
			end
			S1: begin
				red = 0; yellow = 1;
				next_state = S2;
			end
			S2: begin
				yellow = 0; green = 1;
				next_state = S0;
			end
			default: next_state = S0;
		endcase
	end
endmodule
```

Instead, this is an example of Mealy machine

```verilog
always@(*) 
begin
	red = 0; yellow = 0; red = 0;
	case (current_state)
	S0:
		if(car) begin
			yellow = 1; next_state =1; 
		end
		else begin red =1; next_state = S0; 
		end
	S1:
		begin
			green=1; next_state=S2;
		end
	S2:
		begin
			red=1; next_state = S0; 
		end
	default : begin
		next_state = S0; red=1; 
		end
	endcase
end
```

## Design of a FSM

1. Identify the inputs and the outputs
2. Sketch a state transition diagram
![](../media/Pasted%20image%2020231117212201.png)
3. Write a transition table if is a Moore machine, an output table if is a Mealy machine
![](../media/Pasted%20image%2020231117212327.png)
4. Select state encoding
	Grey, binary, One-Hot
5. Write boolean equations for the next state and output logic
6. Sketch the circuit schematic