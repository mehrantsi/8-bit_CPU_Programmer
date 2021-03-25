# 8-bit CPU Programmer

## Overview
This project is meant to help programming MSAP-1 (Mehran's Simple as Possible) 8-bit computer project. The idea is to set the addresses and data of SRAM in MSAP-1 while it's in programming mode and enable reviewing what has been/is going to be programmed, when MSAP-1 is in run mode. This removes the need of having dip switches for programming, and enables writing code in assembly.

### Hardware
The hardware side of this project, includes an Arduino Nano, 1 HW-125 SD card module, 2 SIPO shift registers (74HC595), 1 OLED display (128x64 with SSD1306 controller), 1 micro switch and a 10nF bypass capacitor for shift registers.

Schematic of the programmer:
![SCH](https://github.com/mehrantsi/8-bit_CPU_Programmer/blob/main/Schematics/Schematic.png)

### Software
This project contains a crude assembler that parses the code using regex. It has been developed that way for sake of simplicity at this point, but It will most likely be changed to a proper assembler for MSAP-2.

The assembler job is to convert the provided assembly file to binary and modify addresses with offsets calculated depending on the OpCode and number of operands. In the end, it generates a file that must be called "machinecode.hex" in the root directory of the SD card, so the programmer can read the file and write it to MSAP-1 RAM directly.

In MSAP-1 assembly, *"$"* refers to an address, *"#"* denotes an 8-bit signed number, and *";"* indicates a comment.
The Operations supported are as follows:

OpCode|Operand(s)|Description
-----|-----|-----
LDA|$[address]|**Load A:** Load the data at the provided address into register A
ADD|$[address]|Loads the data at the provided address into register B and performs an add operation with data present in register A, puts the result into register A and updates the FLAGS register
SUB|$[address]|Loads the data at the provided address into register B and performs a subtract operation with data present in register A, puts the result into register A and updates the FLAGS register
STA|$[address]|**Store A:** Stores the data present in register A in the address provided
LDI|#[int]|**Load Immediate:** Loads the provided signed 8-bit integer into register A
LDS|#[int], $[address]|**Load Store:** Loads the provided signed 8-bit integer into register A abd stores it in the address provided. In other words, it moves the immediate value provided into an address in memory
JMP|$[address]|Resets the Program Counter to the value present at the provided address
JC|$[address]|Resets the Program Counter to the value present at the provided address if the last arithmetic operation resulted in a carry
JZ|$[address]|Resets the Program Counter to the value present at the provided address if the result of last arithmetic operation was zero
ADS|$[address]|**Add Store:** Loads the data at the provided address into register B and performs an add operation with data present in register A, puts the result back into the provided address as well as register A and updates the FLAGS register
SUS|$[address]|**Subtract Store:** Loads the data at the provided address into register B and performs a subtract operation with data present in register A, puts the result back into the provided address as well as register A and updates the FLAGS register
OTH|$[address]|**Out Halt:** Loads the data at provided address into output register and halts the clock
OUT|-|Loads the data present in register A into output register
