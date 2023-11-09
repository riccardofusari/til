AMBA is a set of interconnect specification from ARM that standardizes on chip communication mechanisms.

It is open source.

# APB

Single channel non pipelined protocol.
Low bandwith peripheral. Low frequency bus

External peripheral such as Timers, PIO, Uart/spi ar connected to APB.
then it is connected to a bridge that convert the band.

It is used for communication of external world to the processor.

## Signals description

Max 32 bit signals, except for the control signal that are 1 bit

- slave selection. 
- clock signal
- reset signal
- pwrite signal ( it is a control signal.. 0 is read, 1 write)
- address
- Enable signal. If the transfer has to happen
- write data and read data buses

## Operation of APB

3 operating states.

1. Idle state. This is the default state. Here occurs the reset and the slave selection
2. setup state. If a transfer is necessary, setup state is selected. **The slave is selected**. PEnable is low, cause the transfer happen in the access state
3. access state. PENABLE is high, address, write, select and data must be stable.
In the new version of there is a PREADY signal. If it is 0, it stays in the access state. Even if the setup is done, maybe the slave is not ready and needs more time. When PREADY is 1, the transfer happens and come back to setup phase if there is other transfer to do. Otherwise come back to idle
If there is no transfer ( The slave is not selected) and PREADY is 1 (the transfer is done) come back to idle.


# AHB

High frequency bus.

High band peripheral connected to high performance processor or Memories




