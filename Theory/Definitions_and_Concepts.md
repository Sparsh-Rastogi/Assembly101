# EC-321 Definitions, Full Forms and Concepts

Compiled from `Theory/` notes (`8085_Instructions.md`, `8086_Commands.md`, `8051.md`, `8155.md`, `8255.md`) and `endterm_file.pdf` (End-Term, Odd Semester 2025–26). This file is a glossary of terms and ideas; instruction mnemonics and chip pin tables remain in the source notes.

---

## 1. Full Forms (Expansions)

| Abbreviation | Full form |
| :--- | :--- |
| **ADC** | Analog-to-Digital Converter |
| **ALE** | Address Latch Enable |
| **ALU** | Arithmetic Logic Unit |
| **BCD** | Binary Coded Decimal |
| **BHE** | Bus High Enable |
| **BSR** | Bit Set/Reset (8255 mode) |
| **CE** | Chip Enable |
| **CS** | Chip Select |
| **CWR** | Control Word Register |
| **DAC** | Digital-to-Analog Converter |
| **DIP** | Dual In-line Package |
| **DPTR** | Data Pointer |
| **DRAM** | Dynamic Random Access Memory |
| **EA** | External Access (8051 pin `EA/VPP`) |
| **EI / DI** | Enable Interrupts / Disable Interrupts |
| **EPROM** | Erasable Programmable Read-Only Memory |
| **FIFO** | First In, First Out |
| **GND** | Ground |
| **HDL** | Hardware Description Language |
| **IDE** | Integrated Development Environment |
| **IE / IP** | Interrupt Enable / Interrupt Priority (8051 SFRs) |
| **INTR** | Interrupt Request (ADC0804 end-of-conversion; also 8086 maskable interrupt pin) |
| **I/O** | Input/Output |
| **IO/M̄** | Input-Output / Memory (8085: 1 = I/O, 0 = memory) |
| **IRQ** | Interrupt Request |
| **ISR** | Interrupt Service Routine |
| **LCD** | Liquid Crystal Display |
| **LED** | Light Emitting Diode |
| **LSB / MSB** | Least / Most Significant Bit (or Byte) |
| **MMU** | Memory Management Unit |
| **MN/MX** | Minimum / Maximum mode (8086 pin) |
| **MIPS** | Million Instructions Per Second |
| **NMI** | Non-Maskable Interrupt |
| **PC** | Program Counter |
| **PPI** | Programmable Peripheral Interface (8255) |
| **PSEN** | Program Store Enable |
| **PSW** | Program Status Word |
| **PWM** | Pulse Width Modulation |
| **RAM** | Random Access Memory |
| **RD / WR** | Read / Write |
| **RIM / SIM** | Read Interrupt Mask / Set Interrupt Mask (8085) |
| **ROM** | Read-Only Memory |
| **RTC** | Real-Time Clock |
| **SCON / SBUF** | Serial Control / Serial Buffer (8051) |
| **SFR** | Special Function Register |
| **SP** | Stack Pointer |
| **SPICE** | Simulation Program with Integrated Circuit Emphasis |
| **SRAM** | Static Random Access Memory |
| **TCON / TMOD** | Timer Control / Timer Mode (8051) |
| **UART** | Universal Asynchronous Receiver/Transmitter (serial port role) |
| **VCC / VSS** | Positive supply / ground (chip power pins) |
| **µC / µP** | Microcontroller / Microprocessor |

---

## 2. Computing Foundations

### Microprocessor vs microcontroller

- **Microprocessor:** CPU on a chip. Memory, I/O and timers are mostly **external**. Used as the brain of a general-purpose computer (8085, 8086).
- **Microcontroller:** CPU **plus** on-chip ROM/RAM, timers, serial port and I/O ports (8051). Built for embedded control.

### Classical computing vs quantum computing

