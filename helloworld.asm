asect 0x00

ldi r0, display
ldi r2, 128
ldi r3, end_display

while
    cmp r3, r0
stays pl 
    ldi r1, 96
    while
        cmp r1, r2
    stays ne
        st r0, r1
        inc r1
    wend
    inc r0
wend


halt

asect 0xc0
display:
ds 32

asect 0xe0
end_display:

asect 0xe1
joystick:
ds 1

end