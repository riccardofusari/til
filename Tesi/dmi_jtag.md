> The **`dmi_jtag` module** acts as a bridge between the JTAG interface and the Debug Module Interface (DMI). Its main function is to process JTAG transactions (bitstreams) and convert them into structured DMI requests, which are then handled by the debug logic. 

**DMI as a structured protocol that translates serialized JTAG inputs into well-defined operations for the debug subsystem.**
- ***Each DMI request*** (`dmi_req`) is like a packet containing:
    - Header (address + op type).
    - Payload (data for write operations).
- It ensures that all debug operations are atomic and consistent.

- ***Each DMI response*** (dmi_resp) is like a packet containing
	- resp (encodes the status with error handling (noerror, busy, failure))
	- data


---
# JTAG
JTAG is used as a **transport protocol** to send debug commands from OpenOCD to the SoC and receive responses.

Into the chip, the jtag protocol is managed by the TAP (Test Access Point) finite state machine. 

**Signals**:
- **`tck`**: Drives state transitions.
- **`tms`**: Determines the next state in the FSM.
- **`tdi`**: Serial input for instructions or data.
- **`tdo`**: Serial output for system responses.

The state of the fsm are 16 and they differ from the kind of register it triggers, if data register or instruction register. 
If instruction register tells the system what operation is doing.
If data registers it holds the data associated with the current instruction in the IR

In this case there are just 2 instruction register
- DMI
- IDCODE, that gived the identification code of the jtag transaction

The FSM has a tree-like structure:

- **`tms = 0`** typically moves the FSM "down" into more functional states (e.g., `Shift-DR` or `Shift-IR`).
- **`tms = 1`** typically moves the FSM "up" or to control states (e.g., `Exit` or `Update`).
## Summary
1. **Purpose**:
    
    - JTAG is used as a **transport protocol** to send debug commands from OpenOCD to the SoC and receive responses.
    - It operates via the TAP (Test Access Port) FSM.
2. **Key Components**:
    
    - **TAP FSM**:
        - Manages the flow of instructions and data via `tms` transitions.
        - Handles the **Instruction Register (IR)** and **Data Register (DR)** paths.
    - **Instruction Register (IR)**:
        - **Single IR** in your design, 5 bits wide (`IrLength`).
        - Holds instructions like `DMI` (for Debug Module Interface operations).
    - **Data Register (DR)**:
        - Holds request and response data (e.g., address, data, operation type).
        - For `DMI`, DR is 40 bits: 7-bit address, 32-bit data, and 2-bit operation.
        - Implements a shift register (`dr_q`) to process JTAG input bitstreams.
        - As data is shifted in (`tdi`), it updates internal registers for address, data, and operation type.
1. **Signals**:
    
    - **`tck`**: JTAG clock driving FSM transitions.
    - **`tms`**: Determines FSM state transitions (e.g., `Shift-IR`, `Shift-DR`, `Update`).
    - **`tdi`**: Serial input (instructions and data).
    - **`tdo`**: Serial output (responses).
4. **Workflow**:
    
    - OpenOCD sends a debug command (e.g., read a CPU register).
    - The TAP FSM:
        1. Shifts the `DMI` instruction into the IR.
        2. Shifts the DMI request (address, operation) into the DR.
        3. Processes the request and shifts the response (e.g., register value) out via the DR.
    - The result is passed back to OpenOCD.
5. **Key States in TAP FSM**:
    
    - `Shift-IR`: Shift the instruction into the IR.
    - `Shift-DR`: Shift the request/response data into/out of the DR.
    - `Update-IR`/`Update-DR`: Commit the instruction/data for execution.
6. **Supported Instructions (IR)**:
    
    - **`DMI`**: Debug Module Interface access.
    - **`IDCODE`**: Device identification.
    - **`BYPASS`**: Minimal latency passthrough.

---

# DMI

- **Purpose**:
    - The **Debug Module Interface (DMI)** bridges the JTAG protocol and the SoC's internal debug functionality (via OBI transactions).
    - It translates **JTAG requests** into actionable commands for the debug module and returns the results.
- **Key Components**:
    - **`dmi_req`** (Request):
        - Encodes the debug operation:
            - **Address**: 7 bits (target memory/register).
            - **Data**: 32 bits (payload for write operations).
            - **Operation**: 2 bits (`00` = NOP, `01` = Read, `10` = Write).
    - **`dmi_resp`** (Response):
        - Contains the operation result:
            - **Response Code** (2 bits):
                - `00`: Success.
                - `10`: Operation failed.
                - `11`: Debug module is busy.
            - **Data**: 32 bits (result of read operations or diagnostic data).
- **Workflow**:
    - A DMI request is created by the `dmi_jtag` module from the shifted DR data.
    - The request is processed by the debug module:
        - For **Read**: Accesses memory or registers and returns the value.
        - For **Write**: Writes data to the specified address.
    - The response is encoded into `dmi_resp` and shifted out through JTAG.
- **Error Handling**:
    - **`DMIBusy` (11)**: The debug module is busy. OpenOCD can retry the operation.
    - **`DMIOPFailed` (10)**: Invalid operation or address. Signals a critical issue.
    - Errors are sticky and must be cleared explicitly.
- **Integration with JTAG**:
    - JTAG shifts the DMI request (via DR) and shifts out the response (via `tdo`).
    - The `dmi_jtag` module synchronizes this process, ensuring proper handoff between clock domains (JTAG `tck` and debug core `clk`).

4. **Clock Domain Crossing (CDC):**
    
    - Synchronizes signals between the JTAG clock domain (`tck_i`) and the core debug clock domain (`clk_i`).


---

# State Machine for DMI Requests

- **Purpose**: Controls the flow of DMI transactions based on JTAG operations.
- **States**:
    - `Idle`: Waits for a valid JTAG command.
    - `Read`: Sends a read request and transitions to `WaitReadValid`.
    - `WaitReadValid`: Waits for the core to provide the read data.
    - `Write`: Sends a write request and transitions to `WaitWriteValid`.
    - `WaitWriteValid`: Waits for an acknowledgment of the write operation.

- **FSM (Finite State Machine) Interaction**:
    
    - When a valid request is captured (`capture` signal), the FSM transitions to the appropriate state (`Read` or `Write`) based on the operation code.
    - The `dmi_req_valid` signal is asserted to indicate the request is ready to be processed.
-  **Example Encoded DMI Request**: For a write operation to address `0x12` with data `0xCAFEBABE`:
    
    - Address: `00010010` (binary for 0x12).
    - Data: `11001010111111101011101011101110` (binary for 0xCAFEBABE).
    - Operation Code: `10` (binary for write).