| Aspect | Classical | Quantum |
| :--- | :--- | :--- |
| Information unit | **Bit** — 0 or 1 | **Qubit** — can be 0, 1, or a superposition of both |
| State space | \(n\) bits → \(2^n\) distinct states, one at a time | \(n\) qubits → a \(2^n\)-dimensional superposition |
| Operations | Deterministic / probabilistic Boolean logic | Unitary gates; measurement collapses the state |
| Parallelism | Sequential or multi-core classical parallelism | Amplitude interference over many basis states |
| Copying | Bits can be copied | **No-cloning:** unknown quantum states cannot be copied |
| Typical hardware | CMOS logic, SRAM/DRAM, cache | Superconducting circuits, trapped ions, photons, etc. |

### Qubit, superposition, entanglement

- **Qubit:** two-level quantum system whose state is \(\lvert\psi\rangle = \alpha\lvert 0\rangle + \beta\lvert 1\rangle\) with \(\lvert\alpha\rvert^2 + \lvert\beta\rvert^2 = 1\).
- **Superposition:** the qubit is not “both 0 and 1 classically”; it is a linear combination until **measurement**, which yields 0 or 1 with probabilities \(\lvert\alpha\rvert^2\) and \(\lvert\beta\rvert^2\).
- **Entanglement:** two (or more) qubits share a joint state that cannot be written as a product \(\lvert\psi_A\rangle\otimes\lvert\psi_B\rangle\). Measuring one instantly correlates the other (e.g. Bell state \(\frac{1}{\sqrt{2}}(\lvert 00\rangle+\lvert 11\rangle)\)).

### MIPS, HDL, SPICE (exam expansions in context)

- **MIPS:** performance metric — roughly how many million instructions the processor completes per second.
- **HDL:** languages (VHDL, Verilog) that **describe** digital hardware for simulation and synthesis, not a CPU instruction set.
- **SPICE:** analog/mixed-signal **circuit simulator** used to verify transistor-level behaviour of ICs.

---

## 3. Memory, Cache and Multi-Core

### Memory types

- **SRAM:** static RAM; bistable latches; fast; used for **cache** and small on-chip RAM (e.g. 8155’s 256×8). Does not need refresh.
- **DRAM:** dynamic RAM; stores charge on capacitors; **needs periodic refresh**; denser and cheaper for main memory.
- **EPROM:** non-volatile; programmed electrically, erased by UV; used as firmware/ROM in microprocessor systems.
- **MMU:** hardware that translates virtual addresses to physical addresses, enforces protection, and supports paging.

### Cache

**Cache** is a small, fast SRAM close to the CPU that holds recently used instructions/data so the CPU does not wait on slow main memory.

Typical interfacing idea:

```
CPU  <->  Cache (SRAM)  <->  Main memory (DRAM)
              ^
         control: hit/miss, tag compare, write policy
```

- **Cache hit:** requested address is found in cache; data is returned with low latency.
- **Cache miss:** address is not in cache; a block is fetched from main memory (or a lower cache), then the access completes. Misses cost many more cycles than hits.

### Multi-core processors

**Advantage:** several CPU cores on one die share caches/memory fabric, so independent threads (or processes) run **truly in parallel**, raising throughput without only raising clock frequency (which hits power/heat limits).

| Single-core | Multi-core |
| :--- | :--- |
| One execution engine; concurrency via time-slicing | Two or more cores execute at the same time |
| Performance mainly from clock, pipeline, ILP | Performance from **thread-level parallelism** plus per-core ILP |
| Simpler programming model | Needs parallel software; cache coherence between cores |

---

## 4. Bus Interfacing Concepts

**Microprocessor-mediated bus interfacing** connects CPU, memory and I/O through shared **address, data and control** buses. Only one device drives the data bus at a time (tri-state buffers).

| Signal group | Role |
| :--- | :--- |
| **Address bus** | CPU puts the location of memory or I/O |
| **Data bus** | Bidirectional transfer of instruction/data bytes (or words) |
| **Control** | `RD̅`, `WR̅`, `IO/M̄` or `M/IO̅`, `ALE`, `BHE̅`, interrupt and ready lines |
| **Chip select** | Decoder uses high address bits so only the intended IC is enabled |

**Timing diagram idea:** `ALE` (or equivalent) latches the address; then `RD̅` or `WR̅` goes low for a fixed number of T-states; data is valid near the end of the read/write pulse. A **READY** (or wait-state) line can stretch the cycle for slow peripherals.

**Two ways to attach peripherals** (`8155.md`):

