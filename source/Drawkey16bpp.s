/*
Marcus Stewart
934154
cpsc359
assignment 2
Drawkey16bpp
This function draws a key element for  the maze
input:
r1 = x
r2 = y
r4 = framebuffer
*/


.section .text

.globl Drawkey16bpp

Drawkey16bpp:
    push    {r0-r10}                      //save r4

    ldr     r3, =0x7bef            //set colour

    offset  .req    r0                //use r4 as offset
    mov     offset, #0                //set offset to 0
    add     offset, r1, r2, lsl #10   //y*1024+x
    lsl     offset, #1                //offset *2 (16bpp) 
    mov     r5, #0                    //set counter to 0
    //draw borders of key
keyborder1:
    strh    r3,     [r4, offset]     //set color of first pixel
    add     offset, #1              //increment offset by one
    add     r5, #1                  //increment count by 1
    cmp     r5, #64                 // check if counter is 64
    bne     keyborder1

    add     r2, #32
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    mov     r5, #0
keyborder2:
    strh    r3,     [r4, offset]     //set color of first pixel
    add     offset, #1              //increment offset by one
    add     r5, #1                  //increment count by 1
    cmp     r5, #64                 // check if counter is 64
    bne     keyborder2

    sub     r2, #32
    mov     offset, #0
    add     offset, r1,r2, lsl #10
    lsl     offset, #1
    mov     r5, #0 
    push    {r1}
keyborder3:
    strh    r3,     [r4, offset]
    add     r1, #1024
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    add     r5, #1
    cmp     r5, #32
    bne     keyborder3

    pop     {r1}
    add     r1, #32
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    mov     r5, #0
    push {r1}

keyborder4:
    strh   r3,     [r4, offset]
    add    r1, #1024
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    add     r5, #1
    cmp     r5, #32
    bne     keyborder4

    pop {r1}
    sub     r1,#32

    add     r1, #11
    add     r2, #2
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    mov     r5, #0
    ldr     r3, =0xffff00
