The debug sub system is 
![](../media/Pasted%20image%2020241214200022.png)

# Debug sub system flow
### **1. External Control via OpenOCD**

- **Input Source**: The debug operations originate from the OpenOCD server.
    - OpenOCD receives commands from a user or script (e.g., via GDB or Telnet interface).
    - These commands might include operations like halting a core, reading memory, or writing to registers.
- **Output to JTAG**: OpenOCD translates these commands into JTAG bitstreams, which it sends over the physical JTAG interface to the debug subsystem.

---
### **2. JTAG Protocol in the Debug Subsystem**

- **Role**: JTAG acts as the transport layer for communication between OpenOCD and the on-chip debug subsystem.
- **Core Functionality**:
    - The **`dmi_jtag` module** receives JTAG inputs (`tms`, `tdi`, `tck`) and decodes them.
    - It converts the serialized bitstream into structured **DMI requests (`dmi_req`)** that the debug module can process.


---
### **3. DMI: Translating High-Level Commands**

- **Role**: DMI bridges JTAG with the internal debug logic.
    - **Example Operations**:
        - Accessing hart (core) state: e.g., halting a core or inspecting its registers.
        - Reading/writing memory addresses or control registers.
- **Structure**:
    - **`dmi_req`:** Encodes the operation type, address, and data payload.
    - **`dmi_resp`:** Contains the results of the operation, such as read data or acknowledgment.

---
### **OBI: High-Speed Internal Transactions**

- **Role**: The **`dm_obi_top` module** translates DMI requests into memory-mapped transactions on the SoC's OBI interconnect.
    - **Master Interface (`debug_master_*`)**:
        - Sends OBI requests to other modules in the SoC, such as memory controllers or peripheral registers.
    - **Slave Interface (`debug_slave_*`)**:
        - Receives responses to the initiated transactions, completing the request-response cycle.
- **Key Features**:
    - Efficient handling of high-speed, parallel transactions.
    - Compatibility with other SoC components via standardized signaling.

### **Flow Summary**

1. **Command Origin**: User sends a command to OpenOCD (e.g., read register `x` on hart `0`).
2. **JTAG Encoding**: OpenOCD translates the command into JTAG bitstreams.
3. **DMI Translation**: `dmi_jtag` decodes the JTAG signals and converts them to structured DMI requests.
4. **OBI Execution**: `dm_obi_top` interprets the DMI request and performs an OBI transaction, interacting with the requested system resource.
5. **Response Chain**: Results flow back from OBI to DMI and then to the user via OpenOCD.





**JTAG (Joint Test Action Group) Protocol**:

- **Purpose**: JTAG provides a standardized way to perform testing, programming, and debugging via a serial interface. It is widely used for hardware debugging in embedded systems.
- **Signals**:
    - `tck_i`: Clock signal for the JTAG chain.
    - `tms_i`: Test Mode Select signal for state machine control.
    - `tdi_i` / `tdo_o`: Data input/output for shift registers.
    - `trst_ni`: Optional reset signal for the TAP controller.
- **Key Component**: The `dmi_jtag` module translates JTAG commands into DMI transactions.

## 2. Che cosa fa a runtime: fermare, ispezionare e resettare la CPU

Il debug module può:

- **Fermare** il core (o i core, se `NRHARTS > 1`) e metterlo in “debug mode” (`debug_core_req_o`).
- **Leggere/scrivere** i registri interni del core (tramite la catena RISC-V Debug Spec).
- **Effettuare accessi in memoria** (tramite l’interfaccia `debug_master_req_o` sul bus), per caricare programmi, ispezionare RAM, leggere/scrivere registri di periferiche, ecc.
- **Resettare** il core o l’intero SoC (tramite `debug_ndmreset_no` e `ndmreset`).

Queste funzioni sono poi rese disponibili a strumenti esterni (OpenOCD, GDB, ecc.) attraverso i comandi inviati in JTAG.


- **DMI (Debug Module Interface)**:
    - **Purpose**: Facilitates communication between the JTAG interface and the Debug Module (DM) for debugging operations such as accessing processor registers or memory.
    - **Data Structures**:
        - `dmi_req` and `dmi_resp`: Carry commands and responses between JTAG and the DM.
    - **Key Component**: The `dm_obi_top` module processes DMI requests and coordinates debugging tasks with the processor cores (harts).
- **OBI (Open Bus Interface)**:
    - **Purpose**: Manages memory-mapped transactions between components. The debug subsystem uses OBI to access and control SoC resources.
    - **Signals**:
        - Slave interface (`debug_slave_*`): Receives debug commands.
        - Master interface (`debug_master_*`): Issues commands to the rest of the system.
    - **Key Operations**:
        - Read/write access to registers or memory.
        - Transaction validity and acknowledgment signaling.




**`debug_ndmreset_no`**
- **Meaning**:
    - This signal is the **non-debug module reset** (NDM reset), output from the debug subsystem to other SoC components.
    - Its active state (`0`) resets non-debug functionality in the system, allowing the debug logic to remain operational even when the rest of the SoC is reset.
- **Scope**:
    - Ensures that the debug subsystem remains functional during resets, which is critical for operations like stepping through processor instructions or debugging an SoC crash.
    - Commonly used in RISC-V or other architectures where the debug subsystem must remain independent of the core logic reset.
- **Use Case**:
    - During debugging, this signal might be controlled to reset peripherals or CPU subsystems while maintaining debug connectivity.
    - Managed by the `dm_obi_top` logic that coordinates the overall reset state (`ndmreset`).

### **2. `debug_core_req_o`**

- **Meaning**:
    - This is an **array of debug requests**, one for each hart (hardware thread or core) in the system, with `NRHARTS` determining the number of cores.
    - Each bit in `debug_core_req_o` corresponds to a specific core, indicating whether the debug module is requesting control over that core.
- **Scope**:
    - Used to notify specific cores that they are under debug control.
    - Enables selective halt, inspection, or execution of cores during debugging.
- **Use Case**:
    - A debugger (like OpenOCD) can assert this signal for a particular hart to stop execution, inspect registers, or step through instructions.
    - Typically driven by the Debug Module (`dm_obi_top`), which generates this signal based on incoming debug commands from the DMI or JTAG.

### **Interaction in Debug Scenarios**

- During debugging:
    1. **`debug_ndmreset_no`** ensures the rest of the system can be reset without losing debugging capabilities.
    2. **`debug_core_req_o`** allows precise control over which cores (harts) are being debugged, enabling efficient multi-core debugging.