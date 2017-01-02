/*
Marcus Stewart
934154
cpsc 359
assignment2
Drawblock16bpp
This function draws the block element of the maze game
input:
r1 = x
r2 = y
r4 = framebuffer
*/

.section .text

.globl Drawblueblock16bpp

Drawblueblock16bpp:
    push    {r0-r10}                        //save r\0 - r10

    ldr     r3, =0x4c0099                  //load color blue

    offset  .req    r0                  //use r0 as offset

    mov     offset, #0                  //set offset to 0
    add     offset, r1, r2, lsl #10     //calculat offset (y*1024) + x
    lsl     offset, #1                  //offset *2 for 16bpp

    mov     r5, #0                      // mov 0 to counter r5
    mov     r6, #0                      //set secound counter

blueblockfill:                           //loop to fill block
    strh    r3, [r4, offset]            //store r3(colour) to framebuffer + offset 
    add     offset, #1                  //increment offset
    add     r5, #1                      //increment first counter
    cmp     r5, #32                     //compare first counter to 62(bpp)
    bne     blueblockfill               //not equal branch to top of loop

    add     r2, #1                      //increment y
    mov     offset, #0                  //reset offset
    add     offset, r1, r2, lsl #10     //offset = y*1024+x
    lsl     offset, #1                  //offset * 2 (16bpp)
    add     r6, #1                      //increment second counter
    mov     r5, #0                      //reset first counter
    cmp     r6, #16                     //compare second counter to 16
    bne     blueblockfill                    //not equal branch to top of loop

    .unreq  r0                          //release offset from r0

    pop {r0-r10}                            //restore r0 - r10
    bx lr                               //return to calling function

.globl Drawredblock16bpp

Drawredblock16bpp:
    push    {r0-r10}                        //save r0 - r10

    ldr     r3, =0xfb00                  //load boarder red

    offset  .req    r0                  //use r0 as offset

    mov     offset, #0                  //set offset to 0
    add     offset, r1, r2, lsl #10     //calculat offset (y*1024) + x
    lsl     offset, #1                  //offset *2 for 16bpp

    mov     r5, #0                      // mov 0 to counter r5
    mov     r6, #0                      //set secound counter

redblockfill:                           //loop to fill block
    strh    r3, [r4, offset]            //store r3(colour) to framebuffer + offset
    add     offset, #1                  //increment offset
    add     r5, #1                      //increment first counter
    cmp     r5, #32                     //compare first counter to 32(bpp)
    bne     blueblockfill               //not equal branch to top of loop

    add     r2, #1                   //increment y
    mov     offset, #0                  //reset offset
    add     offset, r1, r2, lsl #10     //offset = y*1024+x
    lsl     offset, #1                  //offset * 2 (16bpp)
    add     r6, #1                      //increment second counter
    mov     r5, #0                      //reset first counter
    cmp     r6, #16                     //compare second counter to 31
    bne     redblockfill                //not equal branch to top of loop

    .unreq  r0                          //relesae offset rom r0

    pop {r0-r10}                            //restore r0 - r10
    bx lr                               //return to calling function