keyline1:
    strh    r3,     [r4,offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #16
    bne     keyline1

    mov     r5, #0
    mov     offset, #0
    add     r2, #1
    sub     r1, #4
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
keyline2:
    strh    r3,     [r4, offset]        
    add     offset, #1
    add     r5, #1
    cmp     r5, #32
    bne     keyline2

    mov     r5, #0
    mov     r6, #0
    mov     offset, #0
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     OFFSET, #1
keyline3part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #4
    bne     keyline3part2

    mov     r5, #0
    mov     offset, #0
    add     r1, #14
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
keyline3part4:
    strh    r3, [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #4
    bne     keyline3part4

    mov     r5, #0
    mov     offset, #0
    add     r2, #1
    sub     r1, #14
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    add     r6, #1
    cmp     r6, #5
    bne     keyline3part2

    mov     r5, #0
    mov     r6, #0
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
keyline8part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #32
    bne     keyline8part2

    mov     r5,#0
    mov     offset, #0
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    add     r6, #1
    cmp     r6, #2
    bne     keyline8part2
    
    mov     r5, #0
    mov     r6, #0
    mov     offset, #0
    add     r1, #6
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
keyline10part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #8
    bne     keyline10part2

    mov     r5, #0
    mov     offset, #0
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    add     r6, #1
    cmp     r6, #2
    bne     keyline10part2

    mov     r5, #0                       //reset first counter
    mov     r6, #0                       //reset second counter
    mov     offset, #0                   //reset offset
    sub     r1, #3                       //sub 3 from x
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp) 
keyline12part2:                          //loop for part2 of line12
    strh    r3, [r4, offset]             //store r3(colour) to framebuffer+offset
    add     offset, #1                   //increment offser
    add     r5, #1                       //increment first counter
    cmp     r5, #14                      //compare first counter to 14 (16bpp)
    bne     keyline12part2               //not equal branch to top of loop

    mov     r5, #0                       //reset first counter
    mov     offset, #0                   //reset offset
    add     r2, #1                       //INCREMENT Y
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
    add     r6, #1                       //increment second counter
    cmp     r6, #2                       //compare second counter to 2
    bne     keyline12part2               //not equal branch to top of line12

    mov     r5, #0                       //reset first counter
    mov     r6, #0                       //reset second counter
    mov     offset, #0                   //reset offset
    add     r1, #3                       //add 3 to x
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
keyline14part2:                           //loop for line14 part 2
    strh    r3, [r4, offset]             //store r3(colour) to framebuffer + offset
    add     offset, #1                   //increment offset
    add     r5, #1                       //increment first counter
    cmp     r5, #8                       //compare first counter to #8 (16bpp)
    bne     keyline14part2               //not equal branch to top of loop

    mov     r5, #0                       //reset first counter
    mov     offset, #0                   //reset offset
    add     r2, #1                       //increment y
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
    add     r6, #1                       //increment second counter
    cmp     r6, #3                       //compare second counter to 3
    bne     keyline14part2               //not equal brranch to top of line 14

    mov     r5, #0                       //reset first counter
    mov     r6, #0                       //reset second counter
    mov     offset, #0                   //reset offset
    sub     r1, #5                       //sub 5 from x
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset*2 (16bpp)
keyline17part2:                          //loop line 17 part2
    strh    r3, [r4, offset]             //str r3(colour) to framebuffer + offset
    add     offset, #1                   //increment offset
    add     r5, #1                       //increment first counter
    cmp     r5, #18                      //compare first counter to 18 (16bpp)
    bne     keyline17part2               //not equal branch to top of loop

    mov     r5, #0                       //reset first coounter
    mov     offset, #0                   //reset offset
    add     r2, #1                       //INCREMENT Y
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset*2 (16bpp)
    add     r6, #1                       //increment second counter
    cmp     r6, #2                       //compare second counter to 2
    bne     keyline17part2               //not equal branch to top of line 17   

    mov     r5, #0                       //reset first counter
    mov     r6, #0                       //reset second counter
    mov     offset, #0                   //reset offset
    add     r1, #5                       //add 5 to x
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
keyline19part2:                          //loop part 2 of line19
    strh    r3, [r4, offset]             //store r3(colour) to framebuffer+offset
    add     offset, #1                   //increment offset
    add     r5, #1                       //increment counter
    cmp     r5, #8                       //comparew first counter to 8 (16bpp)
    bne     keyline19part2               //not equal branch to top of loop

    mov     r5, #0                       //reset first counter
    mov     offset, #0                   //reset offset
    add     r2, #1                       //increment y
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
    add     r6, #1                       //increment second coounter
    cmp     r6, #3                       //compare second counter to 3
    bne     keyline19part2               //not equal branch to top of line19

    mov     r5, #0                       //reset frst counter
    mov     r6, #0                       //reset second counter
    mov     offset, #0                   //reset offset
    sub     r1, #3                       //sub 3 from x
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
keyline22part2:                          //loop part2 of line 22
    strh    r3, [r4, offset]             //store r3(colour) to framebuffwer+offset
    add     offset, #1                   //increment offset
    add     r5, #1                       //increment counter
    cmp     r5, #14                      //compare first counter to 16 (16bpp)
    bne     keyline22part2               //not equal branch to top of loop
    
    mov     r5, #0                       //reset first counter
    mov     offset, #0                   //reset offset
    add     r2, #1                       //increment y
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
    add     r6, #1                       //increment second counter
    cmp     r6, #2                       //compare second counter to 2
    bne     keyline22part2               //not equal branch to top of line 22
    
    mov     r5, #0                       //reset first counter
    mov     r6, #0                       //reset second counter
    mov     offset ,#0                   //reset offset
    add     r1, #3                       //add 3 to x
    add     offset, r1, r2, lsl #10      //y*1024+x 
    lsl     offset, #1                   //offset *2 (16bpp)
keyline24part2:                          //loop line 24 part2
    strh    r3, [r4, offset]             //store r3(colour) to framebuffer + offset
    add     offset, #1                   //increment offset
    add     r5, #1                       //increment counter
    cmp     r5, #8                       //compare first counter to 8 (16bpp)
    bne     keyline24part2               //not equal branch to top of loop

    mov     r5, #0                       //reset first counter
    mov     offset, #0                   //reset offset
    add     r2, #1                       //incrmrnet y
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
    add     r6, #1                       //increment second counter
    cmp     r6, #2                       //compare second counter to 2
    bne     keyline24part2               //not equal branch to top of line 24

    mov     r5, #0                       //reset first counter
    mov     r6, #0                       //reset second counter
    mov     offset, #0                   //reset offset
    sub     r1, #2                       //sub 2 from x
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset*2 (16bpp)
keyline26part2:                          //loop part 2 line 26
    strh    r3, [r4, offset]             //store r3(colour) to framebuffer + offset
    add     offset, #1                   //increment offset
    add     r5, #1                       //increment first counter
    cmp     r5, #12                      //compare frst counter to 12 (16bpp)
    bne     keyline26part2               //not equal branch to top of loop
    
    mov     r5, #0                       //reset first counter
    mov     offset, #0                   //reset offset
    add     r2, #1                       //increment y
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset*2 (16bpp)
    add     r6 ,#1                       //increment second counter
    cmp     r6, #2                       //compare second counter to 2
    bne     keyline26part2               //not equal branch to top of line 26

    mov     r5, #0                       //reset first coounter
    mov     r6, #0                       //reset secnd counter
    mov     offset, #0                   //reset offset
    add     r1, #2                       //add 2 to x
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset*2 (16bpp)
keyline28part2:                          //loop part line 28
    strh    r3, [r4, offset]             //store r3(colour) to framebuffer + offset
    add     offset, #1                   //iincrement offset
    add     r5, #1                       //increment counter
    cmp     r5, #8                       //compare first counter to 8 (16bpp)
    bne     keyline28part2               //not equal branch to top of loop

    mov     r5, #0                       //reset first counter
    mov     offset, #0                   //reset offset
    add     r2, #1                       //increment y
    add     offset, r1, r2, lsl #10      //y*1024+x
    lsl     offset, #1                   //offset*2 (16bpp)
    add     r6, #1                       //increment second counter
    cmp     r6, #3                       //compare second counter to 3
    bne     keyline28part2               //not equal branch to top of line 28

    .unreq  r0

    pop {r0-r10}                             //restore r4
    bx  lr                               //branch to calling function

