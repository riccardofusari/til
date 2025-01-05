# December goals
### 12-18 dicembre
- [x] Understanding debug sub system protocol and rtl
- [ ] Understanding bus sub-system protocol and rtl
- [x] Understanding briefly the X-heep architecture
- [x] Familiarize with JTAG
### 18-22 dicembre
- [ ] Install and understand verilator
- [ ] Install and understand OpenOCD
- [ ] Test each tool with example designs
- [ ] Explore jtag sequences
	- [ ] Simulate a simple JTAG operation:
	- [ ] Implement a TAP state machine in Verilog/SystemVerilog.
	- [ ] Use Verilator to simulate and GTKWave to view the transitions.
	- [ ] Begin exploring how JTAG communicates with the debug subsystem.
### 27-30 dicembre
- [ ] research clock gating strategies (latch base gating, enable signals)
	- [ ] https://www.edn.com/clock-gating-smart-use-ensures-smart-returns/
- [ ] define module inputs/outputs and expected behavior
- [ ] draft a simple sv model
- [ ] Study how bus transactions (address, data, control) are structured in X-heep.
- [ ] Define signals to monitor and log (e.g., bus activity tracking format).
- [ ] Outline a basic design for the sniffer module.



### **5-Month Plan (December to May)**

#### **December (12th–31st): Light Foundation Work**

- **Goal**: Begin understanding X-heep and related protocols, install tools, and plan the hardware module designs.
- **Tasks**:
    - Week 1 (Dec 12–17):
        - Study X-heep's architecture:
            - Focus on the CPU subsystem, bus subsystem, and debug subsystem.
        - Review basic concepts of JTAG (TAP, IR, DR).
    - Week 2 (Dec 18–22):
        - Install and test essential tools:
            - Verilator for RTL simulation.
            - OpenOCD for debugging.
            - GTKWave for waveform visualization.
        - Explore examples of simple JTAG sequences.
    - Week 3 (Post-Holiday Break, Dec 27–30):
        - Plan the clock gating module:
            - Define its inputs/outputs.
            - Research clock gating techniques.
        - Review the design requirements for the bus sniffer module.
---

#### **January: Initial Implementation**

- **Goal**: Start developing hardware modules and familiarize yourself with OpenOCD.
- **Tasks**:
    - Week 1–2 (Jan 2–13):
        - Implement the **clock gating module** in SystemVerilog:
            - Develop and test basic functionality with a testbench.
            - Visualize outputs using GTKWave.
        - Begin exploring OpenOCD:
            - Set up a basic OpenOCD server.
            - Connect OpenOCD to a simulated JTAG interface.
    - Week 3 (Jan 16–20):
        - Design the **bus sniffer** module:
            - Draft its architecture and identify key signals to monitor.
        - Create a simple testbench for the bus sniffer.
    - Week 4 (Jan 22–31):
        - Test integration between clock gating and bus sniffer modules.
        - Debug and refine both modules.

---

#### **February: Advanced Implementation and Integration**

- **Goal**: Finalize the hardware modules and start the OpenOCD translation module.
- **Tasks**:
    - Week 1–2 (Feb 1–10):
        - Complete and verify the bus sniffer module:
            - Validate its ability to capture bus transactions.
            - Test against synthetic data.
        - Refine the clock gating module for integration with other subsystems.
    - Week 3–4 (Feb 13–28):
        - Begin developing the **OpenOCD translation module**:
            - Map bus transactions to OpenOCD Telnet commands.
        - Test basic OpenOCD interactions:
            - Memory read/write commands.
            - Debugging small program executions.

---

#### **March: Co-Emulation Setup and Testing**

- **Goal**: Integrate all components and test the co-emulation framework.
- **Tasks**:
    - Week 1–2 (Mar 1–15):
        - Combine the clock gating and bus sniffer modules with the X-heep processor.
        - Simulate and validate the integration using Verilator.
        - Add waveform tracing for debugging.
        -  Design the **UVM Testbench Architecture**:
	    - Define UVM agents for interfacing with the clock gating and bus sniffer modules.
	    - Write UVM sequences to drive transactions and check functionality.
		- Develop reusable UVM components for the testbench.
    - Week 3–4 (Mar 16–31):
        - Complete the OpenOCD translation module.
        - Verify the OpenOCD translation against real transaction scenarios.
---

#### **April: System Validation**

- **Goal**: Validate the co-emulation environment on the FPGA.
- **Tasks**:
    - Week 1–2 (Apr 1–15):
        - Test the entire co-emulation system on the Xilinx FPGA.
        - Debug and refine interactions between hardware modules and OpenOCD.
    - Week 3–4 (Apr 16–30):
        - Stress-test the system with various CPU and peripheral operations.
        - Collect performance data for the thesis documentation.

---

#### **May: Documentation and Final Adjustments**

- **Goal**: Write and finalize the thesis.
- **Tasks**:
    - Week 1 (May 1–7):
        - Document all findings and results.
        - Include diagrams, tables, and key learnings from the project.
    - Week 2 (May 8–15):
        - Revise and proofread the thesis.
        - Submit the final draft to advisors.