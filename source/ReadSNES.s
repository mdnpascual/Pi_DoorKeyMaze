.section .text
.global	ReadSNES

/* This ReadSNES subroutine does the heavy lifting of checking
	to see if there are any buttons pressed on the controller.

	When it is finished, the number of the button pressed
	will be returned in r0. These numbers correlate to the numbers
	listed on pg.7 of the SNES Controller Lecture Notes written
	by Jalal Kawash.

	If no buttons are pressed, a value of 0 will be returned in r0.

	If multiple buttons are pressed, the input is unuseable for the
	purposes of the game. Thus, a value of 0 will be returned in r0
	as well.
*/

ReadSNES:

	push	{r4, r5}

	buttons	.req	r4	

	mov	buttons, #0 // load buttons array address
	
	mov	r0, #11	// pin #11 - CLOCK
	mov	r1, #1	// value of 1 for write function
	push	{lr}	
	bl		writeGPIO	// call write function
	pop	{lr}	

	mov	r0, #9	// pin #9 - LATCH
	mov	r1, #1	// value of 1 for write function
	push	{lr}	
	bl 	writeGPIO	// call write function
	pop	{lr}	
		
	mov	r0, #12	// wait 12 micros
	push	{lr}	
	bl		waitFunc // call wait function
	pop	{lr}
	
	mov	r0, #9	// pin # 9 - LATCH
	mov	r1, #0	// value of 0 for write function
	push	{lr}	
	bl		writeGPIO	// call write function
	pop	{lr}
	
	mov	r5, #0	// i = 0

pulseLoop:
	
	mov	r0, #6	// wait 6 micros
	push	{lr}	
	bl		waitFunc	// call wait function
	pop	{lr}

	mov	r0, #11	// pin #11 - CLOCK
	mov	r1, #0	// value of 0 for write function
	push	{lr}	
	bl		writeGPIO 	// call write function for falling edge
	pop	{lr}

	mov	r0, #6	// wait 6 micros
	push	{lr}	
	bl		waitFunc	// call wait function
	pop	{lr}

	mov	r0, #10	// pin # 10 - DATA
	push	{lr}	
	bl		readGPIO	// call read function
	pop	{lr}
	
	lsl	r0, r5		// shift read value by button number
	orr	buttons, r0 // copy button value to button register

	mov	r0, #11  // pin #11 - CLOCK
	mov	r1, #1	// value of 1 for write function
	push	{lr}	
	bl		writeGPIO // call write function for rising edge
	pop	{lr}
	
	add	r5, #1	// i++ for next button
	
	cmp	r5, #16	// see if i < 16
	blt	pulseLoop

/* Now we walk through the button register to determine which
 * buttons have been pressed.
 * 
 * The program will only permit single button presses, so any
 * controller data that has more than one button pressed must
 * be discarded and a return value that indicates this state
 * of affairs will be sent back.
*/

	mov	r5, #0	// i = 0
	mov	r0, #0	// initialize button number register
						// to 0.
parseButtonLoop:	

	mov	r1, #1	// initialize bit mask
	lsl	r1, r5	// shift bit mask to appropriate bit

	and	r2, buttons, r1 // mask everything else
	teq	r2, #0	// check if result is 0 or not
	beq 	notPressed

	cmp	r0, #0	// see if there is already button pressed
	movne	r0, #0	// move value of 0 which indicates
						// no input
	bne	parseDone // since multiple buttons pressed, controller 
						 // state not usuable
						 // so end things here

	add	r0, r5, #1 // add 1 to counter value
						  // which gives the number of button
						  // being pressed. This is placed in
						  // the return register in r0.

notPressed:

	add	r5, #1	  // i ++
	cmp 	r5, #12	  // see if i < 12
	blt	parseButtonLoop	// if so, run loop again

parseDone:
	
	.unreq	buttons

	pop 	{r4, r5}
	bx	 	lr

	
writeGPIO:

/* This function writes a bit to a GPIO output line.
 *	Arguments:
 *	r0: pin number.
 *	r1: bit value to be written.
*/

	ldr	r2, =0x20200000 // base GPIO register
	mov	r3, #1 // enter in 1 for pin selection
	lsl	r3, r0 // shift bit over to correct pin
	teq	r1, #0 // see if output value is 0 or 1
	streq r3, [r2, #40] // if 0, clear output line
	strne r3, [r2, #28] // if 1, set output line
	bx		lr

readGPIO:

/* This function reads a bit from a GPIO input line.
 * Argument:
 * r0: pin number.
 * Returns:
 * r0: value of pin.
*/	

	
	ldr  	r2, =0x20200034 // GPLEV0 register
	mov	r3, #1	// enter in 1 for pin selection	
	ldr	r1, [r2]	// load level register into r1
	lsl	r3, r0	// shift bit over to correct pin
	and	r1, r3	// mask everything else
	teq	r1, #0	// check if result is 0 or not
	moveq	r0, #1	// if 0, return 1 (button pressed)
	movne	r0, #0	// if not, return 0 (button not pressed)
	bx		lr

waitFunc:

/* This function forces the system to wait for
 *	the number of microseconds specified in the argument.
 * Argument:
 * r0: number of microseconds to wait.
*/

	
	ldr	r1, =0x20003004 // address of CLO system timer
	ldr	r2, [r1] 		 // read CLO into r2
	add	r2, r0			 // add specified number of microseconds.
waitLoop:
	ldr	r3, [r1]	// load new value of system timer
	cmp	r2, r3   // see if greater than desired wait time
	bhi	waitLoop // if not, loop back

	bx		lr
	
		


.section .data

	
