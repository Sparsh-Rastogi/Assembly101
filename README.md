# 8085 vs 8086

## Architecture Overview

| Spec | 8085 | 8086 |
| :--- | :--- | :--- |
| Word size | 8-bit | 16-bit |
| Data Bus | 8-bit | 16-bit |
| Address Bus | 16-bit | 20-bit |
| Directly Addressable Memory | 64 KB (2^16) | 1 MB (2^20), via segmentation |
| Clock speed (original) | 3 MHz | 5–10 MHz |
| Memory Segmentation | None | Yes (CS, DS, SS, ES) |
| Pipelining | No | Yes (basic instruction prefetch queue) |

## 8085 Registers

| Register | Size | Notes |
| :--- | :--- | :--- |
| `A` (Accumulator) | 8-bit | Holds results of arithmetic/logic operations. |
| `B, C, D, E, H, L` | 8-bit each | General purpose; can be paired as `BC`, `DE`, `HL` for 16-bit operations. |
| `HL` | 16-bit (paired) | Frequently used as a memory pointer. |
| `SP` (Stack Pointer) | 16-bit | Points to the top of the stack in memory. |
| `PC` (Program Counter) | 16-bit | Holds the address of the next instruction to execute. |
| `Flag Register` | 8-bit | Holds the 5 status flags (see below). |

## 8086 Registers

The 8086 has four general-purpose 16-bit registers, each splittable into two 8-bit halves (e.g. `AX` = `AH` + `AL`).

| Register | Name | Primary Special Jobs |
| :--- | :--- | :--- |
| `AX` | Accumulator | Holds results for `MUL` and `DIV`. Used by `emu8086.inc` to print numbers. |
| `BX` | Base | Used as a default pointer for memory addressing. |
| `CX` | Counter | Automatically dictates how many times the `LOOP` instruction runs. |
| `DX` | Data | Holds memory addresses for strings (`09h`) or single characters (`02h`). |

**Pointer & Index registers:** `SP` (Stack Pointer), `BP` (Base Pointer), `SI` (Source Index), `DI` (Destination Index).

**Segment registers:** `CS` (Code), `DS` (Data), `SS` (Stack), `ES` (Extra) — each 16-bit, combined with a 16-bit offset to form a 20-bit physical address (`segment × 16 + offset`).

## 8085 Flags (8-bit Flag Register, 5 active flags)

The 8085 has 5 status flags that only reflect math/logic results.

| Flag | Name | Description |
| :--- | :--- | :--- |
| **S** | Sign | Set to 1 if the Most Significant Bit (MSB) of the result is 1 (negative number). |
| **Z** | Zero | Set to 1 if the result of the operation is exactly zero. |
| **AC** | Auxiliary Carry | Set to 1 if a carry is generated from bit 3 to bit 4 (used mostly in BCD math). |
| **P** | Parity | Set to 1 if the result has an even number of 1s (Even Parity). |
| **CY** | Carry | Set to 1 if the operation resulted in a carry out of the MSB (bit 7). |

## 8086 Flags (16-bit Flag Register, 9 active flags)

The 8086 expands on the 8085. It inherits the 5 status flags (renaming `CY` to `CF` and `AC` to `AF`), adds **1 new status flag**, and introduces **3 new control flags**.

**Status Flags (Math/Logic Results):**

| Flag | Name | Description |
| :--- | :--- | :--- |
| **CF** | Carry Flag | Same as 8085 `CY`. Carry out of the MSB (bit 7 for 8-bit, bit 15 for 16-bit). |
| **PF** | Parity Flag | Same as 8085 `P`. Checks only the lowest 8 bits of the result for even parity. |
| **AF** | Auxiliary Flag | Same as 8085 `AC`. Carry from bit 3 to bit 4. |
| **ZF** | Zero Flag | Same as 8085 `Z`. Result is exactly zero. |
| **SF** | Sign Flag | Same as 8085 `S`. MSB is 1 (negative). |
| **OF** | Overflow Flag | **[NEW]** Set if signed arithmetic overflows its capacity (e.g., adding two large positive numbers results in a negative number). |

**Control Flags (CPU Behavior):**

| Flag | Name | Description |
| :--- | :--- | :--- |
| **TF** | Trap Flag | **[NEW]** Set to 1 to put the CPU into Single-Step mode for debugging (executes one instruction, then pauses). |
| **IF** | Interrupt Flag | **[NEW]** Set to 1 to allow the CPU to recognize external maskable hardware interrupts (`STI` to set, `CLI` to clear). |
| **DF** | Direction Flag | **[NEW]** Controls string instructions (like `MOVSB`). `0` = Auto-increment pointers (Left to Right), `1` = Auto-decrement pointers (Right to Left). (`STD` to set, `CLD` to clear). |

## Division Trick (8086)

The `DIV` command splits the `AX` register: `AL` gets the quotient, and `AH` gets the remainder.