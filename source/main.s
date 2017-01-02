/* 

CPSC 359
Assignment 2

Joel Nielsen
Marcus Stewart
Michael Pascual

This game tests your ability in escaping a randomly generated 17x17 maze using a Super Nintendo controller. Collect keys and open doors in order to leave alive before your number of turns run out!

You begin with one key to start your epic journey -- bestowed upon you by the lords of randomization -- and if you ever find yourself trapped, press the Start button to begin your quest anew!

Controls

Direction keys - move in that direction
A - open door
Start - reset game board into new configuration

This program makes use of code outlined in class and provided by tutorials

*/



.section    .init
.globl     _start

_start:
    b       main
    
.section .text

.globl	haltLoop$

main:
	mov     sp, #0x8000
	bl		EnableJTAG


	/*

	r4 - framebuffer
	r5 - x - position of player
	r6 - y - position of player
	r7	- # of actions
	r8 - # of keys
	r9 - 
	r10 - game board array address

	*/

gameReset:

   bl      InitFrameBuffer
    //branch to halt loop if there was an error initlizing framebuffer
    cmp     r0, #0
    beq     haltLoop$

    push    {r0}            //save r0(framebuffer) to stack
    pop     {r4}            //save address of framebuffer in r4

	 ldr		r0,	=frameB
	 str		r4,	[r0]
    
	 bl InitSNES				 // initialize SNES controller

   push	{lr}
	 BL	MAZEGENMAIN         //randomly generate game board
	 pop	{lr}

	 push  {r0}			 // push new array address onto stack
	 pop   {r10}		 // save new array address into r10

	 push	 {r1, r2}    // push x and y onto stack
	 pop   {r5,r6}     //save x and y to r5 and r6
	 sub	  r6, #1		 // subtract 1 from y position
						    // (a quirk makes this necessary to ensure
							 // the player starts in the correct position)

    push	 {r10}		 // push array address onto stack
	 pop	 {r3}			 // and pop into r3 for draw function

    push    {r4}		 // push framebuffer onto stack
    pop     {r0}		 // and pop into r0 for argument for draw function

    push    {lr} 
    bl      Whitescreen16bpp      //make screen white
    pop     {lr}

	 bl		Title						// load title screen

    push    {lr}						 // draw the maze
    bl      Drawmaze              //branch to Drawmaze
    pop     {lr}

	 MOV	R9, #1
	bl	DrawCharK
	bl	DrawCharE
	bl	DrawCharY
	bl	DrawCharS
	bl	DrawCharSPC

	bl	DrawCharM
	bl	DrawCharO
	bl	DrawCharV
	bl	DrawCharE2
	bl	DrawCharS2
	bl	DrawCharSPC2


	 mov		r7, #150					 // initialize number of actions to 150
	 mov		r8, #1				 // initialize number of keys as 1

	MOV	R0, R8
	BL	DECIDECHAR
	
	MOV	R0, R7
	BL	DECIDECHAR2

	BL	DRAWNAMES

inputLoop:

	bl		ReadSNES		// get controller input
	
	cmp	r0,	#5		// see if input is up
	beq	checkValidUp	// branch to see if up is valid
	
	cmp	r0,	#6		// see if input is down
	beq	checkValidDown //if so, branch to see if down is valid
	
	cmp 	r0,	#7		// see if input is left
	beq	checkValidLeft // if so, branch to see if left is valid
	
	cmp	r0,	#8		// see if input is right
	beq	checkValidRight // if so, branch to see if right is valid

	cmp	r0,	#9		// see if input is A
	beq	checkDoorOpen	// if so, see if door can be opened

	cmp	r0,	#4		// see if input is Start
	beq	gameReset			// if so, reset the game

	b 		inputLoop	//unrecognized input, try again

checkValidUp:

	
	sub	r2,	r6, #1	 // subtract one from position y-value
	mov	r0,	#17	
	mul	r2,	r0		 	 // multiply by 17
	add	r2,	r5			 // add x-position
	add	r2,	r10		 // add array address
	ldrb	r3,	[r2]	 // load tile above player
	
	teq	r3,	#3			 // see if floor
	subeq r6,	#1			 // sub 1 from player y-position	
	beq	moveUp			 // branch to moveUp
	
	teq	r3,	#5			 // see if previous position
	subeq r6,	#1			 // sub 1 from player y-position	
	beq	moveUp			 // branch to moveUp
	
	teq	r3,	#4			 // see if key
	subeq	r6,	#1			 // sub 1 from player y-position	
	beq	moveUpKey		 // branch to moveUpKey
	b		waitNoInput		 // move is invalid, wait till no new input

