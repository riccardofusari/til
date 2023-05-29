# Barrel Shifter

![../media/Pasted%20image%2020230525142615.png](../media/Pasted%20image%2020230525142615.png)

Here you can shift of a certain amount of position altogether, compared to [Binary shifter](binary-shifter.md). 

## Behaviour
- Input and output are connected to a different line. The pink transistors connect this two line. By activating this transistor, this two line are in contact and the output is the same as the input. No shift.
- Then connecting the lines each other, by choosing the correct signal you can shift by any position.
- The last bit (at the top), the bit is repeated (B3 in this case).

So by a shift of two, the last two bits are repeated. The same for three bits and so on. 

From the organizational point of view this is extremely compact and the performances are very good. However, by increasing the number of bits, there are several parameters that influence performance. All the vertical lines and horizontal lines has a parasitic capacitance. Increasing the number of bits, you will need a longer line and an increase in resistance and capacitance.
Moreover, the delay increases due to the "distance".

Not only the lines has capacitance. Of course, also the transistor has one for each pin (source, drain and gate). This capacitance is there independently of the status of the transistor (on or off), even though the values of this capacitance could change from the two states.

Zooming to A1, just for 4 bit shifter there are in a line a lot of parasitic capacitance.

![[../media/Pasted image 20230525144637.png]]

#### See also
- [Transmission gates capacitance](transmission-gates-capacitance.md)
- [Transmission gates](transmission-gates.md)
- [Logarithmic shifter](logarithmic-shifter.md)
