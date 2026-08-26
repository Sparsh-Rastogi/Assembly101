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

## Crucial Assembly Notes

* **COM vs EXE:** `.com` files (`org 100h`) mix code and data. `.exe` files require strict `.model`, `.stack`, and `.data` segments.
* **Data Segment Init:** Always start `.exe` code segments with `mov ax, @data` followed by `mov ds, ax` to safely access your variables.
* **String Termination:** Text variables must end with a `$` character (e.g., `msg db 'Hello$'`) for DOS to know where to stop printing.
* **The Stack:** Use `PUSH` to temporarily save a register's exact state to memory, and `POP` to retrieve it later without overwriting it.
* **Division Trick:** The `DIV` command splits the `AX` register. `AL` gets the quotient, and `AH` gets the remainder.
* **Hexadecimal Syntax:** Hex numbers must end with an `h`. If a hex number starts with a letter, you must prepend a zero (e.g., `0A5h`).
* **Loops:** The `LOOP` instruction automatically subtracts 1 from `CX` and jumps back to your label if `CX` has not reached zero yet.
* **Emu8086 Library:** Include `emu8086.inc` at the top and `DEFINE_PRINT_NUM` at the bottom to easily print multi-digit integers directly from `AX`.