checkValidDown:

	
	add	r2,	r6, #1	 // add one to y-position
	mov	r0,	#17	
	mul	r2,	r0		 	 // multiply by 17
	add	r2,	r5			 // add x-position
	add	r2,	r10		 // add array address
	ldrb	r3,	[r2]    // load tile below player
	
	teq	r3,	#3			 // see if floor
	addeq	r6,	#1			 // add 1 to player y-position	
	beq	moveDown			 // branch to moveDown

	teq	r3,	#5			 // see if "new floor"
	addeq	r6,	#1			 // add 1 to player y-position	
	beq	moveDown			 // branch to moveDown
	
	teq	r3,	#4			 // see if key
	addeq	r6,	#1			 // add 1 to player y-position	
	beq	moveDownKey		 // branch to moveDownKey
	b		waitNoInput		 // move is invalid, wait till no new input			 

checkValidLeft:

	mov	r0,	#17
	mul	r2,	r6, r0	 // multiply current y-position by 17
	add	r2,	r5			 // add x - position
	sub	r2,	#1			 // subtract one
	add	r2,	r10		 // add base array address
	ldrb	r3,	[r2]      // load tile to left of player

	teq	r3,	#3			 // see if floor
	subeq	r5,	#1			 // sub 1 from player x-position	
	beq	moveLeft			 // branch to moveLeft

	teq	r3,	#5			 // see if "new floor"
	subeq	r5,	#1			 // sub 1 from player x-position	
	beq	moveLeft			 // branch to moveLeft

	teq	r3,	#4			 // see if key
	subeq	r5,	#1			 // sub 1 from player x-position
	beq	moveLeftKey		 // branch to moveLeftKey
	b		waitNoInput		 // move is invalid, wait till no new input

checkValidRight:

	mov	r0,	#17		 // load array pointer
	mul	r2,	r6, r0	 // multiply current y-position by 17
	add	r2,	r5			 // add x - position
	add	r2,	#1			 // add one
	add	r2,	r10
	ldrb	r3,	[r2]  	// load tile to right of player

	teq	r3,	#3			 // see if floor
	addeq	r5,	#1			 // add 1 to player x-position
	beq	moveRight		 // branch to moveRight

	teq	r3,	#5			 // see if floor
	addeq	r5,	#1			 // add 1 to player x-position
	beq	moveRight		 // branch to moveRight
	
	teq	r3,	#4			 // see if key
	addeq	r5, 	#1			 // add 1 to player x-position	
	beq	moveRightKey	 // branch to moveRightKey
	b		waitNoInput		 // move is invalid, wait till no new input

moveUp:

	mov	r0,	#6			 // move player number into r0
	strb	r0,	[r2]		 // change tile into player
	add	r2,	#17		 // change address to previous player address
	mov	r0,	#5			 // load "new floor" tile number
	strb	r0,	[r2]		 // change tile into floor
	bl		deleteAction	
	sub	r7,	#1			 // subtract 1 from number of actions
	bl		redrawAction
	b		checkState		 // wait until no buttons are pressed

moveUpKey:

	mov	r0,	#6			 // move player number into r0
	strb	r0,	[r2]		 // change tile into player
	add	r2,	#17		 // change address to previous player address
	mov	r0,	#5			 // load "new floor" tile number
	strb	r0,	[r2]		 // change tile into floor
	bl		deleteKey	
	add	r8,	#1			 // add 1 to keys
	bl		redrawKey	
	bl		deleteAction	
	sub	r7,	#1			 // subtract 1 from number of actions
	bl		redrawAction
	b		checkState		 // wait until no buttons are pressed

