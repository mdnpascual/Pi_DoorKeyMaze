/*
Marcus Stewart
934154
cpsc 359
assignment2
Drawstart16bpp
This function draws the start element of the maze game
input:
r1 = x
r2 = y
r4 = framebuffer
*/

.section .text

.globl Drawstart16bpp

Drawstart16bpp:
    mov     r11,r1
    push    {r0-r10}
    ldr     r3, =0x7e0                  //load boarder color
   
    mov     r12, r2
    offset  .req    r0                  //use r4 as offset
    mov     offset, #0
    add     offset, r1, r2, lsl #10     //calculat offset (y*1024) + x
    lsl     offset, #1                  //offset *2 for 16bpp

    mov     r5, #0                      // mov 0 to counter r5
    mov     r6, #0                      //set secound counter

startfill:                               //loop to fill start
    strh    r3, [r4, offset]            //store r3(colour) to framebuffer + offset 
    add     offset, #1                  //increment offset
    add     r5, #1                      //increment first counter
    cmp     r5, #64                     //compare first counter to 62(bpp)
    bne     startfill                    //not equal branch to top of loop

    add     r1, #1024                   //add 1024 to x
    mov     offset, #0                  //reset offset
    add     offset, r1, r2, lsl #10     //offset = y*1024+x
    lsl     offset, #1                  //offset * 2 (16bpp)
    add     r6, #1                      //increment second counter
    mov     r5, #0                      //reset first counter
    cmp     r6, #32                     //compare second counter to 31
    bne     startfill                    //not equal branch to top of loop

    .unreq  r4

    pop {r0-r10}
    bx lr                               //return to calling function

.section .data


