/*
Marcus Stewart
934154
Cpsc359
assignment 2
Drawmaze
this function draws the starting maze for the game. 
it reads each element of Array2D drawing each element
0 = wall, 1 = exit, 2 = door, 3 = flor, 4 = key
5 = start/player
input :
   r4 = framebuffer
   r3 = address of array2D
*/
.section    .text

.globl  Drawmaze

Drawmaze:

    push    {r1 - r10}         //save r0 to r8
    
    mov     r1, #256          //set starting x pixel
    mov     r2, #160          //set starting y pixel
    mov     r0, #0            //use r0 as counter
    mov     r6, #0
    mov     r7, #0
printelement:                 //loop to print maze element
    ldrb   r5, [r3, r7]
    add     r0, #1
    add     r7, #1
    
    cmp     r5, #0            //compare r8 to 0 (wall)
    push    {lr}
    bleq     Drawwall16bpp
    pop     {lr}
 
    cmp     r5, #1            //compare r5 to 1
    push    {lr}
    bleq     Drawdoor16bpp     //equal branch to drawexit function
    pop     {lr}
 
    cmp     r5, #2            //compare r5 2
    push    {lr}
    bleq     Drawexit16bpp     //equal branch to drawdoor function
    pop     {lr}

    cmp     r5, #3            //compare r5 to 3
    push    {lr}
    bleq    Drawfloor16bpp    //equal branch to drawfloor function
    pop     {lr}

    cmp     r5, #4            //compare r5 to 4
    push    {lr}
    bleq     Drawkey16bpp      //equal branch to drawkey function
    pop     {lr}
   
    cmp     r5, #5
    push    {lr}
    bleq    Drawstart16bpp
    pop     {lr}
    push    {lr}
    bleq    Drawman16bpp
    pop     {lr}
    
    //check if last element is printed
    add     r1, #32
    cmp     r0, #17           //compare offset to value of one row of maze
    bne     printelement      //less than equal branch to top of printelement

    mov     r0, #0
    add     r2, #32           //add 32 pixels to y
    sub     r1, #544
    add     r6, #1            //add r6 to r6
    cmp     r6, #17            //compare r6 to offset of last element in aray2d 
    bne     printelement      //less than equal branch to top of printelement

    pop     {r1 - r10}         //restore r0 - r8
    bx      lr                //return to calling function
     
.section .data