moveDown:

	mov	r0,   #6			 // move player number into r0
	strb	r0,	[r2]		 // change tile into player
	sub	r2,	#17		 // change address to previous player address
	mov	r0,	#5			 // load "new floor" tile number
	strb	r0,	[r2]		 // change tile into floor
	bl		deleteAction	
	sub	r7,	#1			 // subtract 1 from number of actions
	bl		redrawAction
	b		checkState		 // wait until no buttons are pressed

moveDownKey:

	mov	r0,	#6			 // move player number into r0
	strb	r0,	[r2]		 // change tile into player
	sub	r2,	#17		 // change address to previous player address
	mov	r0,	#5			 // load floor tile number
	strb	r0,	[r2]		 // change tile into floor
	bl		deleteKey
	add	r8,	#1			 // add 1 to keys
	bl		redrawKey
	bl		deleteAction	
	sub	r7,	#1			 // subtract 1 from number of actions
	bl		redrawAction
	b		checkState		 // wait until no buttons are pressed

moveLeft:

	mov	r0,	#6			 // move player number into r0
	strb	r0,	[r2]		 // change tile into player
	add	r2,	#1		 // change address to previous player address
	mov	r0,	#5			 // load floor tile number
	strb	r0,	[r2]		 // change tile into floor
	bl		deleteAction	
	sub	r7,	#1			 // subtract 1 from number of actions
	bl		redrawAction
	b		checkState		 // wait until no buttons are pressed

moveLeftKey:

	mov	r0,	#6			 // move player number into r0
	strb	r0,	[r2]		 // change tile into player
	add	r2,	#1		 	// change address to previous player address
	mov	r0,	#5			 // load floor tile number
	strb	r0,	[r2]		 // change tile into floor
	bl		deleteKey	
	add	r8,	#1			 // add 1 to keys
	bl		redrawKey
	bl		deleteAction	
	sub	r7,	#1			 // subtract 1 from number of actions
	bl		redrawAction
	b		checkState		 // wait until no buttons are pressed

moveRight:

	mov	r0,	#6			 // move player number into r0
	strb	r0,	[r2]		 // change tile into player
	sub	r2,	#1		 	// change address to previous player address
	mov	r0,	#5			 // load floor tile number
	strb	r0,	[r2]		 // change tile into floor
	bl		deleteAction
	sub	r7,	#1			 // subtract 1 from number of actions
	bl		redrawAction
	b		checkState		 // wait until no buttons are pressed

moveRightKey:

	mov	r0,	#6			 // move player number into r0
	strb	r0,	[r2]		 // change tile into player
	sub	r2,	#1		 	// change address to previous player address
	mov	r0,	#5			 // load floor tile number
	strb	r0,	[r2]		 // change tile into floor
	bl		deleteKey	
	add	r8,	#1			 // add 1 to keys
	bl		redrawKey
	bl		deleteAction
	sub	r7,	#1			 // subtract 1 from number of actions
	bl		redrawAction
	b		checkState		 // wait until no buttons are pressed

