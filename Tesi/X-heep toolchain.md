
## Server
`ssh -p 50120 riccardo.fusari@saruman.polito.it
Ti consiglio di cambiare la password (con `passwd`) la prima volta che accedi, generare una coppia di chiavi RSA e usare quelle per fare il login dal tuo PC (cerca info su `ssh-keygen` e `ssh-copy-id` sul web per i dettagli).

Remmina
- Server: [saruman.polito.it:50121](https://link.getmailspring.com/link/88C871CF-A82D-426E-8CC8-D6F428718EC2@getmailspring.com/1?redirect=saruman.polito.it%3A50121&recipient=dmluY2Vuem8ucGV0cm9sb0Bwb2xpdG8uaXQ%3D "https://link.getmailspring.com/link/88C871CF-A82D-426E-8CC8-D6F428718EC2@getmailspring.com/1?redirect=saruman.polito.it%3A50121&recipient=dmluY2Vuem8ucGV0cm9sb0Bwb2xpdG8uaXQ%3D") (o 50131)
- Username e password: gli stessi di SSH

Dalle reti WiFi del Poli non puoi accedere direttamente a Saruman, devi prima rimbalzare su un server interno, come quelli VLSI (cerca SSH proxy jump sul web). In alternativa, puoi richiedere e usare la VPN di Ateneo (dovrebbe esserci un modulo su [IntraDET](https://link.getmailspring.com/link/88C871CF-A82D-426E-8CC8-D6F428718EC2@getmailspring.com/2?redirect=https%3A%2F%2Fintradet.polito.it%2Fpolito-vpn&recipient=dmluY2Vuem8ucGV0cm9sb0Bwb2xpdG8uaXQ%3D "https://link.getmailspring.com/link/88C871CF-A82D-426E-8CC8-D6F428718EC2@getmailspring.com/2?redirect=https%3A%2F%2Fintradet.polito.it%2Fpolito-vpn&recipient=dmluY2Vuem8ucGV0cm9sb0Bwb2xpdG8uaXQ%3D")).

  

**Istruzioni per EDA tools sul container CentOS**

### Questa
Gli script di inizializzazione dei tool EDA (QuestaSim, Synopsy DC, ecc) sono in `/eda/scripts/`, come sui server VLSI. Ad esempio, per lanciare QuestaSim:

`source` `/eda/scripts/init_questa`

`vsim -c`

In `software/riscv` ci sono le toolchain RISC-V configurate e compilate con multilib per supportare diverse combinazioni ISA e ABI. In particolare, sono installate due toolchain GNU generiche (che supportano target a 32 e 64 bit): baremetal basata su Newlib e Linux. 

### PULP toolchain
E' anche installata la toolchain di PULP con supporto alle Pulp Extensions. Gli script di inizializzazione delle toolchain sono in `/software/scripts/`. Ad esempio, per aggiungere la toolchain di Pulp al `PATH`, usa:

`source` `/software/scripts/init_riscv_pulp`  
`riscv32-unknown-elf-gcc --version`

### X-HEEP
I tool per utilizzare X-HEEP sono in `/software/x-heep`. Per inizializzare l'environment:

`source` `/software/scripts/init_x_heep`
# Big picture
## You have an SoC design in RTL (the “X-HEEP RTL code”)

- Think of this as **hardware written in SystemVerilog**.
- It describes a **microcontroller (MCU)** that contains:
    - A **RISC-V CPU core**
    - Memories (RAM, ROM, etc.)
    - Peripherals (UART, GPIO, debug, etc.)
    - Interconnect (the bus)
- This is _not_ software code; it is a _hardware design_ that, when synthesized, becomes gates (on FPGA or ASIC).
## You have an application in C (e.g. “hello-world.c”)

- This is **software** that will **run on** that RISC-V CPU inside the SoC.
- It’s compiled with a **RISC-V cross-compiler** (the “riscv-none-elf-gcc”), producing a RISC-V **binary** (ELF or `.bin`) that the CPU can execute.
- The key is: the CPU inside the RTL design will **fetch** those instructions at runtime (just like any embedded CPU).
## 3. Simulation flow (using Verilator)

In a typical “simulate and run hello-world” flow:

1. **Verible** (optional)
    
    - Before anything, you might run **Verible** to **lint** or **format** the SystemVerilog code. This doesn’t create a “simulation image” — it just checks code style or coding-rule compliance.
    - You can skip it if you just want to compile/simulate, but it’s useful for clean code.
2. **Verilator**
    
    - You run a command like `make sim` (or something similar) that calls **Verilator**.
    - **Verilator** **translates** your SystemVerilog RTL into a big chunk of C++ code.
    - Then it **compiles** that C++ code into an **executable simulator**.
        - So you end up with something like `./Vmy_top_sim`, which is a program representing your hardware.
    - When you start that simulator executable, it’s as if you have a “virtual” SoC in software.
3. **Loading the compiled C app**
    
    - Meanwhile, your “hello-world.c” is compiled with the RISC-V toolchain, producing a RISC-V ELF or `.bin`.
    - The simulation environment (Verilator model) **loads** that `.bin` into its simulated memory (like “internal ROM” or “load into the simulated RAM”).
    - The simulated CPU (in that Verilator model) **begins fetching** instructions from the memory where hello-world was placed.
4. **Execution**
    
    - The simulated CPU executes your compiled code, instruction by instruction, within the Verilator simulation.
    - If “hello world” prints to a UART, the simulation might show “Hello World” on the simulator console (or a UART log in the simulator).

In other words, **Verilator** is acting like a high-speed software copy of your entire SoC. You’re not building a “real hardware chip” yet — you’re building a **software model** that can run your RISC-V binary.

## Real hardware flow (FPGA or ASIC)

If you later put the design on an **FPGA**:

1. The same SystemVerilog code is **synthesized** (not by Verilator, but by FPGA tools like Vivado or Quartus).
2. You still compile “hello-world.c” with the RISC-V toolchain to produce a RISC-V binary.
3. You **flash** or load that binary into the FPGA’s memory (or external flash).
4. The real RISC-V CPU (fabricated inside the FPGA logic) executes that code.
5. You can use **OpenOCD** to debug the real hardware over JTAG.

That’s the exact same concept, just not in a software simulation.

## 6. Recap: The Big Picture

1. **You have a hardware design**: X-HEEP SoC in SystemVerilog.
2. **You have a software program**: “hello-world.c”.
3. **You compile** the SoC design into a software-based simulator via **Verilator**.
4. **You compile** “hello-world.c” into a RISC-V binary using the **RISC-V compiler**.
5. **You run** the simulator, loading that RISC-V binary into the simulated memory.
6. The **simulated CPU** (inside the Verilator model) fetches instructions from that memory and “executes” them.
7. If your program does I/O (like printing), the simulator mimics the SoC peripherals (like UART) and prints output to your console or a log.