| Directly on the µP bus | Through programmable ICs |
| :--- | :--- |
| Address, data, control wired to latches/buffers | Chips such as 8155, 8255, 8279 |
| Hard-wired, little software flexibility | Modes and ports configured by **control words** |

**Why a latch for output and a tri-state buffer for input:**

- **Output (74LS373 latch):** CPU write is a short pulse; the latch **holds** the last byte so LEDs/displays stay stable.
- **Input (74LS245 buffer):** switches must **not** drive the data bus except during `IN`; CS̅ + IORD̅ enable the buffer, then it returns to high-Z.

---

## 5. Addressing Modes

| Mode | Meaning | Example |
| :--- | :--- | :--- |
| **Immediate** | Operand is **part of the instruction** (constant after the opcode) | 8085 `MVI A,32H` / `ADI 05H`; 8086 `MOV AX,1234H` |
| **Implicit (implied)** | Operand is **fixed by the opcode**; not named in the instruction | 8085 `CMA`, `STC`, `RLC`, `NOP`; 8086 `CLC`, `CLD`, `NOP` |
| Direct | Instruction contains the **memory address** | 8085 `LDA 2050H`; 8086 `MOV AX,[2000H]` |
| Register | Operand is a CPU register | 8085 `MOV A,B`; 8086 `ADD AX,BX` |
| Register indirect | Address is in a register/pair | 8085 `LDAX B`; 8086 `MOV AL,[BX]` |
| Indexed / based (8086) | Address = base + index + displacement | `MOV AL,[BX+SI+5]` |

---

## 6. 8085 Microprocessor

### Architecture snapshot

8-bit data bus, 16-bit address bus (64 KB memory). Registers: **A** (accumulator), **B, C, D, E, H, L**, **SP**, **PC**, flag register (PSW when paired with A). Register pairs: **BC, DE, HL, PSW**.

### Flags (condition codes)

| Flag | Role |
| :--- | :--- |
| **S** Sign | MSB of result; 1 = negative in 2’s complement |
| **Z** Zero | Result is zero |
| **AC** Auxiliary carry | Carry from bit 3 to 4 (BCD/`DAA`) |
| **P** Parity | 1 if even number of 1s in the result |
| **CY** Carry | Carry out of bit 7 (or borrow) |

### Interrupt-related instructions

- **EI / DI:** set/clear the Interrupt Enable flip-flop for **maskable** interrupts.
- **RIM:** copies interrupt **mask and pending SID/RST** status into A.
- **SIM:** uses the pattern already in A to **set interrupt masks**, optionally **SOD**, and control serial output.

**SIM accumulator bit pattern (standard 8085):**

| D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| SOD | SDE | xxx | R7.5 | MSE | M7.5 | M6.5 | M5.5 |

- **SOD:** serial output data bit (if SDE = 1).
- **SDE:** serial data enable — 1 means update SOD.
- **R7.5:** 1 resets the pending RST 7.5 flip-flop.
- **MSE:** 1 means D2–D0 are written into the mask latches.
- **M7.5, M6.5, M5.5:** 1 **masks** (disables) that RST line.

Typical use: `MVI A,<pattern>` then `SIM`.

### Instruction groups (see `8085_Instructions.md` for all 68)

- **Arithmetic:** `ADD`, `ADI`, `ADC`, `ACI`, `SUB`, `SUI`, `SBB`, `SBI`, `INR`, `DCR`, `INX`, `DCX`, `DAD`.
- **Logical / rotate:** `ANA`, `ANI`, `ORA`, `ORI`, `XRA`, `XRI`, `CMP`, `CPI`, `CMA`, `CMC`, `STC`, `RLC`, `RRC`, `RAL`, `RAR`.
- **Data transfer:** `MOV`, `MVI`, `LDA`, `STA`, `LHLD`, `SHLD`, `LXI`, `LDAX`, `STAX`, `XCHG`, `SPHL`, `XTHL`.
- **Stack / branch:** `PUSH`, `POP`, `JMP`/`Jcc`, `CALL`/`Ccc`, `RET`/`Rcc`.
- **I/O / machine:** `IN`, `OUT`, `EI`, `DI`, `RIM`, `SIM`, `HLT`, `NOP`.

