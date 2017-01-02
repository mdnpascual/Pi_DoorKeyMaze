.section .text

.globl InitSNES

/* This subroutine will initialize the SNES Controller so
	input from it can be read.
*/

InitSNES:

	//initialize the CLOCK line
	ldr	r0, =0x20200004 // address for GPFSEL1
	ldr	r1, [r0] // copy GPFSEL1 into r1
	mov	r2, #7	// (b0111)
	lsl	r2, #3	// shift to reach bits for pin 11
	bic	r1, r2	// clear bits for pin 11
	mov	r3, #1	// "output" function code
	lsl	r3, #3	// shift code to bits for pin 11
	orr	r1, r3	// set pin 11 to output
	str	r1, [r0] // write back to GPFSEL1

	//initialize the LATCH line
	ldr	r0, =0x20200000 // address for GPFSEL0
	ldr	r1, [r0] // copy GPFSEL0 into r1
	mov	r2, #7	// (b0111)
	lsl	r2, #27	// shift to reach bits for pin 9
	bic	r1, r2	// clear bits for pin 9
	mov	r3, #1	// "output" function code
	lsl	r3, #27	// shift code to bits for pin 9
	orr	r1, r3	// set pin 9 to output
	str	r1, [r0] // write back to GPFSEL0

	//initialize the DATA line
	ldr	r0, =0x20200004 // address for GPFSEL1
	ldr	r1, [r0] // copy GPFSEL0 into r1
	mov	r2, #7	// (b0111)
	bic	r1, r2	// clear bits for pin 10
	str	r1, [r0]	// write back to GPFSEL1
	
	bx		lr




.section .data
	
