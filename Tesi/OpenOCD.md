**OpenOCD (Open On-Chip Debugger)** is a tool that provides **debugging, in-system programming, and boundary-scan** capabilities for embedded targets. In the context of RISC-V:

- It speaks the **JTAG** or **SWD** protocol to interface with the chip.
- You use **OpenOCD** together with GDB (the GNU Debugger) to do things like stepping through code, setting breakpoints, examining memory, etc., on a real RISC-V core or an FPGA-based SoC.

**Resources** to learn more about OpenOCD:

- **Official site**: [http://openocd.org/](http://openocd.org/)
- The **X-HEEP** docs often give usage examples (like `openocd -f xheep.cfg`) so you can see how it all fits together.