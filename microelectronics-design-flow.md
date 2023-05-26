# Microelectronics design flow
![](Pasted%20image%2020230526100552.png)

It is composed of:
- **Modeling**, by an HDL. The modeling can be further subdivide depending on the abstracion levels and views. 
	- The abstraction layers (the circles of the Y chart) can be 
		- **Architectural** (resources such as adders, multipliers...)
		- Logic (gates, FF, switches)
		- Physical (layout, physical devices)
	- The Views (The Y of the Y charts) can be
		- Behavioral, that contains abstract functionalities
		- Structural, that contains interconnections of blocks
		- Physical, that contains the position and connection of the physical primitives
- Synthesys and Optimization
	- Architectural, macroscopic structure
	- Logic synthesis, microscopic structure
	- Circuital synthesis, physical design
- Verification
  
Usually the steps are
1. RTL behavioral view
2. Synthesis of RTL level
3. Optimization at RTL level
4. Move to logic level behavioral view
5. Synthesis at logic level
6. Optimization
7. Floorplanning

![](Pasted%20image%2020230526101407.png)
