/*
Marcus Stewart
934154
cpsc359
assignment2
Drawman16bpp
this function draw a man/player element of the maze
input:
r1 = x
r2 = y
r4 = framebuffer
*/
.section .text

.globl Drawman16bpp

Drawman16bpp:
    push    {r0-r10}                       //save r4

    ldr     r3, =0x333300              //set colour

    offset  .req    r0                 //use r4 as offset
    mov     offset, #0                 //set offset to 0

    add     offset, r1, r2, lsl #10    //offset = y*1024+x 
    lsl     offset, #1                 //offset *2 (16bpp)
    mov     r5, #0                     //set counter to 0
    //draw borders of man
manborder1:                            //loop to draw first border for man
    strh    r3, [r4, offset]           //set color of first pixel
    add     offset, #1                 //increment offset by one
    add     r5, #1                     //increment count by 1
    cmp     r5, #64                    // check if counter is 64(16bpp)
    bne     manborder1                 //not equal branch top of loop

    add     r2, #32                    //add 32 to y
    mov     offset, #0                 //reset offset
    add     offset, r1, r2, lsl #10    //y*1024+x
    lsl     offset, #1                 //offset *2 (16bpp)
    mov     r5, #0                     //reset counter
manborder2:                            //loop for second border
    strh    r3, [r4, offset]           //set color of first pixel
    add     offset, #1                 //increment offset by one
    add     r5, #1                     //increment count by 1
    cmp     r5, #64                    // check if counter is 64
    bne     manborder2                 //not equal branch to top of loop

    sub     r2, #32                    //sub 32 from y
    mov     offset, #0                 //reset offset
    add     offset, r1,r2, lsl #10     //y*1024+x
    lsl     offset, #1                 //offset*2 (16bpp)
    mov     r5, #0                     //reset counter  
    push    {r1}                       //save r1
manborder3:                            //loop for third border
    strh    r3, [r4, offset]           //store r3(colour) to framebuffer+offset
    add     r1, #1024                  //add 1024 to x
    mov     offset, #0                 //reset offset
    add     offset, r1, r2, lsl #10    //y*1024+x
    lsl     offset, #1                 //offset*2 (16bpp)
    add     r5, #1                     //increment counter
    cmp     r5, #32                    //compare counter to 32
    bne     manborder3                 //not equal branch top of loop

    pop     {r1}                       //restore r1
    add     r1, #32                    //add 32 to x
    mov     offset, #0                 //reset offset
    add     offset, r1, r2, lsl #10    //y*1024+x  
    lsl     offset, #1                 //offset*2 (16bpp)
    mov     r5, #0                     //reset counter
    push {r1}                          //save r1 

manborder4:                            //loop for fourth boarder
    strh   r3,  [r4, offset]           //store r3(colour) to framebuffer+offset
    add    r1, #1024                   //add 1024 to x
    mov    offset, #0                  //reset offset
    add     offset, r1, r2, lsl #10    //y*1024+x
    lsl     offset, #1                 //offset*2 (16bpp)
    add     r5, #1                     //increment counter
    cmp     r5, #32                    //compare counter to 32
    bne     manborder4                 //not equal branch to top of loop

    pop {r1}                           //restore x
    sub     r1, #32                    //reset x

//    push    {r1,r2}                    //save x and y
    add     r1, #14                    //add 14 to x
    add     r2, #1                     //add 1 to y
    mov     offset, #0                 //reset offset
    add     offset, r1, r2, lsl #10    //y*1024+x
    lsl     offset, #1                 //offset*2 (16bpp)
    mov     r5, #0                     //set counter to 0
    ldr     r3, =0xffcc99              //change colour
manline1part2:                         //loop part2 line1
    strh    r3, [r4, offset]           //store r3(colour) to framebuffer+offset
    add     offset, #1                 //increment offset
    add     r5, #1                     //increment counter
    cmp     r5, #8                     //compare counter to 8 (16bpp)
    bne     manline1part2              //not equal branch to top of loop

    mov     r5, #0                     //reset counter
    mov     offset, #0                 //reset offset
    add     r2, #1                     //increment y
    sub     r1, #3                     //add 3 to x
    add     offset, r1, r2, lsl #10    //y*1024+x
    lsl     offset, #1                 //offset*2 (16bpp)
