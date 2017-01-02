/*
Marcus Stewart
cpsc 359
assignment2

Lost
this function draws the lost screen
it calls functions White screen and 
drawredblock16bpp
*/
.section    .text

.globl  Lost

Lost:

    push    {r0 - r10}                      //save r0 - r10
    
    //clear screen
    push    {lr}                            //save lr
    bl      Whitescreen16bpp                //branch to function whitescreen
    pop     {lr}                            //restore lr

    mov     r1, #100                        //set x to 100
    mov     r2, #100                        //set y to 100

    //GAME
    //Draw G
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch function Drawredblock
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch function Drawredblock
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch function Drawredblock
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr

    mov     r1, #100                        //set x to 100
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call Drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #100                        //set x to 100
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #100                        //set x to 100
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #100                        //set x to 100
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #64                        //ad 64 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch function Drawredblock
    pop     {lr}                            //restore lr

    mov     r1, #100                        //set x to 100
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                        //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #100                        //set x to 100
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch function Drawredblock
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch function Drawredblock
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch function Drawredblock
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //branch to function Drawbloack
    pop     {lr}                            //restore lr

    //Draw A
    mov     r1, #228                        //set x to 228
    mov     r2, #100                        //set y to 100
    
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    
    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #228                        //set x to 228
    add     r2, #16                        //add 16 pixels to y

    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    
    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //draw  M
    mov     r1, #356                        //set x to 356
    mov     r2, #100                        //set y to 100
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    add     r1, #64                         //add 64 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #356                        //et x to 356
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #356                        //set x to 356  
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #356                        //set x to 356
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    
    mov     r1, #356                        //set x to 356
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #356                        //set x to 356
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #356                        //set x to 356
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //draw E
    mov     r1, #484                        //set x to 484
    mov     r2, #100                        //set y to 100

    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484            
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y

    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //OVER
    //Draw O
    mov     r1, #228                        //set x to 228
    mov     r2, #228                        //set y to 228
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    
    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr 
    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr 
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr 
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr 
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr 
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #228                        //set x to 228
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #356                        //set x to 356
    mov     r2, #228                        //set y to 228

    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr 

    //draw V
    mov     r1, #356                        //set x to 356
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #372                        //set x to 372
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #64                         //add 64 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #372                        //set x to 372
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr 
    add     r1, #64                         //add 64 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #388                        //set x to 388
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr 
    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #388                        //set x to 388
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr 
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #404                        //set x to 404
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    
    mov     r1, #484                        //set x to 484
    mov     r2, #228                        //set y to 228
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484            
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //Draw E
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y

    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //Draw R
    mov     r1, #612                        //set x to 612
    mov     r2, #228                        //set y to 228
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixel to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #64                         //add 64 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //YOU
    //Draw Y
    mov     r1, #356                        //set x to 356
    mov     r2, #356                        //set y to 356
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #372                        //set x to 372
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #64                         //add 64 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #388                        //set x to 388
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #32                         //add 32 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #404                        //set x to 404
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #404                        //set x to 404
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #404                        //set x to 404
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #404                        //set x to 404
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //draw o
    mov     r1, #484                        //set x to 484
    mov     r2, #356                        //set y to 356
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //draw U
    mov     r1, #612                        //set x to 612
    mov     r2, #356                        //set y to 356
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //LOST
    //draw L
    mov     r1, #484                        //set x to 484
    mov     r2, #484                        //set y to 484
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #484                        //set x to 484
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x

    //draw o
    mov     r1, #612                        //set x to 612
    mov     r2, #484                        //set y to 484
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #612                        //set x to 612
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //draw S
    mov     r1, #740                        //set x to 740
    mov     r2, #484                        //set y to 484
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
   add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
   add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
   add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #740                        //set x to 740 
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
   add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #740                        //set x to 740
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #740                        //set x to 740
    add     r2, #16                         //add 16 pixels to y
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    
    mov     r1, #740                        //set x to 740
    add     r2, #16                         //add 16 pixels to y
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #740                        //set x to 740
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #96                         //add 96 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #740                        //set x to 740
    add     r2, #16                         //add 16 pixels to y
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    //draw T
    mov     r1, #868                        //set x to 868
    mov     r2, #484                        //set y to 484
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r1, #16                         //add 16 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    mov     r1, #868                        //set x to 868
    add     r2, #16                         //add 16 pixels to y
    add     r1, #48                         //add 48 pixels to x
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr
    add     r2, #16                         //add 16 pixels to y
    push    {lr}                            //save lr
    bl      Drawredblock16bpp                  //call drawredblock16bpp
    pop     {lr}                            //restore lr

    pop     {r0 - r10}                      //restore r0 - r10
    bx      lr                              //return to calling function
