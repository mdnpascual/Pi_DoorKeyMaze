/*
Marcus Stewart
934154
Cpsc359
assignment2
Drawfloor16bpp
This function draw the floor element for the maze
input:
r1 = x
r2 = y
r4 = frame buffer
*/

.section .text

.globl Drawfloor16bpp

Drawfloor16bpp:
    push    {r0-r10}                         //save r4
    ldr     r3, =0x7bef                // set colour
    offset  .req    r0                   // use r4 as offset
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //calculate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    mov     r5, #1                       // set counter to 0
    //draw borders of floor
floorline1:                              //loop draw upper border
    strh    r3, [r4, offset]             //set color of first pixel
    add     offset, #1                   //increment offset by one
    add     r5, #1                       //increment count by 1
    cmp     r5, #64                      // check if counter is 64(16bpp)
    bne     floorline1                   //not equal branch to top of loop

    add     r2, #32                      // increment y by 32 pixels
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //calculate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    mov     r5, #0                       //reset counter
floorline2:                              //loop draw lower border
    strh    r3, [r4, offset]             //set color of first pixel
    add     offset, #1                   //increment offset by one
    add     r5, #1                       //increment count by 1
    cmp     r5, #64                      // check if counter is 64 (16bpp)
    bne     floorline2                   //not equal branch to top of loop

    sub     r2, #32                      // reset  y
    mov     offset, #0                   //reset offset
    add     offset, r1,r2, lsl #10       //calculate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    mov     r5, #0                       // reset counter
    push {r1}                            //save r1
floorline3:                              //loop to draw left border
    strh    r3, [r4, offset]             //set color of pixel at framebuffer + offset
    add     r1, #1024                    // add 1024 to r1
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      // recaluclate offset
    lsl     offset, #1                   // offset *2 for 16bpp
    add     r5, #1                       //increment counter
    cmp     r5, #32                      // check counter to 32
    bne     floorline3                   //not equal branch back to florline3 loop

    pop {r1}                             //restore r1

    add     r1, #32                      //add 32 to r1
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //recaluclate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    mov     r5, #0                       //reset counter

floorline4:                              //loop for right border
    strh   r3,  [r4, offset]             // set pixel at framebuffer + offst
    add    r1, #1024                     // add 1024 to r1
    mov     offset, #0                   //reset offset
    add     offset, r1, r2, lsl #10      //recaluclate offset
    lsl     offset, #1                   //offset *2 for 16bpp
    add     r5, #1                       //increment counter
    cmp     r5, #32                      //compare counter to 32
    bne     floorline4                   // not equal branch to floorline4 loop

    .unreq  r0
    
    pop     {r0-r10}                        //restore r4
    bx      lr                          //return to calling function


.section .data