**T-state:** one clock period. Instruction time = T-states × clock period. For delay loops (square-wave problems), count T-states in the loop and choose a count so \(N \times T_\text{loop} \approx\) desired half-period.

---

## 7. 8086 Microprocessor

### Key pins (end-term)

- **NMI:** **Non-Maskable Interrupt** (pin). Rising edge requests interrupt type **2**. Cannot be ignored by `CLI`; used for serious events (power failure, parity error).
- **BHE̅ (Bus High Enable):** with **A0**, selects which half of the 16-bit data bus is used:

  | BHE̅ | A0 | Transfer |
  | :--- | :--- | :--- |
  | 0 | 0 | Whole word (even address) |
  | 1 | 0 | Low byte on D7–D0 |
  | 0 | 1 | High byte on D15–D8 (odd address) |
  | 1 | 1 | None |

  Needed so **even and odd banks** of byte-wide RAM/ROM can implement both **byte** and **word** transfers.

- **MN/MX̅:** strap pin. **High = Minimum mode** (8086 itself generates `RD̅`, `WR̅`, `M/IO̅`, `DT/R̅`, `DEN̅`, `ALE` — small systems). **Low = Maximum mode** (status `S2 S1 S0` go to an **8288** bus controller — multiprocessor systems).

### Registers and segments

General: **AX, BX, CX, DX** (and `AL/AH` …). Pointers/index: **SP, BP, SI, DI**. Segments: **CS, DS, ES, SS**. Physical address = **segment × 10H + offset** (20-bit, 1 MB).

**Flags of note:** CF, PF, AF, ZF, SF, OF, **DF** (direction for string ops), IF (maskable interrupts).

### Exam instructions (Section B)

| Mnemonic | Meaning |
| :--- | :--- |
| **JAE** | Jump if **Above or Equal** (unsigned): jump if **CF = 0**. After `CMP dest, src`, dest ≥ src as unsigned. Alias **JNB**. |
| **CLD** | **Clear Direction Flag** (DF = 0). String instructions (`MOVS`, `LODS`, …) **increment** SI/DI. Opposite: `STD`. |
| **NEG** | **Two’s complement negate** of the operand (0 − operand). Affects CF, ZF, SF, OF, PF, AF. |
| **SBB** | **Subtract with Borrow:** dest ← dest − src − CF. Used for multi-byte subtraction. |
| **CMP** | dest − src internally; **result discarded**; flags set as for SUB. Follow with `JE`, `JA`, `JL`, etc. |

### Rotates (end-term: ROR and RCL)

- **ROR dest, 1** (or `CL`): bits of dest rotate **right**. Bit 0 → bit 7 **and** into CF. CF is a copy of the bit that left bit 0; it is **not** inserted into the data path except as that copy.

```
   CF <--- [ b7 b6 ... b1 b0 ] ---+
                 ^                |
                 +----------------+
```

- **RCL dest, 1:** **rotate through carry left**. CF enters bit 0; bit 7 goes to CF. Nine-bit rotate of (CF, dest).

```
   CF <--- [ b7 b6 ... b1 b0 ] <--- CF (old)
```

Related (8085 notes): `RLC`/`RRC` do not include old CF in the data bits; `RAL`/`RAR` rotate **through** carry (like 8086 `RCL`/`RCR`). 8086 also has `ROL`, `RCR`, `SHL`/`SHR`, `SAL`/`SAR`.

### DOS / emu8086 notes (`8086_Commands.md`)

`INT 21h` with **AH** = `01h` read char, `02h` print char (`DL`), `09h` print `$`-terminated string (`DX`), `4Ch` exit.

**LOOP:** CX ← CX − 1; jump if CX ≠ 0. **MUL/DIV:** unsigned; 8-bit DIV uses AX (AL quotient, AH remainder).

`.exe` programs: `mov ax, @data` / `mov ds, ax` before using data.

### 8086 even/odd memory banks (end-term Q19)

Word-wide 8086 needs **two byte-wide chips** for RAM and two for ROM:

- **Even bank:** A0 = 0, enabled with `BHE̅` don’t-care for low byte; typically CS uses `A0 = 0`.
- **Odd bank:** A0 = 1, CS uses `BHE̅ = 0`.