manline2part2:                         //loop part2 line2
    strh    r3, [r4,offset]            //store r3(colour) to framebuffer + offset
    add     offset, #1                 //increment offset
    add     r5, #1                     //increment counter            
    cmp     r5, #20                    //compare coounter to 20 (16bpp)
    bne     manline2part2              //not equal branch top of loop

    mov     r5, #0
    mov     r6, #0
    mov     offset, #0
    add     r2, #1
    sub     r1, #3
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
manline3part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #32
    bne     manline3part2

    mov     r5, #0
    add     r6, #1
    mov     offset, #0
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    cmp     r6, #4
    bne     manline3part2

    mov     r5, #0
    mov     offset, #0
    add     r1, #3
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
manline7part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #20
    bne     manline7part2

    mov     r5, #0
    mov     offset, #0
    add     r1, #3
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
manline8part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #8
    bne     manline8part2

    mov     r5, #0
    mov     offset, #0
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    ldr     r3, =0x0033ff
manline9part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #8
    bne     manline9part2

    mov     r5, #0
    mov     offset, #0
    add     r2, #1
    sub     r1, #8
    add     offset, r1, r2, lsl #10
    lsl     offset, #1

manline10part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #40
    bne     manline10part2

    mov     r5, #0
    sub     r1, #2
    add     r2, #1
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    ldr     r3, =0xffcc99

manline11part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #4
    bne     manline11part2

    mov     r5, #0
    ldr     r3, =0x0033ff
manline11part3:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #40
    bne     manline11part3

    mov     r5, #0
    ldr     r3, =0xffcc99

manline11part4:
    strh    r3,     [r4,offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #4
    bne     manline11part4

    mov     r5, #0
    mov     offset, #0
    add     r1, #2
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    ldr     r3, =0x0033ff
manline12part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #40
    bne     manline12part2


    mov     r5, #0
    add     r1, #6
    mov     r6, #0
    mov     offset, #0
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
manline13part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #16
    bne     manline13part2

    mov     r5, #0
    mov     offset, #0
    add     r2, #1
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    add     r6, #1
    cmp     r6, #5
    bne     manline13part2

    mov     r5, #0
    mov     r6, #0
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    ldr     r3, =0x990066
manline18part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #16
    bne     manline18part2

    mov     r5, #0
    mov     offset, #0
    add     r2, #1
    add     offset, r1, r2 ,lsl #10
    lsl     offset, #1
    add     r6, #1
    cmp     r6, #2
    bne     manline18part2

    mov     r5, #0
    mov     r6, #0
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
manline20part2:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #6
    bne     manline20part2

    mov     r5, #0
    add     r2, #1
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    add     r6, #1
    cmp     r6, #6
    bne     manline20part2

    mov     r5, #0
    mov     r6, #0
    mov     offset, #0
    add     r1, #5
    sub     r2, #6
    add     offset, r1, r2, lsl #10
    lsl     offset, #1

manline20part4:
    strh    r3,     [r4, offset]
    add     offset, #1
    add     r5, #1
    cmp     r5, #6
    bne     manline20part4

    mov     r5, #0
    add     r2, #1
    mov     offset, #0
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    add     r6, #1
    cmp     r6, #6
    bne     manline20part4

breaktest1:

    mov     offset, #0
    sub     r1, #4
    add     offset, r1, r2, lsl #10
    lsl     offset, #1
    ldr     r3, =0xffcc99
    strh    r3,     [r4, offset]
    add     offset, #10
    strh    r3,     [r4, offset]

    mov     r5, #0
    mov     r6, #0
    mov     offset, #0
    add     r2, #1
    sub     r1, #15
    add     offset, r1, r2, lsl #10
    lsl     offset, #1

breaktest2:

    .unreq  r0
    
    pop     {r0-r10}
    bx      lr

.section .data




