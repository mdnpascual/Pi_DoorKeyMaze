/*
Marcus Stewart
934154
Cpsc 359
Assignment 2
Drawexit16bpp
This function draws a exit element of the maze
Input:
r4 = framebuffer
r1 = starting x pixel
r2 = starting y pixel
*/

.section .text

.globl Drawexit16bpp

Drawexit16bpp:
    push    {r0-r10}                           //Save r4

    offset  .req    r0                     //use r4 as offset
    mov     offset, #0
    add     offset, r1, r2, lsl #10        //y*1024+x
    lsl     offset, #1                     //offset *2 for 16bpp
    mov     r5, #0                         //set counter to 0 
    ldr     r3, =0x7bef                  //set colour to black
exitline1part1:                            //loop for part1 of line1
    strh    r3, [r4, offset]               //store r3(colour) to framebuffer + offset 
    add     offset, #1                     //increment offset
    add     r5, #1                         //increment counter
    cmp     r5, #8                         //compare counter to 8 (16bpp)
    bne     exitline1part1                 //not equal branch to top of loop

    mov     r5, #0                         //reset counter
    ldr     r3, =0xff0000                  //change colour
exitline1part2:                            //loop for part2 of line 1
    strh    r3, [r4, offset]               //store r3(colour) to framebuffer + offset
    add     offset, #1                     //increment offset 
    add     r5, #1                         //increment counter
    cmp     r5, #46                        //compare counter to 46 (16bpp)
    bne     exitline1part2                 //not equal branh to top of loop

    mov     r5, #0                         //reset counter
    ldr     r3, =0x7bef                  //change colour
exitline1part3:                            //loop for part3 line1
    strh    r3, [r4, offset]               //store r3(colour) to framebuffer + ofset
    add     offset, #1                     //increment offset
    add     r5, #1                         //increment counter
    cmp     r5, #10                         //compare counter to 8 (16bpp)
    bne     exitline1part3                 //not equal branch to top of loop

    add     r2, #1                        //increment y
    mov     offset, #0                    //reset offset
    add     offset, r1, r2, lsl #10       //y * 1024 + x
    lsl     offset, #1                    //offset * 2 for 16bpp
    mov     r5, #0                        //reset counter
    mov     r6, #0                        //reset second counter
exitline2part1:                           //loop for patr1 line2
    strh   r3, [r4, offset]               //store r3(colour) to frame buffer + offset
    add    offset, #1                     //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #8                        // compare counter to 8 (16bpp)
    bne     exitline2part1                //not equal branch to top of loop
 
    mov     r5, #0                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline2part2:                           //loop for part2 line2
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #4                        //compare first counter to 4 (16bpp)
    bne     exitline2part2                //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xbdf7                 //change colour
exitline2part3:                           //loop part 3 line 2
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset   
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #14                       //compare first counter to 14 (16bpp)
    bne     exitline2part3                //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline2part4:                           //loop for part4 line 2
    strh    r3, [r4,offset]               //store r3(colour) to framebuffer + offset
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #10                       //compare first counter to 10 (16bpp)
    bne     exitline2part4                //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xbdf7                 //change colour
exitline2part5:                           //loop part 5 of line 2
    strh    r3, [r4,offset]               //store r3(colour) to framebuffer + offset
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #14                       //compare first counter to 14 (16bpp)
    bne     exitline2part5                //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline2part6:                           //loop part 6 of line 2
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset 
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #4                        //compare first counter to 4 (16bpp)
    bne     exitline2part6                //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0x7bef                 //change colour
exitline2part7:                           //loop part7 of line 2
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #10                        //compare first counter to 8 (16bpp)
    bne     exitline2part7                //not equal bramch to top of loop

    mov     r5, #0                        //reset first counter
    mov     offset, #0                    //reset offset
    add     r2, #1                        //increment y
    add     offset, r1, r2, lsl #10       //y*1024 + x
    lsl     offset, #1                    //offset *2 (16bpp)
    add     r6, #1                        //increment second counter
    cmp     r6, #14                       //compare second counter to 12
    bne     exitline2part1                //not equal branch to top of line2

    mov     r5, #0                        //reset first counter
    mov     r6, #0                        //reset second counter
    mov     offset, #0                    //reset offset
    add     offset, r1, r2, lsl #10       //y*1024 + x
    lsl     offset, #1                    //offset *2 (16bpp)
exitline13part1:                          //loop part1 of line 13
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer+offset    
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #8                        //compare first counter to 8(16bpp)
    bne     exitline13part1               //not equal top of loop

    mov     r5, #0                       //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline13part2:                          //loop for part 2 of line 13
    strh    r3, [r4, offset]              //store r3(colour) to frame buffer + ofset
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #46                       //compare first counter to 52 (16bpp)
    bne     exitline13part2               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0x7bef                 //change colour
exitline13part3:                          //loop for part3 of line13
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset  
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #10                        //compae first counter to 6
    bne     exitline13part3               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    mov     offset, #0                    //reset offset
    add     r2, #1                        //increment y
    add     offset, r1, r2, lsl #10       //y*1024+x
    lsl     offset, #1                    //offset *2 (16bpp)
    add     r6, #1                        //increment second counter
    cmp     r6, #2                        //compare second counter to 2
    bne     exitline13part1               //not equal branch to top of line line 13

    mov     r5, #0                        //reset first counter
    mov     r6, #0                        //reset second counter
    mov     offset, #0                    //reset offset
    add     offset, r1, r2, lsl #10       //y*1024 +x
    lsl     offset, #1                    //offset *2 (16bpp)
