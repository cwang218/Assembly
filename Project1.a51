MAIN:
clr 84H
clr 85H
clr A4H
clr A5H
clr 91H
clr 92H

mov r0, #0
mov r1, #0

BUTTON:
jb p2.0, INC0
jb p0.1, DEC0
jb p2.3, RESET0
jb p0.2, INC1
jb p0.0, RESET1
jb p2.1, SUM
jb p0.3, PRODUCT
jb p2.2, BEEP1

sjmp MAIN

INC0:
INC r0
lcall ROLLOVER0
lcall FLASH0
sjmp BUTTON

INC1:
INC r1
lcall ROLLOVER1
lcall FLASH1
sjmp BUTTON

DEC0:
DEC r0
lcall FLASH0
sjmp BUTTON

RESET0:
clr r0
lcall LED0
sjmp BUTTON

RESET1:
clr r1
lcall LED1
sjmp BUTTON

ROLLOVER0:
cjne A, #7, NEXT0
NEXT0:
jnb psw.7, BEEP
ret

ROLLOVER1:
cjne A, #7, NEXT1
NEXT1:
jnb psw.7, BEEP
ret

BEEP:
set p3.0
clr p3.0
sjmp BUTTON

BEEP1:
mov r3, #3
LOOP3:
set p3.0
nop
clr p3.0
djnz r3, LOOP3
sjmp BUTTON

LED0:
mov A, r0
mov B, r1
div AB
jb psw.7 GREEN
GREEN:
YELLOW:
RED:
ret

LED1:
mov A, r1
ret

SUM:
mov A, r0
add A, r1
LOOP0:
set p2.5
set p0.7
set p2.6
clr p2.5
clr p0.7
clr p2.6
djnz A, LOOP0
sjmp BUTTON

PRODUCT:
mov A, r0
mov B, r1
MUL AB
mov r2, A
LOOP1:
set p0.7
clr p0.7
djnz A, LOOP1
mov A, r2
LOOP2:
djnz B, LOOP1
sjmp BUTTON

end
