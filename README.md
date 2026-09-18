# 8086 Assembly Cheat Sheet

This guide contains the most critical commands, interrupts, and rules for 16-bit DOS programming in emu8086.

## Essential DOS Interrupts (INT 21h)

To use these, load the specific function code into the `AH` register, set up any required data in other registers, and execute `INT 21h`.

| AH Code | Function Name | Required Setup | Result |
| :--- | :--- | :--- | :--- |
| `01h` | Read Character | None | Program pauses. Typed character's ASCII code is saved in `AL`. |
| `02h` | Print Character | Put ASCII character in `DL` | Prints the single character stored in `DL` to the screen. |
| `09h` | Print String | Put string memory address in `DX` | Prints characters from memory until it hits a `$` sign. |
| `4Ch` | Exit Program | None | Safely terminates the program and returns control to DOS. |

---

## Core Register Rules

The 8086 CPU has four general-purpose 16-bit registers, but DOS treats them uniquely.

| Register | Name | Primary Special Jobs |
| :--- | :--- | :--- |
| `AX` | Accumulator | Holds results for `MUL` and `DIV`. Used by `emu8086.inc` to print numbers. |
| `BX` | Base | Used as a default pointer for memory addressing. |
| `CX` | Counter | Automatically dictates how many times the `LOOP` instruction runs. |
| `DX` | Data | Holds memory addresses for strings (`09h`) or single characters (`02h`). |

---

## Jump Instructions (Branching)

Most conditional jumps are executed immediately after a `CMP` (Compare) or `TEST` instruction. The CPU looks at the resulting system Flags (Zero, Carry, Sign, Overflow) to decide whether to jump to the specified label or continue to the next line.

| Instruction | Meaning | Description / Condition |
| :--- | :--- | :--- |
| **`JMP`** | Unconditional Jump | Jumps to the label no matter what. Acts as an infinite loop or absolute bypass. |
| **Equality / Zero** | *(Checks the Zero Flag)* | |
| **`JZ` / `JE`** | Jump if Zero / Equal | Jumps if the previous operation resulted in zero, or if `CMP` found both operands equal. |
| **`JNZ` / `JNE`**| Jump if Not Zero / Not Equal | Jumps if the previous operation was not zero, or if `CMP` found operands unequal. |
| **Unsigned Math** | *(For positive values only)* | *(Use these after comparing raw binary/hex or positive numbers)* |
| **`JA` / `JNBE`**| Jump if Above | Jumps if Destination > Source. |
| **`JAE` / `JNB`**| Jump if Above or Equal | Jumps if Destination >= Source. |
| **`JB` / `JNAE`**| Jump if Below | Jumps if Destination < Source (Same as `JC` - Jump if Carry). |
| **`JBE` / `JNA`**| Jump if Below or Equal | Jumps if Destination <= Source. |
| **Signed Math** | *(For positive/negative values)*| *(Use these after comparing numbers that can be negative)* |
| **`JG` / `JNLE`**| Jump if Greater | Jumps if Destination > Source. |
| **`JGE` / `JNL`**| Jump if Greater or Equal | Jumps if Destination >= Source. |
| **`JL` / `JNGE`**| Jump if Less | Jumps if Destination < Source. |
| **`JLE` / `JNG`**| Jump if Less or Equal | Jumps if Destination <= Source. |
| **Flag-Specific** | *(Direct flag checks)* | |
| **`JC` / `JNC`** | Jump Carry / No Carry | Jumps if the Carry Flag is 1 (`JC`) or 0 (`JNC`). |
| **`JS` / `JNS`** | Jump Sign / No Sign | Jumps if the Sign Flag is 1 (Negative) or 0 (Positive). |
| **`JO` / `JNO`** | Jump Overflow / No Overflow | Jumps if the Overflow Flag is 1 (`JO`) or 0 (`JNO`). |
| **`JP` / `JNP`** | Jump Parity / No Parity | Jumps if Parity Flag is 1 (Even number of bits) or 0 (Odd). |

---

## Crucial Assembly Notes

* **COM vs EXE:** `.com` files (`org 100h`) mix code and data. `.exe` files require strict `.model`, `.stack`, and `.data` segments.
* **Data Segment Init:** Always start `.exe` code segments with `mov ax, @data` followed by `mov ds, ax` to safely access your variables.
* **String Termination:** Text variables must end with a `$` character (e.g., `msg db 'Hello$'`) for DOS to know where to stop printing.
* **The Stack:** Use `PUSH` to temporarily save a register's exact state to memory, and `POP` to retrieve it later without overwriting it.
* **Division Trick:** The `DIV` command splits the `AX` register. `AL` gets the quotient, and `AH` gets the remainder.
* **Hexadecimal Syntax:** Hex numbers must end with an `h`. If a hex number starts with a letter, you must prepend a zero (e.g., `0A5h`).
* **Loops:** The `LOOP` instruction automatically subtracts 1 from `CX` and jumps back to your label if `CX` has not reached zero yet.
* **Emu8086 Library:** Include `emu8086.inc` at the top and `DEFINE_PRINT_NUM` at the bottom to easily print multi-digit integers directly from `AX`.

## System Flags (8085 vs 8086)

The Flag Register (or Program Status Word) contains individual bits that indicate the result of the last arithmetic or logical operation, or control how the CPU behaves. 

### 8085 Microprocessor Flags (8-bit Register)
The 8085 has **5 status flags** that only reflect math/logic results.

| Flag | Name | Description |
| :--- | :--- | :--- |
| **S** | Sign | Set to 1 if the Most Significant Bit (MSB) of the result is 1 (negative number). |
| **Z** | Zero | Set to 1 if the result of the operation is exactly zero. |
| **AC**| Auxiliary Carry | Set to 1 if a carry is generated from bit 3 to bit 4 (used mostly in BCD math). |
| **P** | Parity | Set to 1 if the result has an even number of 1s (Even Parity). |
| **CY**| Carry | Set to 1 if the operation resulted in a carry out of the MSB (bit 7). |

---

### 8086 Microprocessor Flags (16-bit Register)
The 8086 expands on the 8085. It inherits the 5 status flags (renaming `CY` to `CF` and `AC` to `AF`), adds **1 new status flag**, and introduces **3 new control flags** (9 active bits total out of 16).

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