/*
Marcus Stewart
934154
cpsc 359
assignment2
Drawsgblock16bpp
This function draws the sgblock element of the maze game
input:
r1 = x
r2 = y
r4 = framebuffer
*/

.section .text

.globl Drawsgblock16bpp

Drawsgblock16bpp:
    push    {r0-r10}                    //save r0 - r10

    ldr     r3, =0x7e0                  //load boarder color

    offset  .req    r0                  //use r0 as offset

    mov     offset, #0                  //reset offet
    add     offset, r1, r2, lsl #10     //calculat offset (y*1024) + x
    lsl     offset, #1                  //offset *2 for 16bpp

    mov     r5, #0                      // mov 0 to counter r5
    mov     r6, #0                      //set secound counter

sgblockfill:                            //loop to fill wall
    strh    r3, [r4, offset]            //store r3(colour) to framebuffer + offset 
    add     offset, #1                  //increment offset
    add     r5, #1                      //increment first counter
    cmp     r5, #16                     //compare first counter to 62(bpp)
    bne     sgblockfill                 //not equal branch to top of loop

    add     r2, #1                      //increment y
    mov     offset, #0                  //reset offset
    add     offset, r1, r2, lsl #10     //offset = y*1024+x
    lsl     offset, #1                  //offset * 2 (16bpp)
    add     r6, #1                      //increment second counter
    mov     r5, #0                      //reset first counter
    cmp     r6, #8                      //compare second counter to 8
    bne     sgblockfill                 //not equal branch to top of loop

    .unreq  r0                          //release offset from r0

    pop {r0-r10}                        //restore r0 - r10
    bx lr                               //return to calling function

