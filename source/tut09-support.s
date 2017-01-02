.section .data
.align 12


.align 4
.globl FrameBufferPointer
FrameBufferPointer:
	.int	0

.section .text

/* Initialize the Frame Buffer
 * Return:
 *  r0 - result
 */


/* Draw Pixel
 *  r0 - x
 *  r1 - y
 *	r2 - color
 */
.globl DrawPixel
DrawPixel:
    px      .req    r0
    py      .req    r1
    color   .req    r2
    addr    .req    r3

    push	{r4}
    
    ldr     addr,   =FrameBufferInit
    
    height  .req    r4
    ldr     height, [addr, #4]
    sub     height, #1
    cmp     py,     height
    movhi   pc,     lr
    .unreq  height
    
    width   .req    r4
    ldr     width,  [addr, #0]
    sub     width,  #1
    cmp     px,     width
    movhi   pc,     lr
    
    ldr     addr,   =frameB
	ldr		addr,	[addr]
	
    add     width,  #1
    
    mla     px,     py, width, px       // px = (py * width) + px
    .unreq  width
    .unreq  py
    
    add     addr,   px, lsl #1			// addr += (px * 2) (ie: 16bpp = 2 bytes per pixel)
    .unreq  px
    
    strh    color,  [addr]
    
    .unreq  addr
    
	pop		{r4}

    bx		lr

    
/* Write to mailbox
 * Args:
 *  r0 - value (4 LSB must be 0)
 *  r1 - channel
 */
.globl MailboxWrite
MailboxWrite:
    tst     r0, #0b1111                     // if lower 4 bits of r0 != 0 (must be a valid message)
    movne   pc, lr                          //  return
    
    cmp     r1, #15                         // if r1 > 15 (must be a valid channel)
    movhi   pc, lr                          //  return
    
    channel .req r1
    value   .req r2
    mov     value, r0
    
    mailbox .req r0
	ldr     mailbox,=0x2000B880
    
wait1$:
    status  .req r3
    ldr     status, [mailbox, #0x18]        // load mailbox status
    
    tst     status, #0x80000000             // test bit 32
    .unreq  status
    bne     wait1$                          // loop while status bit 32 != 0
    
    add     value, channel                  // value += channel
    .unreq  channel
    
    str     value, [mailbox, #0x20]         // store message to write offset
    
    .unreq  value
    .unreq  mailbox
    
    bx		lr


/* Read from mailbox
 * Args:
 *  r0 - channel
 * Return:
 *  r0 - message
 */
.globl MailboxRead
MailboxRead:
    cmp     r0, #15                         // return if invalid channel (> 15)
    movhi   pc, lr
    
    channel .req r1
    mov     channel, r0
    
    mailbox .req r0
	ldr     mailbox,=0x2000B880
    
rightmail$:
wait2$:
    status  .req r2
    ldr     status, [mailbox, #0x18]        // load mailbox status
    
    tst     status, #0x4000000              // test bit 30
    .unreq  status
    bne     wait2$                          // loop while status bit 30 != 0
    
    mail    .req r2
    ldr     mail, [mailbox, #0]             // retrieve message
    
    inchan  .req r3
    and     inchan, mail, #0b1111           // mask out lower 4 bits of message into inchan
    
    teq     inchan, channel
    .unreq  inchan
    bne     rightmail$                      // if not the right channel, loop
    
    .unreq  mailbox
    .unreq  channel
    
    and     r0, mail, #0xfffffff0           // mask out channel from message, store in return (r0)
    .unreq  mail
    
	bx		lr

