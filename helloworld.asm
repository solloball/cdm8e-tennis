asect 0xc0
display:

asect 0x00

ldi r0, display
ldi r1, 0xff

ldi r2, 33

while
    dec r2
stays nz
    st r0, r1
    inc r0
wend


halt


end