LOOP:
mov R0, P0
mov R1, P1
mov A, R1
anl A, #0
orl A, #11110000
mov R1, A
mov P2, R0
mov P3, R1
sjmp LOOP
end
