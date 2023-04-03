asect 0x46

    #setsp 0xbf #0xbf is the last avalible memory cell that we can operate with

    ldi r1, xBall
    ldi r2, 10 #set coord x to xBalls
    st r1, r2

    ldi r2, 10 #set coord y to yBalls
    ldi r1, yBall
    st r1, r2

    ldi r0, display
    ldi r1, 110 #set left platform in the middle
    st r0, r1

    ldi r0, end_display #set right platform
    st r0, r1

    ldi r3, 0
    while
        tst r3
    stays eq   # = while(1)
        ldi r0, joystick
        ld r0, r0
        if 
            tst r0
        is eq
        then
            jsr go_up_pl_left
        else
            if
                tst r0
            is pl
            then
                jsr go_down_pl_left
            fi
        fi
    wend

halt

draw_pixel:
    ldi r0, display
    ldi r1,xBall
    ld r1, r1
    add r1, r0
    ldi r1, 0x20 #write ball
    ldi r2, yBall
    ld r2, r2
    or r2, r1
    st r0, r1
    rts

go_up:
    jsr inc_yBall
    jsr draw_pixel
    rts

go_down:
    jsr dec_yBall
    jsr draw_pixel
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
    jsr clr_pixel
    jsr inc_xBall
    jsr draw_pixel
    rts

go_left:
    jsr clr_pixel
    jsr dec_xBall
    jsr draw_pixel
    rts

go_up_right:
    jsr clr_pixel
    jsr inc_xBall
    jsr inc_yBall
    jsr draw_pixel
    rts

go_up_left:
    jsr clr_pixel
    jsr dec_xBall
    jsr inc_yBall
    jsr draw_pixel
    rts

go_down_left:
    jsr clr_pixel
    jsr dec_xBall
    jsr dec_yBall
    jsr draw_pixel
    rts

go_down_right:
    jsr clr_pixel
    jsr inc_xBall
    jsr dec_yBall
    jsr draw_pixel
    rts

inc_xBall:
    ldi r0, xBall
    ld r0, r1
    inc r1
    st r0, r1
    rts

dec_xBall:
    ldi r0, xBall
    ld r0, r1
    dec r1
    st r0, r1
    rts

inc_yBall:
    ldi r0, yBall
    ld r0, r1
    if
        ldi r2, 0x7f #top_display
        cmp r2, r1
    is ne
        inc r1
        st r0, r1
    fi #иначе...нужно прописать логику отскока
    rts

dec_yBall:
    ldi r0, yBall
    ld r0, r1
    if
        ldi r2, 0x5e #bottom_display
        cmp r2, r1
    is ne
        dec r1
        st r0, r1
    fi #иначе...нужно прописать логику отскока
    rts

go_up_pl_left:
    ldi r0, display
    ld r0, r1
    if
    ldi r2, 0x7d #top_display - 2
        cmp r1, r2
    is ne
        inc r1
        st r0, r1
    fi
    rts

go_down_pl_left:
    ldi r0, display
    ld r0, r1
    if
        ldi r2, 0x60 #bottom_display + 2
        cmp r2, r1
    is ne
        dec r1
        st r0, r1
    fi
    rts

go_up_pl_right:
    ldi r0, end_display
    ld r0, r1
    if
    ldi r2, 0x7d #top_display - 2
        cmp r1, r2
    is ne
        inc r1
        st r0, r1
    fi
    rts

go_down_pl_right:
    ldi r0, end_display
    ld r0, r1
    if
        ldi r2, 0x60 #bottom_display + 2
        cmp r2, r1
    is ne
        dec r1
        st r0, r1
    fi
    rts

asect 0x40
xBall: ds 1
yBall: ds 1
yPlatform1: ds 1
yPlatform2: ds 1
top_display: dc 0x7f
bottom_display: dc 0x5e



asect 0x00
display:
ds 31
end_display:
ds 1

asect 0x20
joystick:
ds 1

end