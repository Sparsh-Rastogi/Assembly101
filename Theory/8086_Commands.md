# 8086 Commands Cheat Sheet

Covers DOS interrupts, jump/branch instructions, and other core commands (stack, loop, division) for 16-bit DOS programming in emu8086.

## Essential DOS Interrupts (INT 21h)

To use these, load the specific function code into the `AH` register, set up any required data in other registers, and execute `INT 21h`.

| AH Code | Function Name | Required Setup | Result |
| :--- | :--- | :--- | :--- |
| `01h` | Read Character | None | Program pauses. Typed character's ASCII code is saved in `AL`. |
| `02h` | Print Character | Put ASCII character in `DL` | Prints the single character stored in `DL` to the screen. |
| `09h` | Print String | Put string memory address in `DX` | Prints characters from memory until it hits a `$` sign. |
| `4Ch` | Exit Program | None | Safely terminates the program and returns control to DOS. |

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

## Stack Commands

| Instruction | Description |
| :--- | :--- |
| `PUSH` | Temporarily saves a register's exact value onto the stack in memory. |
| `POP` | Retrieves the most recently pushed value off the stack into a register, without overwriting it. |
| `CALL` | Pushes the return address onto the stack and jumps to a procedure/subroutine label. |
| `RET` | Pops the return address off the stack and jumps back to it, resuming execution after the `CALL`. |

## Looping

| Instruction | Description |
| :--- | :--- |
| `LOOP` | Automatically subtracts 1 from `CX` and jumps back to the given label if `CX` has not yet reached zero. |
| `LOOPE` / `LOOPZ` | Loops while `CX` ≠ 0 **and** the Zero Flag is set. |
| `LOOPNE` / `LOOPNZ` | Loops while `CX` ≠ 0 **and** the Zero Flag is clear. |

## Arithmetic Commands

| Instruction | Description |
| :--- | :--- |
| `MUL` | Unsigned multiply; result placed in `AX` (or `DX:AX` for 16-bit operands). |
| `DIV` | Unsigned divide. Splits the `AX` register: `AL` gets the quotient, `AH` gets the remainder. |
| `CMP` | Compares two operands (by internally subtracting) and sets the Flags, without storing the result. |

## Other Crucial Notes

* **COM vs EXE:** `.com` files (`org 100h`) mix code and data. `.exe` files require strict `.model`, `.stack`, and `.data` segments.
* **Data Segment Init:** Always start `.exe` code segments with `mov ax, @data` followed by `mov ds, ax` to safely access your variables.
* **String Termination:** Text variables must end with a `$` character (e.g., `msg db 'Hello$'`) for DOS to know where to stop printing.
* **Hexadecimal Syntax:** Hex numbers must end with an `h`. If a hex number starts with a letter, you must prepend a zero (e.g., `0A5h`).
* **Emu8086 Library:** Include `emu8086.inc` at the top and `DEFINE_PRINT_NUM` at the bottom to easily print multi-digit integers directly from `AX`.