/*
Marcus Stewart
934154
Cpsc359
assignment2
Whitescreen16bpp
This function sets every pixel in the frame buffer to white to use as a background
input:
r4 = framebuffer
*/


.section .text

.globl Whitescreen16bpp

Whitescreen16bpp:
    push    {r1-r10}              // save r1, r2, r3, r4

    mov     r1, #0                       //set x to 0
    mov     r2, #0                       // set y to 0
    ldr     r3, =0xFFFF                  // set colour to white
    ldr     r6, =0x1807FE                // set last offset

    offset  .req    r0                   // use r4 as offset
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //offset=y*1024+x
    lsl     offset, #1                   //offset *2 (16bpp)
    mov     r5, #0                       // set counter to 0
fill:
    strh    r3, [r4, offset]             // colour pixel at framebuffer + offset
    add     offset, #1                   // increment offset
    add     r5, #1                       // increment counter
    cmp     r5, r6                       //compare counter to last offset
    bne     fill                         // not equal branch to fill loop

    .unreq  r0

    pop     {r1-r10}             //restor r1, r2, r3 ,r4
    bx      lr                           // return to calling function

.section .data



