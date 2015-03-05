mov R0, P0
mov R1, P1
mov A, #3
LOOP:
mov R3, A
mov P2, R0
mov R2, P2
mov A, R0
add A, R1
mov P3, A
mov A, R3
subb A, #2
jz NEXT
sjmp LOOP
NEXT:
end
