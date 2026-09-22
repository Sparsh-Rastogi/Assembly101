# EC-373 Microprocessor Engineering Lab — Problem Set-1
## Assembly Level Program Practice with 8086-CPU

### Problem No. 1
Write an assembly-level code to perform multiplication and division of two given numbers, and store the result in two consecutive external memory locations pointed by a base address present in the Destination Index Register.

### Problem No. 2
Write an assembly-level code to perform addition and subtraction of two given hexadecimal numbers, and store the result in two internal registers of 8086 Microprocessor: CX and DX respectively.

### Problem No. 3
The following infinite series in termed as a Fibonacci series in Mathematics, where every number in the series is a sum of the preceding two numbers in the infinite series:

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ……..

Write an Assembly-level code for an 8086-CPU, to generate a Fibonacci series upto 20-terms. You are required to store the 20-terms as hexadecimal numbers in consecutive locations within the data-segment of the external memory.

### Problem No. 4
Write an assembly-language program for 8086-CPU, to compute the factorial values of the following eight numbers: 1, 2, 3, 4, 5, 6, 7, 8.

Store the eight computed factorial values in successive RAM memory locations, by alloting atleast two bytes for each computed factorial value.

### Problem No. 5
Consider the following equation from Classical Mechanics, referred to as the Second-equation of Motion, which is used to calculate the displacement (s) of an object:

s = u.t + (1/2) at²

where, u is the initial velocity of the object, t is time taken and a is the acceleration. Write a program in EMU-8086 emulator to receive inputs from the user for the parameters, namely: Initial Velocity, Time and Acceleration. Use the 8086 microprocessor to help you compute the Displacement (s) value, based on the user inputs. Display the computed Displacement value in the output terminal of the EMU-8086 emulator.

### Problem No. 6
The following table indicates the average temperature recorded at Varanasi (in degree celsius) during various days of a year:

| Date | Temperature |
| :--- | :--- |
| Jan-23 | 20° C |
| Jan-31 | 24° C |
| Feb-21 | 32° C |
| Feb-28 | 34° C |
| Mar-23 | 38° C |
| May-24 | 42° C |
| May-31 | 45° C |
| Jul-24 | 36° C |
| Aug-24 | 33° C |
| Dec-13 | 23° C |

Write a Assembly level program for an 8086-CPU, where the temperature numbers for various days are fed to consecutive memory locations using simple Immediate-addressing-mode based instructions. Develop your program so as to let the 8086-CPU find out the maximum temperature value from the given data.

### Problem No. 7
Write an assembly language program in EMU-8086 to perform 1's complement on the contents of the Flag-register of the 8086-Microprocessor (ie., to flip all 1s in Flag register to 0s, and flip all 0s in flag register to 1s).

Perform the above operation as a series of following three steps:
i. Copy the contents of Flag register to two successive memory locations, whose first address is pointed by the Base-Pointer register. (Hint: Use PUSHF instruction learnt during the lectures).
ii. Now, perform 1's complement on these 16-bits present in the two consecutive memory locations, by suitable methods.
iii. Finally, copy the 1's complement value in memory-location to the flag-register. (Hint: Use POPF instruction learnt during the lectures).

### Problem No. 8
Write an assembly language program to perform the following:
i. Store a 8-bit number in the RAM location 1000
ii. Check if the stored 8-bit number is an odd number or an even number
iii. If the stored number is odd, then indicate the same by loading 0000 H in CX-register
iv. If the stored number is even, then indicate the same by loading FFFF H in CX-register

### Problem No. 9
Write a program to perform OR operation of two hexadecimal numbers stored in memory locations 1000 H and 1001 H, and store the result in the memory location pointed by Destination Index register.

### Problem No. 10
Write an assembly-language program to perform the following:
i. Load the memory-address 1000 in Source Index Register
ii. Now using this memory base-address in Source Index Register, store the following given five hex-numbers in memory locations 1000 to 1009 (taking 2 bytes for every given hex-number): F3F5 H, FFF2 H, 0104 H, 0842 H, 8468 H
iii. Sort the five numbers in the ascending order and store these sorted numbers in memory locations 2000 to 2009, taking two bytes for every sorted hex-number
iv. Sort the five numbers in the descending order and store these sorted numbers in memory locations 3000 to 3009, taking two bytes for every sorted hex-number