exitline15part1:                          //loop part 1 of line 15
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset 
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #8                        //compre first counter 8 (16bpp)
    bne     exitline15part1               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline15part2:                          //loop part 2 of line 15
    strh    r3, [r4, offset]              //store r3(colour) to frambuffer + offset 
    add     offset, #1                    //increment offset 
    add     r5, #1                        //increment first counter
    cmp     r5, #40                       //compare first counter to 40 (16bpp)
    bne     exitline15part2               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xffe0                 //change colour
exitline15part3:                          //loop part3 of line 15
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset 
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #4                        //compare first counter to 4 (16bpp)
    bne     exitline15part3               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline15part4:                          //loop part 4 of line 15
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset       
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #2                        //compare first counter to 4 (16bpp)
    bne     exitline15part4               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0x7bef                 //change colour
exitline15part5:                          //loop part 5 of line 15
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset   
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #10                        //compare first counter to 6 (1bpp)
    bne     exitline15part5               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    mov     offset, #0                    //reset offset
    add     r2, #1                        //increment y
    add     offset, r1, r2, lsl #10       //y*1024 + x
    lsl     offset, #1                    //offset * 2 (16bpp)
    add     r6, #1                        //increment second counter
    cmp     r6, #2                        //compare second counter to 2
    bne     exitline15part1               //not equal branch to top of line 15

    mov     r5, #0                        //reset first counter
    mov     r6, #0                        //reset second counter
    mov     offset, #0                    //reset offset
    add     offset, r1, r2, lsl #10       //y*1024+x
    lsl     offset, #1                    //offset*2 (16bpp)
exitline17part1:                          //loop part1 of line17
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #8                        //compare first counter to 8 (16bpp)
    bne     exitline17part1               //not equal branch to top of loop

    mov     r5, #5                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline17part2:                          //loop part 2 line 17
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #52                       //compare first counter to 52 (16bpp)
    bne     exitline17part2               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0x7bef                 //change colour
exitline17part3:                          //loop part3 of line17
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter  
    cmp     r5, #8                        //compare first counter to 6 (16bpp)
    bne     exitline17part3               //not equal branch to top of loop

    mov     r5, #0                        //reset counter
    mov     offset, #0                    //reset offset
    add     r2, #1                        //increment y
    add     offset, r1, r2, lsl #10       //y*1024+x
    lsl     offset, #1                    //offset*2 (16bpp)
    add     r6, #1                        //increment second counter
    cmp     r6, #2                        //compare second counter to 2
    bne     exitline17part1               //not equal branch to top of line 17

    mov     offset, #0                    //reset offset
    add     offset, r1, r2, lsl #10       //y*1024+x
    lsl     offset, #1                    //offset *2(16bpp)
    mov     r5, #0                        //reset first counter
    mov     r6, #0                        //reset second counter
exitline18part1:                          //loop part1 line 18
    strh   r3, [r4, offset]               //store r3(colour) to framebuffer + offset
    add    offset, #1                     //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #8                        //compare first counter to 8 (16bpp)
    bne     exitline18part1               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline18part2:                          //loop part2 of line 18
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset    
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #4                        //compare first counter to 4 (16bpp)
    bne     exitline18part2               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xbdf7                 //change colour
exitline18part3:                          //loop part3 of line 18
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset    
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #14                       //compare first counter to 14
    bne     exitline18part3               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline18part4:                          //loop part4 of line 18
    strh    r3, [r4,offset]               //store r3(colour) to framebuffer + offset
    add     offset, #1                    //increment offet
    add     r5, #1                        //increment first counter
    cmp     r5, #10                       //compare first counter 10 (16bpp)
    bne     exitline18part4               //not equal branch to top of loop

    mov     r5, #0                        //reset first cunter
    ldr     r3, =0xbdf7                 //change colour
exitline18part5:                          //loop part5 of line 18
    strh    r3, [r4,offset]               //store r3(colour) to framebuffer + offset 
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #14                       //compare first counter to 14 (16bpp)
    bne     exitline18part5               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    ldr     r3, =0xff0000                 //change colour
exitline18part6:                          //loop part6 of line 18
    strh    r3, [r4, offset]              //store r3 to framebuffer + offset 
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #4                        //compare first counter to 4 (16bpp)
    bne     exitline18part6               //not equal branch to top of loop
       
    mov     r5, #0                        //reset first counter
    ldr     r3, =0x7bef                 //change colour
exitline18part7:                          //loop part 7 of line 18
    strh    r3, [r4, offset]              //store r3(colour) to framebuffer + offset 
    add     offset, #1                    //increment offset
    add     r5, #1                        //increment first counter
    cmp     r5, #10                        //compare first counter to 8 (16bpp)
    bne     exitline18part7               //not equal branch to top of loop

    mov     r5, #0                        //reset first counter
    mov     offset, #0                    //reset offset
    add     r2, #1                        //increment y
    add     offset, r1, r2, lsl #10       //y*1024+x
    lsl     offset, #1                    //offset * 2 (16bpp)
    add     r6, #1                        //increment second counter
    cmp     r6, #11                       //compare second counter to 12
    bne     exitline18part1               //not equal branch to top of line 18

    .unreq  r0

    pop {r0-r10}                              //restore r4
    bx  lr                                //retun to calling function

.section .data





















