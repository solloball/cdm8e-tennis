asect 0x44
    setsp 0xbf #0xbf is the last avalible memory cell that we can operate with
    ldi r0, display

    ldi r1, xBall
    ldi r2, 10 #set coor x to xBalls
    st r1, r2

    ldi r2, 10 #set coor y to yBalls
    ldi r1, yBall
    st r1, r2

    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
        jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right

    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right

    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right

    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right

    jsr go_back_right
    jsr go_back_right
    jsr go_back_right
    jsr go_back_right



halt

draw_pixel:
    push r3

    ldi r0, display
    ldi r1,xBall
    ld r1, r1
    add r1, r0
    ldi r1, 0x20 #write ball
    ldi r2, yBall
    ld r2, r2
    or r2, r1
    st r0, r1

    pop r3
    rts

go_forward:
    push r0
    push r1

    jsr inc_yBall
    jsr draw_pixel

    pop r1
    pop r0
    rts

go_back:
    push r0
    push r1

    jsr dec_yBall
    jsr draw_pixel

    pop r1
    pop r0
    rts

clr_pixel:

    ldi r0, xBall
    ld r0, r0
    ldi r1, display
    add r1, r0
    ldi r1, 0
    st r0, r1 
    rts

go_right:
    push r0
    push r1

    jsr clr_pixel
    jsr inc_xBall
    jsr draw_pixel

    pop r1
    pop r0
    rts

go_left:
    push r0
    push r1

    jsr clr_pixel
    jsr dec_xBall
    jsr draw_pixel

    pop r1
    pop r0
    rts

go_forward_right:
    push r0
    push r1

    jsr clr_pixel
    jsr inc_xBall
    jsr inc_yBall
    jsr draw_pixel

    pop r1
    pop r0
    rts

go_forward_left:
    push r0
    push r1

    jsr clr_pixel
    jsr dec_xBall
    jsr inc_yBall
    jsr draw_pixel

    pop r1
    pop r0
    rts

go_back_left:
    push r0
    push r1

    jsr clr_pixel
    jsr dec_xBall
    jsr dec_yBall
    jsr draw_pixel

    pop r1
    pop r0
    rts

go_back_right:
    push r0
    push r1

    jsr clr_pixel
    jsr inc_xBall
    jsr dec_yBall
    jsr draw_pixel

    pop r1
    pop r0
    rts

dec_xBall:
    ldi r0, xBall
    ld r0, r1
    dec r1
    st r0, r1
    rts

inc_xBall:
    ldi r0, xBall
    ld r0, r1
    inc r1
    st r0, r1
    rts

dec_yBall:
    ldi r0, yBall
    ld r0, r1
    dec r1
    st r0, r1
    rts

inc_yBall:
    ldi r0, yBall
    ld r0, r1
    inc r1
    st r0, r1
    rts

asect 0x40
xBall: ds 1
yBall: ds 1
yPlatform1: ds 1
yPlatform2: ds 1



asect 0x00
display:
ds 32


asect 0x20
joystick:
ds 1

end