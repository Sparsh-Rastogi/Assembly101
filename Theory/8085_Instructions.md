# 8085 Instruction Set Cheat Sheet

All 68 8085 instruction mnemonics, grouped by category for exam prep.

## Arithmetic Instructions (13)

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `ACI` | Add Immediate with Carry | Adds an 8-bit immediate value plus the Carry Flag to the accumulator. |
| `ADC` | Add Register with Carry | Adds a register (or memory) plus the Carry Flag to the accumulator. |
| `ADD` | Add Register to Accumulator | Adds a register or memory value to the accumulator. |
| `ADI` | Add Immediate to Accumulator | Adds an 8-bit immediate value to the accumulator. |
| `DAD` | Double Register Add | Adds a 16-bit register pair to `HL`. |
| `DCR` | Decrement by 1 | Decrements a register or memory location by 1 (Carry Flag unaffected). |
| `DCX` | Decrement Register Pair by 1 | Decrements a 16-bit register pair by 1. |
| `INR` | Increment by 1 | Increments a register or memory location by 1 (Carry Flag unaffected). |
| `INX` | Increment Register Pair by 1 | Increments a 16-bit register pair by 1. |
| `SBB` | Subtract with Borrow | Subtracts a register (or memory) and the Carry Flag from the accumulator. |
| `SBI` | Subtract Immediate with Borrow | Subtracts an 8-bit immediate value and the Carry Flag from the accumulator. |
| `SUB` | Subtract Register/Memory from Accumulator | Subtracts a register or memory value from the accumulator. |
| `SUI` | Subtract Immediate from Accumulator | Subtracts an 8-bit immediate value from the accumulator. |

