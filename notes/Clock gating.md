It is a power management technique which consist in disable the clock for unused circuitry for reducing dynamic power dissipation.

![](images/Pasted%20image%2020230523162649.png)

Every time you have a transition, there is an internal power consumption. The clock transition create a switching power consumption, even if in both cases we are not updating the register bank cause the output of the mux is 0.

#### Solution
Latch-based clock gating
![](images/Pasted%20image%2020230523163344.png)
Clock gating is a power-saving feature used in many synchronous circuits for reducing dynamic power dissipation. It is a technique to selectively disable clock signals to unused circuitry, thereby saving power by pruning the clock tree. Clock gating can be achieved either by software switching of power states per instructions in code or through smart hardware that detects whether there is work to be done and, if not, turns off the circuit. Clock gating groups circuits in logical blocks that are shut off when there is no work to be done. It reduces power consumption for the following reasons:

-   Power is not dissipated during the idle period when the register is shut-off by the gating function
-   Power is saved in the gated-clock circuitry

Clock gating works by taking the enable conditions attached to registers and uses them to gate the clocks. A design must contain these enable conditions in order to use and benefit from clock gating. This clock gating process can also save significant die area as well as power, since it removes large capacitive loads from the clock tree. Latch-based clock gating is a technique that adds a level-sensitive latch to the design to hold the enable signal from the active edge of the clock until the inactive edge of the clock. This technique is used to reduce power consumption in digital circuits by gating the clock signal to the registers that are not being used. Since the latch captures the state of the enable signal and holds it until the complete clock pulse has been generated, the enable signal need only be stable around the rising edge of the clock, just as in the traditional ungated design style. Clock gating is one of the simplest and most used methods to reduce the dynamic power of the desig