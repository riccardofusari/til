# Decoders
A decoder is a combinational logic circuit that takes an input code and generates an output based on the input value. It is used to convert coded information into a different format or to activate specific output lines based on the input code.
# Dynamic decoders
![[media/Pasted image 20230525162022.png]]

The pink PMOSes are connected to the output line. The gates are connected to the ENABLE.

If the ENABLE is '0', the PMOSes are activated and so we are pre-charging all the lines: the parasitic capacitance that are present will be pre-charged. This is the pre-charge phase.

A transistor is connected between the pre-charged line and a GND line. The gates are connected to A0. The same for A0 negated in an alternative way.

A similar configuration but a group of two alternate.

How can you scale up?


### See also
- [Transmission gates capacitance](notes/transmission-gates-capacitance.md)
- [Binary shifter](binary-shifter.md)
- [Barrel shifter](barrel-shifter.md)
- [Logarithmic shifter](notes/logarithmic-shifter.md)