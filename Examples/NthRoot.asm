LDA $13
SUB $11
JC  $7
LDI #0
SUB $15
JZ  $16
JMP $18
STA $13
LDA $14
ADS $12
JMP $0
#1
#0
#2
#3 ;nth root to find
#0
LDA $12
STA $15
LDA $36
SUB $34
JC  $22
OTH $35
STA $36
LDI #1
ADS $35
LDA $12
ADS $34
LDA $15
STA $13
LDS #0, $12
LDS #1, $14
LDA $35
ADS $14
JMP $0
#1
#0 ;result
#125 ;input