## Logical Instructions (15)

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `ANA` | AND with Accumulator | Logical ANDs a register or memory value with the accumulator. |
| `ANI` | AND Immediate with Accumulator | Logical ANDs an 8-bit immediate value with the accumulator. |
| `CMA` | Complement Accumulator | Inverts every bit of the accumulator (1's complement). |
| `CMC` | Complement Carry | Inverts the current value of the Carry Flag. |
| `CMP` | Compare with Accumulator | Subtracts a register/memory value from the accumulator (result discarded) and sets Flags. |
| `CPI` | Compare Immediate with Accumulator | Subtracts an 8-bit immediate value from the accumulator (result discarded) and sets Flags. |
| `ORA` | OR with Accumulator | Logical ORs a register or memory value with the accumulator. |
| `ORI` | OR Immediate with Accumulator | Logical ORs an 8-bit immediate value with the accumulator. |
| `RAL` | Rotate Accumulator Left through Carry | Rotates the accumulator left by 1 bit through the Carry Flag. |
| `RAR` | Rotate Accumulator Right through Carry | Rotates the accumulator right by 1 bit through the Carry Flag. |
| `RLC` | Rotate Accumulator Left | Rotates the accumulator left by 1 bit; bit 7 goes into bit 0 and the Carry Flag. |
| `RRC` | Rotate Accumulator Right | Rotates the accumulator right by 1 bit; bit 0 goes into bit 7 and the Carry Flag. |
| `STC` | Set Carry | Sets the Carry Flag to 1. |
| `XRA` | Exclusive OR with Accumulator | Logical XORs a register or memory value with the accumulator. |
| `XRI` | Exclusive OR Immediate with Accumulator | Logical XORs an 8-bit immediate value with the accumulator. |

## Data Transfer Instructions (12)

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `LDA` | Load Accumulator Direct | Copies the byte at a given 16-bit memory address into the accumulator. |
| `LDAX` | Load Accumulator Indirect | Loads the accumulator from the memory address pointed to by register pair `B` or `D`. |
| `LHLD` | Load H-L Direct | Loads `L` from `addr` and `H` from `addr+1` (loads a 16-bit value into `HL`). |
| `LXI` | Load Register Pair Immediate | Loads a 16-bit immediate value into a register pair (`B`, `D`, `H`, or `SP`). |
| `MOV` | Move Data | Copies data from a source register/memory location into a destination register/memory location. |
| `MVI` | Move Immediate | Loads an 8-bit immediate value directly into a register or memory location. |
| `SHLD` | Store H-L Direct | Stores `L` into `addr` and `H` into `addr+1`. |
| `SPHL` | Copy H-L to Stack Pointer | Copies the contents of `HL` into the Stack Pointer. |
| `STA` | Store Accumulator Direct | Stores the accumulator into a given 16-bit memory address. |
| `STAX` | Store Accumulator Indirect | Stores the accumulator into the memory address pointed to by register pair `B` or `D`. |
| `XCHG` | Exchange H-L and D-E Register Pairs | Swaps the contents of `HL` with `DE`. |
| `XTHL` | Exchange H-L with Top of Stack | Swaps `L` with the byte on top of the stack and `H` with the next byte. |

## Stack Instructions (2)

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `PUSH` | Push Register Pair onto Stack | Pushes a register pair (or `A` + Flags for `PUSH PSW`) onto the stack. |
| `POP` | Pop Stack into Register Pair | Pops the top of the stack into a register pair (or `A` + Flags for `POP PSW`). |

## Branch / Jump Instructions (9)

**Unconditional**

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `JMP` | Unconditional Jump | Jumps to the specified address no matter what. |

**Conditional Jumps**

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `JC` | Jump on Carry | Jumps if the Carry Flag is set. |
| `JNC` | Jump on No Carry | Jumps if the Carry Flag is clear. |
| `JP` | Jump on Positive | Jumps if the Sign Flag is 0 (result positive). |
| `JM` | Jump on Minus | Jumps if the Sign Flag is 1 (result negative). |
| `JPE` | Jump on Parity Even | Jumps if the Parity Flag is set (even parity). |
| `JPO` | Jump on Parity Odd | Jumps if the Parity Flag is clear (odd parity). |
| `JZ` | Jump on Zero | Jumps if the Zero Flag is set. |
| `JNZ` | Jump on No Zero | Jumps if the Zero Flag is clear. |

## Call Instructions (9)

**Unconditional**

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `CALL` | Call Subroutine | Pushes the return address onto the stack and jumps to a subroutine. |

**Conditional Calls**

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `CZ` | Call on Zero | Calls the subroutine if the Zero Flag is set. |
| `CNZ` | Call on No Zero | Calls the subroutine if the Zero Flag is clear. |
| `CC` | Call on Carry | Calls the subroutine if the Carry Flag is set. |
| `CNC` | Call on No Carry | Calls the subroutine if the Carry Flag is clear. |
| `CP` | Call on Positive | Calls the subroutine if the Sign Flag is 0. |
| `CM` | Call on Minus | Calls the subroutine if the Sign Flag is 1. |
| `CPE` | Call on Parity Even | Calls the subroutine if the Parity Flag is set. |
| `CPO` | Call on Parity Odd | Calls the subroutine if the Parity Flag is clear. |

## Return Instructions (9)

**Unconditional**

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `RET` | Return from Subroutine | Pops the return address off the stack and resumes execution there. |

**Conditional Returns**

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `RC` | Return on Carry | Returns if the Carry Flag is set. |
| `RNC` | Return on No Carry | Returns if the Carry Flag is clear. |
| `RP` | Return on Positive | Returns if the Sign Flag is 0. |
| `RM` | Return on Minus | Returns if the Sign Flag is 1. |
| `RPE` | Return on Parity Even | Returns if the Parity Flag is set. |
| `RPO` | Return on Parity Odd | Returns if the Parity Flag is clear. |
| `RZ` | Return on Zero | Returns if the Zero Flag is set. |
| `RNZ` | Return on No Zero | Returns if the Zero Flag is clear. |

## I/O and Interrupt Instructions (6)

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `DI` | Disable Interrupts | Clears the Interrupt Enable flip-flop, masking maskable interrupts. |
| `EI` | Enable Interrupts | Sets the Interrupt Enable flip-flop, allowing maskable interrupts. |
| `IN` | Input from Port | Reads a byte from the specified I/O port into the accumulator. |
| `OUT` | Output to Port | Writes the accumulator's byte to the specified I/O port. |
| `RIM` | Read Interrupt Mask | Reads interrupt mask/status information into the accumulator. |
| `SIM` | Set Interrupt Mask | Sets the interrupt mask from the accumulator. |

## Machine Control Instructions (2)

| Mnemonic | Meaning | Description |
| :--- | :--- | :--- |
| `HLT` | Halt Processor | Stops program execution. |
| `NOP` | No Operation | Does nothing; used for timing/delay or as a placeholder. |

---

**Total Instructions: 68**

| Category | Count |
| :--- | :--- |
| Arithmetic | 13 |
| Logical | 15 |
| Data Transfer | 12 |
| Branch/Jump | 9 |
| Call | 9 |
| Return | 9 |
| Stack | 2 |
| I/O & Interrupt | 6 |
| Machine Control | 2 |