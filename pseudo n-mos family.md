
The resistance is always present, so there is always a power dissipation. You also have to take into account the partition.

With the evolution of technology the resistance was remove from a P-MOS.

![[Pasted image 20230525180515.png]]

The PMOS is always on and act as the resistor.
Why should I use this instead of a CMOS? It has always a power dissipation and a leakage current flowing.
It has some advantages:
- You can have a smaller area (The PMOS is generally bigger than the NMOS and here you always need one PMOS for the circuit)
- Only load due to NMOS, not due to PMOS compared to CMOS
	- In CMOS you always have a double load, the output capacitance of the driver is half, less dynamic power consumption, less delay
The disadvantages are:
- Static power consumption due to the PMOS always ON