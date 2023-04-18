asect 0x48

    ldi r1, xBall
    ldi r2, 10 #set coord x to xBalls
    st r1, r2

    ldi r1, yBall
    #ldi r2, 10 #set coord y to yBalls
    ldi r2, 0x3a #set coord y to yBalls
    st r1, r2


    ldi r0, V #cant use 8 and 0
    ldi r1, 0x77 # левые четыре биты отводятся под занчение скорости для координаты Y, которые хранятся в дополненном коде, 4 правых бита под значения скорости X
    st r0, r1


    ldi r0, display
    ldi r1, 110 #set left platform in the middle
    inc r0
    st r0, r1

    ldi r0, end_display #set right platform
    ldi r1, 110 #set left platform in the middle
    dec r0
    st r0, r1

    while
        ldi r0, 0
        tst r0
    stays eq 


        #  reflect on Y
        
        if
            ldi r0, yBall
            ld r0, r0
            ldi r1, 0x1f
            cmp r0, r1
        is ge
            ldi r1, reflectY
            st r1, r0
        fi
        if
            ldi r0, yBall
            ld r0, r0
            ldi r1, 0
            cmp r1, r0
        is ge
            ldi r1, reflectY
            st r1, r0
        fi
        
        #  reflect on X

        if
            ldi r0, xBall
            ld r0, r0
            ldi r1, 0x1d
            cmp r0, r1
        is ge
            ldi r1, reflectX
            st r1, r0
        fi
        if
            ldi r0, xBall
            ld r0, r0
            ldi r1, 2
            cmp r1, r0
        is ge
            ldi r1, reflectX
            st r1, r0
        fi



        # clear pixel

        ldi r0, 0 
        st r3, r0

        # update pixel 

        ldi r0, update
        ld r0, r3
        ldi r0, display
        add r0, r3

        ldi r2, yBall
        ld r2, r2
        ldi r1, 32
        or r2, r1

        # draw pixel

        st r3, r1

        # movement of left platform

        ldi r0, joystick
        ld r0, r0
        if 
            tst r0
        is eq
            jsr go_up_pl_left
        else
            if
                tst r0
            is pl
                jsr go_down_pl_left
            fi
        fi

        # movement of right platform
        ldi r0, 0x1e # x of right platform 
        ld r0, r0
        inc r0
        ldi r1, 0x1f # 00011111
        and r0, r1
        ldi r2, yBall
        ld r2, r2
        if
            cmp r2, r1
        is lo
            jsr go_down_pl_right
        else 
            jsr go_up_pl_right

        fi

    wend

halt

clear_pixel:
    ldi r0, display
    ldi r1, xBall
    ldi r3, 0x1f
    ld r1, r1
    and r3, r1 
    add r1, r0
    ldi r1, 0x0
    st r0, r1 
    rts

go_up_pl_left:
    ldi r0, 1 # x of left platform 
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
    ldi r0, 1 # x of left platform 
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
    ldi r0, 0x1e # x of right platform 
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
    ldi r0, 0x1e # x of right platform 
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
yPlatform1: ds 1
yPlatform2: ds 1
top_display: dc 0x3f
bottom_display: dc 0x5e


asect 0x00
display:
ds 31
end_display:
ds 1

asect 0x20
joystick:
ds 1

asect 0x21
score_left:
ds 1

asect 0x22
score_right:
ds 1

asect 0x23
V:
ds 1

asect 0x24
xBall:
ds 1

asect 0x25
yBall:
ds 1


asect 0x26
update:
ds 1

asect 0x27
reflectX:
ds 1

asect 0x28
reflectY:
ds 1

end