Address lines **A1…** of 8086 go to **A0…** of each 8-bit memory IC. Example sizing:

- 8K×8 SRAM × 2 → 8K **words** = 16 KB RAM (e.g. `00000H–03FFFH`).
- 4K×8 EPROM × 2 → 4K words = 8 KB ROM (e.g. `FC000H–FFFFFH` so reset vector at `FFFF0H` is in ROM).

Chip-select logic: NAND/NOR/decoder on high address bits **and** `A0`/`BHE̅` so byte and word cycles both work.

---

## 8. 8051 Microcontroller (`8051.md`)

### On-chip resources

8-bit ALU; **4 KB ROM**, **128 B RAM**, **2 timers**, **4 ports P0–P3** (32 I/O lines), **1 serial port**, **2 external interrupts**, 16-bit external address (64 KB code + 64 KB data). **40-pin DIP**. Reset is **active-high**.

**P0** = multiplexed AD0–AD7; **P2** = A8–A15 when external memory is used. **PSEN̅** fetches **code** from external ROM; **RD̅/WR̅** (P3.7/P3.6) access **external data** RAM. **EA̅** high → use internal ROM (low addresses).

### Internal RAM

| Range | Content |
| :--- | :--- |
| 00h–1Fh | Four **register banks** R0–R7 |
| 20h–2Fh | **Bit-addressable** RAM (128 bits) |
| 30h–7Fh | General RAM and **stack** |
| 80h–FFh | **SFRs** |

Only **one** bank is active; selected by **RS1, RS0** in PSW.

### PSW (D0h) — bit structure (end-term Q2)

Reset value **00h**. Bit-addressable.

| Bit | Name | Significance |
| :--- | :--- | :--- |
| 7 | **CY** | Carry / borrow from ALU |
| 6 | **AC** | Auxiliary carry (nibble) |
| 5 | **F0** | User flag (software) |
| 4 | **RS1** | Register bank select MSB |
| 3 | **RS0** | Register bank select LSB |
| 2 | **OV** | Overflow (signed arithmetic) |
| 1 | — | User-definable / reserved |
| 0 | **P** | Parity of **ACC** (set by hardware) |

| RS1 | RS0 | Bank | RAM |
| :--- | :--- | :--- | :--- |
| 0 | 0 | 0 | 00h–07h |
| 0 | 1 | 1 | 08h–0Fh |
| 1 | 0 | 2 | 10h–17h |
| 1 | 1 | 3 | 18h–1Fh |

### Important SFRs

P0 (80h), SP (81h), DPL/DPH (82h/83h), PCON (87h), TCON (88h), TMOD (89h), TL0/TL1, TH0/TH1, P1 (90h), SCON/SBUF (98h/99h), P2 (A0h), IE (A8h), P3 (B0h), IP (B8h), PSW (D0h), ACC (E0h), B (F0h).

**Bit-addressable SFRs:** addresses multiple of 8 — P0, TCON, P1, SCON, P2, IE, P3, IP, PSW, ACC, B.

**DPTR** = DPH:DPL, 16-bit pointer for `MOVC`/`MOVX` and look-up tables.

### Minimal hardware

Regulated **+5 V**, **active-high reset** (RC + switch), **crystal** on XTAL1/XTAL2 with ~20–30 pF capacitors. Machine cycle = **12 oscillator periods**.

### ADC0804 (concept)

8-bit successive-approximation ADC. Sequence: **CS = 0**, pulse **WR̅** to start, wait **INTR̅** low (end of conversion), **RD̅ = 0**, read DB7–DB0.

Digital ≈ \((V_\text{IN}/V_\text{REF})\times 256\). If \(V_\text{REF}=5\,\text{V}\), step ≈ **19.5 mV**. \(V_\text{IN}=2.5\,\text{V}\) → **80h**.

### Motor driver ICs (end-term Q3)

A port pin sources/sinks only a few mA. A **stepper** coil needs larger current and produces **inductive back-EMF**. A **motor driver IC** (e.g. **ULN2003**: 7 Darlington channels, clamp diodes on COM) amplifies current and protects the MCU. Sequence of patterns on P2.0–P2.3 steps the motor; delay = speed; order = direction.