checkDoorOpen:

	teq	r8, #0			// see if player has keys
	beq	waitNoInput		// if not, then await next input	
	
	mov	r0, #17			// move array dimension into r10
	mul	r2, r6, r0		// get y offset
	add	r2, r5			// add x offset
	add	r2, r10			// get memory location
	
	ldrb	r1, [r2, #17]	// get square below player
	cmp	r1, #1			// see if door
	beq	validDoorDown	// change state based on this
	cmp	r1, #2			// see if exit
	beq	winState			// if so go to win state

	ldrb	r1, [r2, #-17]	// get square above player
	cmp	r1, #1			// see if door
	beq	validDoorUp		// change state based on this
	cmp	r1, #2			// see if exit
	beq	winState			// if so go to win state

	ldrb	r1, [r2, #-1]	// get square to player left
	cmp	r1, #1			// see if door
	beq	validDoorLeft	// change state based on this
	cmp	r1, #2			// see if exit
	beq	winState			// if so go to win state

	ldrb	r1, [r2, #1]	// get square to player right
	cmp	r1, #1			// see if door
	beq	validDoorRight	// change state based on this
	cmp	r1, #2			// see if exit
	beq	winState			// if so go to win state
	bne	waitNoInput		// no doors around, wait till no new input


validDoorDown:

	mov	r0,	#5			// change to "new floor" tile
	strb	r0,	[r2, #17]
	bl		deleteKey	
	sub	r8,	#1			// remove 1 key
	bl		redrawKey
	bl		deleteAction	
	sub	r7,	#1			// remove 1 action
	bl		redrawAction
	b		checkState	

validDoorUp:

	mov	r0,	#5			// change to "new floor" tile
	strb	r0,	[r2, #-17]
	bl		deleteKey	
	sub	r8,	#1			// remove 1 key
	bl		redrawKey
	bl		deleteAction	
	sub	r7,	#1			// remove 1 action
	bl		redrawAction
	b		checkState		

validDoorLeft:

	mov	r0,	#5			// change to "new floor" tile
	strb	r0,	[r2, #-1]
	bl		deleteKey	
	sub	r8,	#1			// remove 1 key
	bl		redrawKey
	bl		deleteAction	
	sub	r7,	#1			// remove 1 action
	bl		redrawAction
	b		checkState		

validDoorRight:

	mov	r0,	#5			// change to "new floor" tile
	strb	r0,	[r2, #1]
	bl		deleteKey	
	sub	r8,	#1			// remove 1 key
	bl		redrawKey
	bl		deleteAction	
	sub	r7,	#1			// remove 1 action
	bl		redrawAction
	b		checkState		

checkState:

	push	{r10}				// pop game array address
	pop	{r3}				// into r3
		
	bl		Redrawmaze		// redraw the maze based on changed
								// tiles
	teq	r7,	#0			// see if actions remaining
	beq	loseState		// if none, game over
	b		waitNoInput

loseState:

	bl		Lost
	b		waitNoInputEnd

winState:

	bl		Win
	b		waitNoInputEnd

waitNoInputEnd:

	bl		ReadSNES			// wait until no input
	cmp	r0,	#0
	beq	replayTrigger
	b		waitNoInputEnd

replayTrigger:

	bl		ReadSNES		
	cmp	r0, 	#0			// after no buttons on controller pressed
	bne	gameReset		// next button pressed resets
	b		replayTrigger	

waitNoInput:

	bl	  ReadSNES		// get input from controller
	cmp  r0, #0			// see if no buttons are pressed
	beq  inputLoop		// if no buttons, are pressed, continue with game
	b	  waitNoInput	// otherwise wait till no input

deleteKey:

	mov	r9, #0
	mov	r0, r8
	push	{lr}	
	bl		DECIDECHAR
	pop	{lr}
	bx		lr

redrawKey:

	mov	r9, #1
	mov	r0, r8
	push	{lr}	
	bl		DECIDECHAR
	pop	{lr}
	bx		lr

deleteAction:

	mov	r9, #0
	mov	r0, r7
	push	{lr}	
	bl		DECIDECHAR2
	pop	{lr}
	bx		lr

redrawAction:

	mov	r9, #1
	mov	r0, r7
	push	{lr}	
	bl		DECIDECHAR2
	pop	{lr}
	bx		lr

haltLoop$:
	b		haltLoop$

.section .data

Allay2D:
    .byte   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,1,3,3,3,3,3,3,3,0,0,3,0,0,0,3,0,3,0,0,0,0,0,0,0,3,0,0,3,0,4,0,3,0,3,0,3,3,3,3,0,0,3,0,0,3,0,3,0,3,0,3,1,3,0,3,3,0,0,3,0,0,3,0,3,0,3,0,3,0,3,0,3,3,0,0,3,0,0,3,3,3,3,3,0,3,0,3,0,3,3,0,0,3,0,0,0,0,0,0,0,0,1,0,3,0,3,0,0,0,3,0,0,4,3,3,3,3,0,3,0,3,0,3,1,3,3,3,0,0,0,0,0,0,3,0,3,0,3,0,3,0,0,0,0,0,0,3,3,3,3,3,0,3,0,3,0,3,3,3,3,3,0,0,3,0,0,0,0,0,3,0,3,0,0,0,0,0,3,0,0,3,3,3,3,3,3,3,0,3,3,3,3,0,0,3,0,0,0,0,0,0,0,0,3,0,0,0,0,3,0,0,3,0,0,0,5,0,3,3,3,3,0,0,0,0,3,0,0,3,0,0,0,3,3,3,0,0,0,0,4,3,3,3,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0





