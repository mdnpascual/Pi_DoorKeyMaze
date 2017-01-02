/*
Marcus Stewart
934154
Cpsc359
assignment2
Drawintro16bpp
This function draw the intro element for the maze
input:
r0 = frame buffer
*/

.section .text

.globl Drawintro16bpp

Drawintro16bpp:
    
    mov     r1, #150
    mov     r2, #100

    push    {r1-r8}                         //save r4
    ldr     r3, =0x0000                // set colour
    offset  .req    r4                   // use r4 as offset
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //calculate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    mov     r5, #1                       // set counter to 0
    mov     r6, #1024
    sub     r6, #150
 //draw borders of intro
introline1:                              //loop draw upper border
    strh    r3, [r0, offset]             //set color of first pixel
    add     offset, #1                   //increment offset by one
    add     r5, #1                       //increment count by 1
    cmp     r5, r6                      // check if counter is 64(16bpp)
    bne     introline1                   //not equal branch to top of loop

    add     r2, #512                      // increment y by 32 pixels
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //calculate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    mov     r5, #0                       //reset counter
introline2:                              //loop draw lower border
    strh    r3, [r0, offset]             //set color of first pixel
    add     offset, #1                   //increment offset by one
    add     r5, #1                       //increment count by 1
    cmp     r5, r6                      // check if counter is 64 (16bpp)
    bne     introline2                   //not equal branch to top of loop

    sub     r2, #512                      // reset  y
    mov     offset, #0                   //reset offset
    add     offset, r1,r2, lsl #10       //calculate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    mov     r5, #0                       // reset counter
    push {r1}                            //save r1
introline3:                              //loop to draw left border
    strh    r3, [r0, offset]             //set color of pixel at framebuffer + offset
    add     r1, #1024                    // add 1024 to r1
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      // recaluclate offset
    lsl     offset, #1                   // offset *2 for 16bpp
    add     r5, #1                       //increment counter
    cmp     r5, #512                   // check counter to 32
    bne     introline3                   //not equal branch back to florline3 loop

    pop {r1}                             //restore r1

    add     r1, #512                      //add 32 to r1
    sub     r1, #75
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //recaluclate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    mov     r5, #0                       //reset counter

introline4:                              //loop for right border
    strh   r3,  [r0, offset]             // set pixel at framebuffer + offst
    add    r1, #1024                     // add 1024 to r1
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //recaluclate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    add     r5, #1                       //increment counter
    cmp     r5, #512                      //compare counter to 32
    bne     introline4                   // not equal branch to introline4 loop

    pop     {r1-r8}                        //restore r4
    bx      lr                          //return to calling function


.section .data


