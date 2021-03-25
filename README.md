# 8-bit CPU Programmer

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
