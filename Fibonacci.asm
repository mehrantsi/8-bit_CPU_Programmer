LDA $12
ADD $13
STA $12
JC  $7
OUT
SUS $13
JMP $0
LDI #0
STA $12
LDI #1
STA $13
JMP $0
#1
#0