# Transmission gates capacitance
A transmission gate typically consists of a p-channel MOSFET (PMOS) and an n-channel MOSFET (NMOS) connected in parallel.

When a control signal, usually referred to as the enable or select signal, is activated, the transmission gate conducts, allowing the digital signal to pass through. This conducting state also introduces parasitic capacitance associated with the transistors.

The PMOS and NMOS transistors in a transmission gate have inherent capacitance between their various terminals, such as the gate, source, and drain. These capacitances arise due to the physical structure and operation of the transistors. When the transmission gate is conducting, these capacitances become part of the overall circuit and can affect its behavior.

In a more detailed level:
![](../media/Pasted%20image%2020230531115241.png)

##### Gate-bulk capacitance
The Cgb is the gate-bulk capacitance.
![](../media/Pasted%20image%2020230531115505.png)
The MOS is by definition a capacitor: Conductor-dielectric-conductor.
L and W are the parameters that made the major difference in the size of this.
tox is the thickness of the gate oxide (typically smaller than 100 angstrom), ε0 is the dielectric constant of the void and εr is the relative dielectric of a specific material. **In the case of SiO2 εr = 3.9**. Notice that the bigger the transistor, the bigger is this capacitance, and this is important for the gate behavior and performance.

##### Junction capacitance
Also if you think about the physical phenomena and  characteristics of a transistor, the depletion region is a no "charges zone" (cause the electrons have fed the holes) and the region around are p or n zones, i.e. "charges zone". So again charge-nocharge-charge: a natural capacitor. This is junction capacitance Cj. This is the main cause of power dissipation and delay of nowadays technology.
![](../media/Pasted%20image%2020230531121512.png)
Whenever a current flows through drain to source, the capacities are charged. There is a power dissipation and a delay due to that.
![](../media/Pasted%20image%2020230531123633.png)
the sum of the blue capacitance in which sum gives the input capacitance and they change with the voltages.

Then there are the gate bulk for the P and N MOS. 

The red are the junction capacitance, which sum determines the intrinsic capacitance.

The Cout is the sum of intrinsic capacitance, interconnection capacitance and load capacitance.




#### See also
- [Transmission gates](transmission-gates.md)
- [switch-model](switch-model.md)