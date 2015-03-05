mov A, P0
LOOP:
mov P1, 0xAA
mov P1, 0xBB
subb A, #1
jz Next
sjmp LOOP
Next:
end

