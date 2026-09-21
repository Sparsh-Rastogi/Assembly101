# 8085 Instruction Set Cheat Sheet

Core instruction groups for the 8085 microprocessor (8-bit).

## Data Transfer Instructions

| Instruction | Meaning | Description |
| :--- | :--- | :--- |
| `MOV Rd, Rs` | Move Register | Copies the value of the source register `Rs` into destination register `Rd`. |
| `MVI R, data` | Move Immediate | Loads an 8-bit immediate value directly into register `R`. |
| `LXI Rp, data16` | Load Register Pair Immediate | Loads a 16-bit immediate value into a register pair (`B`, `D`, `H`, or `SP`). |
| `LDA addr` | Load Accumulator Direct | Copies the byte at the given 16-bit memory address into the accumulator `A`. |
| `STA addr` | Store Accumulator Direct | Stores the accumulator `A` into the given 16-bit memory address. |
| `LHLD addr` | Load H-L Direct | Loads `L` from `addr` and `H` from `addr+1` (loads a 16-bit value into the `HL` pair). |
| `SHLD addr` | Store H-L Direct | Stores `L` into `addr` and `H` into `addr+1`. |
| `LDAX Rp` | Load Accumulator Indirect | Loads `A` from the memory address pointed to by register pair `B` or `D`. |
| `STAX Rp` | Store Accumulator Indirect | Stores `A` into the memory address pointed to by register pair `B` or `D`. |
| `XCHG` | Exchange | Swaps the contents of `HL` with `DE`. |
| `XTHL` | Exchange Top of Stack with H-L | Swaps `L` with the byte on top of the stack and `H` with the next byte. |
| `SPHL` | Move HL to SP | Copies `HL` into the Stack Pointer. |
| `PUSH Rp` | Push | Pushes a register pair (or Flags with `A` for `PUSH PSW`) onto the stack. |
| `POP Rp` | Pop | Pops the top of the stack into a register pair (or Flags with `A` for `POP PSW`). |

## Arithmetic Instructions

| Instruction | Meaning | Description |
| :--- | :--- | :--- |
| `ADD R / M` | Add | Adds register or memory (pointed to by `HL`) to the accumulator. |
| `ADI data` | Add Immediate | Adds an 8-bit immediate value to the accumulator. |
| `ADC R / M` | Add with Carry | Adds register/memory and the Carry Flag to the accumulator. |
| `SUB R / M` | Subtract | Subtracts register or memory from the accumulator. |
| `SUI data` | Subtract Immediate | Subtracts an 8-bit immediate value from the accumulator. |
| `SBB R / M` | Subtract with Borrow | Subtracts register/memory and the Carry Flag from the accumulator. |
| `INR R / M` | Increment | Increments a register or memory location by 1 (does not affect Carry Flag). |
| `DCR R / M` | Decrement | Decrements a register or memory location by 1 (does not affect Carry Flag). |
| `INX Rp` | Increment Pair | Increments a 16-bit register pair by 1. |
| `DCX Rp` | Decrement Pair | Decrements a 16-bit register pair by 1. |
| `DAD Rp` | Double Add | Adds a register pair to `HL` (16-bit addition). |
| `DAA` | Decimal Adjust Accumulator | Converts the result of a binary addition into valid packed BCD. |

## Logical Instructions

| Instruction | Meaning | Description |
| :--- | :--- | :--- |
| `ANA R / M` | AND | Logical ANDs register/memory with the accumulator. |
| `ANI data` | AND Immediate | Logical ANDs an immediate value with the accumulator. |
| `ORA R / M` | OR | Logical ORs register/memory with the accumulator. |
| `ORI data` | OR Immediate | Logical ORs an immediate value with the accumulator. |
| `XRA R / M` | XOR | Logical XORs register/memory with the accumulator. |
| `XRI data` | XOR Immediate | Logical XORs an immediate value with the accumulator. |
| `CMP R / M` | Compare | Subtracts register/memory from the accumulator (result discarded) and sets Flags. |
| `CPI data` | Compare Immediate | Subtracts an immediate value from the accumulator and sets Flags. |
| `RLC` | Rotate Left | Rotates `A` left by 1 bit; bit 7 goes into both bit 0 and the Carry Flag. |
| `RRC` | Rotate Right | Rotates `A` right by 1 bit; bit 0 goes into both bit 7 and the Carry Flag. |
| `RAL` | Rotate Left through Carry | Rotates `A` left through the Carry Flag. |
| `RAR` | Rotate Right through Carry | Rotates `A` right through the Carry Flag. |
| `CMA` | Complement Accumulator | Inverts every bit of `A` (1's complement). |
| `CMC` | Complement Carry | Inverts the Carry Flag. |
| `STC` | Set Carry | Sets the Carry Flag to 1. |

## Branching Instructions

| Instruction | Meaning | Description |
| :--- | :--- | :--- |
| `JMP addr` | Jump | Unconditional jump to the given address. |
| `JZ / JNZ addr` | Conditional Jump | Jumps if Zero Flag is set / not set. |
| `JC / JNC addr` | Conditional Jump | Jumps if Carry Flag is set / not set. |
| `JP / JM addr` | Conditional Jump | Jumps if result is positive (Sign=0) / minus (Sign=1). |
| `JPE / JPO addr` | Conditional Jump | Jumps if parity is even / odd. |
| `CALL addr` | Call Subroutine | Pushes the return address and jumps to a subroutine. |
| `RET` | Return | Pops the return address and resumes execution there. |

## Control Instructions

| Instruction | Meaning | Description |
| :--- | :--- | :--- |
| `NOP` | No Operation | Does nothing; used for timing/delay or as a placeholder. |
| `HLT` | Halt | Stops program execution. |
| `DI` | Disable Interrupts | Clears the Interrupt Enable flip-flop, masking interrupts. |
| `EI` | Enable Interrupts | Sets the Interrupt Enable flip-flop, allowing interrupts. |
| `RIM` | Read Interrupt Mask | Reads interrupt mask/status into the accumulator. |
| `SIM` | Set Interrupt Mask | Sets the interrupt mask from the accumulator. |