---

## 9. 8155 Multipurpose Programmable Device (`8155.md`)

**8155** = **256×8 SRAM** + **Port A (8)** + **Port B (8)** + **Port C (6)** + **14-bit timer**. 40-pin; multiplexed **AD0–AD7** (fits 8085). **8156** is the same with **active-high CE**.

Control signals: **IO/M̄, CE̅, ALE, RD̅, WR̅, RESET**. After reset, ports are **inputs**.

Example I/O map (base 20H from CS decoding):

| A2 A1 A0 | Address | Register |
| :--- | :--- | :--- |
| 000 | 20H | Control / status |
| 001 | 21H | Port A |
| 010 | 22H | Port B |
| 011 | 23H | Port C |
| 100 | 24H | Timer LSB |
| 101 | 25H | Timer MSB |

**Control word (I/O bits):** D0 Port A (1 = **output**), D1 Port B (1 = output), D3 D2 Port C mode, D5 D4 interrupt enables, D7 D6 timer command. **03H** = A and B outputs. Opposite convention from 8255 (where 1 = input).

---

## 10. 8255 PPI (`8255.md`)

**8255/8255A:** 40-pin **Programmable Peripheral Interface**, **24 I/O lines**: Port A, Port B, Port C (PC7–PC4 upper, PC3–PC0 lower).

- **Group A** = Port A + PC upper; **Group B** = Port B + PC lower.
- **RESET:** CWR cleared, **all ports input**.
- **A1 A0:** 00 = A, 01 = B, 10 = C, 11 = **CWR**.
- With 8086, sit on **D7–D0**; 8086 **A2,A1 → 8255 A1,A0** so port addresses are **even** and **2 apart**.

### CWR — I/O mode (B7 = 1)

| Bit | Meaning |
| :--- | :--- |
| B7 | 1 = I/O, 0 = BSR |
| B6 B5 | Group A mode (00=0, 01=1, 1x=2) |
| B4 | Port A: **1 = input**, 0 = output |
| B3 | PC upper: 1 = in, 0 = out |
| B2 | Group B mode (0 = Mode 0, 1 = Mode 1) |
| B1 | Port B: 1 = in, 0 = out |
| B0 | PC lower: 1 = in, 0 = out |

- **Mode 0:** simple I/O, no handshake.
- **Mode 1:** strobed I/O; handshake on Port C.
- **Mode 2:** bidirectional Port **A** only. Group B has **no Mode 2**.

Common words: **82H** (A out, B in, C out, Mode 0); **80H** (all output); **98H** (A in, B out, C upper in, C lower out, Mode 0).

### BSR mode (B7 = 0)

Sets/resets **one Port C bit**. B3 B2 B1 = bit number (000 = PC0 … 111 = PC7); **B0 = 1 set, 0 reset**. Example: set PC3 = **07H**, reset PC3 = **06H**.

---

## 11. 8279 Keyboard/Display Controller (`8155.md`)

**8279:** scans a keyboard and multiplexes 7-segment digits **in hardware**. CPU writes commands (A0 = 1) and data (A0 = 0).

- **SL0–SL3:** scan lines (rows / digit select).
- **RL0–RL7:** return lines (columns).
- **8×8 FIFO** holds key codes; **IRQ** when FIFO not empty.
- **16×8 display RAM**; **OUT A / OUT B** segment nibbles; **BD̅** blanks during digit switch.
- Commands (opcode in high bits): Mode set, Program clock, Read FIFO, Read/Write display RAM, Inhibit/blank, Clear, End interrupt.

**2-key lockout:** second key ignored until first released. **N-key rollover:** multiple keys queued in order. Display **left/right entry** chooses how characters fill RAM.

Same scan lines often drive **both** keypad rows (via 74HC138) and digit transistors — fewer pins, keyboard and display stay in step.

---

## 12. Keypad, Debounce and Displays

### 4×4 matrix (8255 or 8279)

Rows driven as outputs (one or all grounded); columns read as inputs with pull-ups. A press shorts a row to a column (column reads 0). **Key code** = row × 4 + column after scanning.

