//Redrawmaze
// input r4 = frame buffer
//	input	r3	= array address

.section    .text

.globl  Redrawmaze

Redrawmaze:
    
    push    {r1-r10}

	 push		{r3}
	 pop		{r9}

	 mov     r1, r11
    mov     r2, r12
    push    {lr}
    bl      Drawstart16bpp
    pop     {lr}  
    
	 mov     r1, #256    //set starting x
    mov     r2, #160    //set starting y
    mov     r0, #0      //counter
    mov     r6, #0      
    mov     r7, #0

redrawloop:
    ldrb    r5, [r9, r7]
    add     r0, #1
    add     r7, #1

    cmp     r5, #5
    push    {lr}
    bleq    Clear
    pop     {lr}

    cmp     r5, #5
    push    {lr}
    bleq    Drawfloor16bpp
    pop     {lr}

    cmp     r5, #6
    push    {lr}
    bleq    Drawman16bpp
    pop     {lr}

    cmp     r5, #7
    push    {lr}
    bleq    Drawfloor16bpp
    pop     {lr}

    add     r1, #32
    cmp     r0, #17
    bne     redrawloop

    mov     r0, #0
    add     r2, #32
    sub     r1, #544
    add     r6, #1
    cmp     r6, #17
    bne     redrawloop
    
    pop     {r1-r10}
    bx      lr

.section    .data  



