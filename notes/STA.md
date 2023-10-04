
Static timing analysis (STA) is a method of validating the timing performance of a design by checking all possible paths for timing violations. STA breaks a design down into timing paths, calculates the signal propagation delay along each path, and checks for violations of timing constraints inside the design and at the input/output interface.

Another way to perform timing analysis is to use **dynamic simulation**, which determines the full behavior of the circuit for a given set of input stimulus vectors. Compared to dynamic simulation, static timing analysis is much faster because it is not necessary to simulate the logical operation of the circuit. STA is also more thorough because it checks all timing paths, not just the logical conditions that are sensitized by a set of test vectors. However, STA can only check the timing, not the functionality, of a circuit design.

When performing timing analysis, STA first breaks down the design into timing paths. Each timing path consists of the following elements:

- **Startpoint.** The start of a timing path where data is launched by a clock edge or where the data must be available at a specific time. Every startpoint must be either an input port or a register clock pin.
- **Combinational logic network.** Elements that have no memory or internal state. Combinational logic can contain AND, OR, XOR, and inverter elements, but cannot contain flip-flops, latches, registers, or RAM.
- **Endpoint.** The end of a timing path where data is captured by a clock edge or where the data must be available at a specific time. Every endpoint must be either a register data input pin or an output port.

The following figure shows the timing paths in a simple design example:
![](../media/Pasted%20image%2020230918083330.png)

STA then checks for violations of timing constraints, such as setup and hold constraints:

A setup constraint specifies how much time is necessary for data to be available at the input of a sequential device before the clock edge that captures the data in the device. This constraint enforces a maximum delay on the data path relative to the clock edge.
A hold constraint specifies how much time is necessary for data to be stable at the input of a sequential device after the clock edge that captures the data in the device. This constraint enforces a minimum delay on the data path relative to the clock edge.
The following example shows how STA checks setup and hold constraints for a flip-flop:

![](../Pasted%20image%2020230918083516.png)