### Key debouncing

Mechanical contacts **chatter** for a few milliseconds. Without debounce, one press looks like many.

- **Software:** detect press → delay ~**10 ms** (`DEBOUNCE`) → read again.
- **Hardware:** RC filter, or 8279’s **on-chip debounce**.

### Multiplexed 7-segment

Segment lines are **shared**; only one digit’s common cathode/anode is enabled at a time. Fast scanning + **persistence of vision** makes all digits appear lit. Need **buffers** (74LS244) and **transistors** because PPI pins cannot source/sink full LED current.

**Common cathode:** logic 1 on a segment (after driver) lights that segment when cathode is grounded. **Common anode:** cathode drivers inverted; anodes to +5 V.

---

## 13. Robotics and System Design (end-term)

### Humanoid robot

A **humanoid robot** is a machine whose **form and degrees of freedom** approximate a human (head, torso, two arms, two legs) so it can work in human environments and use human tools. Sensing, balance, locomotion and manipulation are coordinated by embedded computers.

### Why microprocessors in robotics

The µP/µC **samples sensors** (encoders, IMU, force, cameras, flame sensors), **runs control algorithms** (PID, kinematics, sequencing), and **drives actuators** (motors via drivers) plus HMI (keypad, 7-segment, alarms). Real-time loops and interrupts give deterministic reaction (e.g. fire → alarm).

### Elevator-style control panel (Q21 concepts)

Typical 8086 design blocks: keypad matrix → PPI/8279; two 7-segment digits for floor 00–10; **high-power DC motor** via driver/relay (not a raw port pin); **flame sensor** as digital/analog input; **alarm** on a port bit. Firmware: scan keys → update target floor → move motor until floor matches → on fire, stop/go to safe floor and ring alarm.

---

## 14. Delay and Square-Wave (8085, Q18)

To output a square wave on **D0** through port **8AH**:

1. Configure/use an output port; put `01H` / `00H` (or toggle with `XRA`/`CMA` on bit 0) in A; `OUT 8AH`.
2. Execute a **software delay** whose T-state total equals the required **half-period**.
3. Complement D0 and repeat (`JMP`).

Clock 3.08 MHz → \(T = 1/f \approx 0.325\,\mu s\). Half-period (from the exam figure) / \(T\) = required T-states; split into inner loop count × T-states per loop (each instruction assumed 4–14 T as allowed). Always tabulate: **address range | mnemonic | comment | T-states**, then show the delay arithmetic.

---

## 15. One-Line Concept Index

| Term | One-line definition |
| :--- | :--- |
| Accumulator | Primary ALU operand/result register (A / ACC / AL/AX) |
| Assembler | Translates mnemonics to machine code |
| Bit-addressable | Memory/SFR bits that can be set/cleared/tested individually |
| Chip select | Decoder output that enables one IC for the current address |
| Control word | Byte written to a programmable chip to set port/timer/keyboard modes |
| Handshake | Extra strobe/acknowledge lines so peripherals and CPU stay in step |
| High-Z | Tri-state disconnected from the bus |
| Instruction cycle | Fetch + decode + execute of one instruction |
| Interrupt | Asynchronous request that vectors to an ISR, then returns |
| Machine cycle | Bus transaction (opcode fetch, memory read, I/O write, …) |
| Maskable interrupt | Can be disabled (8085 IE, 8086 IF, 8051 IE bits) |
| Opcode / operand | Operation code / data or address the operation uses |
| Persistence of vision | Eye integrates flashes; multiplexed digits look continuously on |
| Port | Group of I/O pins accessed as a register |
| Stack | LIFO RAM used by PUSH/POP/CALL/RET; SP points to the top |
| Status word | Flags describing the last ALU result and CPU mode |
| Strobe | Pulse that latches or validates data (WR̅, IORD̅, ALE) |
| T-state | One period of the processor clock |
| Tri-state | Output that can be 0, 1, or disconnected |
| Wait state | Extra T-state inserted when READY is inactive |

---

*Sources: Theory notes in this folder and EC-321 end-term paper 2025–26. For full mnemonic tables and worked interface programs, open the corresponding chip/instruction markdown files.*
