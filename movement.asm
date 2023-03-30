asect 0x04



    setsp 0xbf #0xbf is the last avalible memory cell that we can operate with
    ldi r0, display

    ldi r1, xBall
    ldi r2, 0x16 #set coor x to xBalls
    st r1, r2

    ldi r2, 0x10 #set coor y to yBalls
    ldi r1, yBall
    st r1, r2

    jsr draw_pixel

halt

draw_pixel:
    pushall

    ldi r0, display
    ldi r1,xBall
    ld r1, r1
    add r1, r0
    ldi r1, 0x20 #write ball
    ldi r2, yBall
    ld r2, r2
    or r2, r1
    st r0, r1

    popall
    rts

asect 0x00
xBall: ds 1
yBall: ds 1
yPlatform1: ds 1
yPlatform2: ds 1



asect 0xc0
display:
ds 32

asect 0xe0
end_display:

asect 0xe1
joystick:
ds 1

end