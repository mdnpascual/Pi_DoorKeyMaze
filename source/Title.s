/*
Marcus Stewart
cpsc359
assignment 2

Title
This function draws the Title of the game 
it calls the functions drawsgblock16bpp

*/

.section    .text

.globl  Title

Title:

    push    {r0 - r10}                      //save r0 - r10
    

    //maze
    //draw M
    mov     r1, #292                        //set x to 292
    mov     r2, #16                        //set y to 16
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #292                        //et x to 292
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #292                        //set x to 292
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #24                         //add 24 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #24                         //add 24 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #292                        //set x to 292
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #292                        //set x to 292
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #292                        //set x to 292
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #292                        //set x to 292
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    //Draw A
    mov     r1, #420                        //set x to 420
    mov     r2, #16                        //set y to 16
    
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    
    mov     r1, #420                        //set x to 420
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #420                        //set x to 420
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #420                        //set x to 420
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #420                        //set x to 420
    add     r2, #8                        //set y to 8

    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    
    mov     r1, #420                        //set x to 420
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #420                        //set x to 420
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    //draw  Z
    mov     r1, #548                        //set x to 548
    mov     r2, #16                         //set y to 16
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #548                        //set x to 548
    add     r2, #8                         //add 8 pixels to y
    add     r1, #40                         //add 40 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #548                        //set x to 548
    add     r2, #8                         //add 8 pixels to y
    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #548                        //set x to 548
    add     r2, #8                         //add 8 pixels to y
    add     r1, #24                         //add 24 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #548                        //set x to 548
    add     r2, #8                         //add 8 pixels to y
    add      r1, #16                        //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp              //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #548                        //set x to 548
    add     r2, #8                          //add 8 pixels to y
    add     r1, #8                          //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #548                        //set x to 548
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp              //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp              //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp              //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp              //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp              //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp              //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    //draw E
    mov     r1, #676                        //set x to 676
    mov     r2, #16                        //set y to 16

    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    
    mov     r1, #676                        //set x to 676
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #676                        //set x to 676            
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #676                        //set x to 676
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #676                        //set x to 676
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #676                        //set x to 676
    add     r2, #8                         //add 8 pixels to y
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #676                        //set x to 676
    add     r2, #8                         //add 8 pixels to y

    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #8                         //add 8 pixels to x
    push    {lr}                            //save lr
    bl      Drawsgblock16bpp                  //call drawsgblock16bpp
    pop     {lr}                            //restore lr

    pop     {r0 - r10}                      //restore r0 - r10
    bx      lr                             //return to calling function

