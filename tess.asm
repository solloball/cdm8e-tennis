asect 0xc0
display:

asect 0x00

ldi r0, display
ldi r1, 0xaa

st r0, r1

ld r0, r2

halt
end