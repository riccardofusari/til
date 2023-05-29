# Transmission Gates
In digital design, a transmission gate is a type of electronic switch that can control the flow of digital signals. It is commonly used in integrated circuits (ICs) for various purposes, such as multiplexing, signal routing, and level shifting. The transmission gate consists of complementary metal-oxide-semiconductor (CMOS) transistors configured in a specific way to allow the passage of digital signals.

![../media/Pasted%20image 20230525154810.png](../media/Pasted%20image%2020230525154810.png)

If C= '1' both the MOS transistors are in conduction, so B=A and the value will be efficiently reached independently of input value ('1' or '0'). This works because if the input is a 0 the NMOS will conduct most of the current; on the contrary, if the input is a 1, the PMOS will be the conductive one.

They are heavily used for multiplexers, decoders and shifters.

##### Advantages
- Compactness
- Low power consumption

###### Disadvantages
- Low driving capabilities. They are not perfect switch and the parasitic capacitance and resistance reduce the voltage output. A solution of this problem may be to add buffers in the circuit to regenerate the signal.

### See also
- [cmos](cmos.md)
- [Transmission gates capacitance](transmission-gates-capacitance.md)
- [Dynamic Decoders](dynamic-decoders.md)
- [Binary shifter](binary-shifter.md)
- [Barrel shifter](barrel-shifter.md)
- [Logarithmic shifter](logarithmic-shifter.md)
