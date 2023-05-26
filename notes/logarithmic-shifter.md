# Logarithmic shifter
![../media/Pasted%20image%2020230525145420.png](../media/Pasted%20image%2020230525145420.png)

A0 can be connected directly to the output B0 with a series of (in this case) three transistors.
The gates are connected to the negated control signals.
The connection is active only if all the three transistors are on (activated through the controls signals).

###### Blue transistors
By connecting the A0 through A1, The first transistor of each line is bypassed with a new transistor. All this new transistors are connected to the control signal. If the SH1 is 1, the negated is zero and  the only available is the one below. You are shifting of one bit!
![[media/Pasted image 20230525145916.png]]

###### Pink transistors
With that transistors, (connecting a line with the one two position above), you are bypassing the two transistors. It is a shift by two. Indeed, in order to connect this transistor, SH2 should be 1 and so the negated 0 (putting off the second transistor).

BUT, if also the blue transistor is activated, the shift is not of two bits, but of three! 

###### Other colours
That's the same procedure depending the number of bits of the shifter

![[media/Pasted image 20230525150534.png]]

That's characteristic it is better than the [[barrel-shifter]], because with the latter you need to add a transistor for each shift that you want to make. Instead, with the logarithmic you can do a lot of shift with always three transistors.

However, the parasitic capacitance is always there due to the lines connections. In fact, the capacitance of all the connection are still there even if the transistors are off.

#### See also
- [Transmission gates](transmission-gates.md)
- [Transmission gates capacitance](transmission-gates-capacitance.md)
- [Dynamic Decoders](dynamic-decoders.md)
- [Binary shifter](binary-shifter.md)
- [Barrel shifter](barrel-shifter.md)
