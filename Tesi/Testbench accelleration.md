Co-emulation

It's that practice that moves the DUT and the related part of the testbench that are pin level into HW to speed it up.

So now, it is possible to maximize the time spend in the emulator.

### Co-simulation
The design is moved into the emulator.

### Co-emulation
the communication with emulator is transaction-based, not cycle--based


A BFM is a simulation model used in the verification of digital systems. It abstracts the functionality of a bus interface, allowing engineers to simulate and verify interactions at a high level without focusing on lower-level signal transitions.

The clock are generated into the emulator and the throughput is no longer limited by latency.

The testbench passes multiw-clock cycle transactions to BFMs in emulator

![](media/Pasted%20image%2020241118093657.png)
![](media/Pasted%20image%2020241118093902.png)


