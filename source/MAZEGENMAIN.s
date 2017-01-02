// Created by Michael David Pascual
// Main function to generate a random maze map
// The code will start making the map by choosing an exit position then making 1 floor to the left
// CHKDIRECTIONS will check for the possible moves avaialable for the generator, the value
// returned by CHKDIRECTIONS (in r1) will then be taken by SETDIRECTIONS
// If there are more than 1 direction possible, SETDIRECTIONS will then consult the random number generator
// to choose which direction will it go. It will set it to floors but will also try to check if it has a key or door
// on the position, it will not overwrite the position if a door or key is already there
// After that, SETDIRECTIONS will then call RANDOMEVENTS to see if it will spawn a door or key
// Depending on the status of the doorflags or keyflags
// RANDOMEVENTS is set to create a key at 1/2 chance after 3 spacing(6 blocks, each move is 2 blocks) from a door
// RANDOMEVENTS is set to crate a door at 1/3 chance only if keyflag is 1


.section	.text

.globl		MAZEGENMAIN
.globl		randomization
.globl	Seed
.globl	Seed2
.globl	frameB
.globl	udivision

MAZEGENMAIN:

	// CLEAR ARRAY
	LDR	R0, =Count2D
	LDR	R0, [R0]
	MOV	R1, #0		// COUNTER
	MOV	R2, #0		// VALUE TO SAVE
	LDR	R3, =Array2D

CLEARARRAY:
	STRB	R2, [R3]
	ADD	R1, #1
	ADD	R3, #1
	CMP	R0, R1
	BNE	CLEARARRAY

	LDR 	R0, =0x20003004	// get start seed @ timer
	LDR 	R0, [R0]	// load value
	LDR 	R6, =Seed
	STR 	R0, [R6]	// Save Seed

	MOV	R0, #0
	MOV	R6, #0


	MOV 	R0, #8	// Number of starting choices for the exit
	PUSH	{LR}
	BL	randomization	// r2 is the choice
	POP	{LR}
	PUSH	{LR}
	BL	MAZEGEN
	POP	{LR}
	BX	LR

MAZEGEN:
	// ARRAY VALUES FOR MAZE
	// 0 = WALL
	// 1 = DOOR
	// 2 = EXIT DOOR
	// 3 = FLOOR
	// 4 = KEY
	// 5 = START	

	PUSH	{R4,R5,R6,R7,R8,R9,R10}
	
	//Init exit door and lay 1 floor
	MOV	R0, #1
	SUB	R2, R0			// -1 For the chosen exit door position
	LDR	R0, =PossibleStart	// Load start address for possible starts
	MOV	R2, R2, LSL#1		// Multiply by 2 since each start = 2 bytes
	ADD	R0, R2			// Add offset to possiblestart address
	LDRB	R1, [R0]		// Load value of Y position in R1
	ADD	R1, R1, LSL #4		// Multiply Row position by 17
	LDRB	R2, [R0, #1]		// Get X position and load to R2
	ADD	R1, R2			// ADD ROW+COLUMN to get array position in R1
	LDR	R0, =Array2D		// Load start address of Array2D
	ADD	R0, R1			// Add offset(R1) to Array2D address
	MOV	R5, R1			// SAVE OFFSET VALUE TO R5
	MOV	R1, #2			// STORE 2(EXIT DOOR) IN THE ARRAY
	STRB	R1, [R0]		// ^
	SUB	R0, #1			// MOVE LEFT IN EXIT DOOR
	MOV	R1, #3			// STORE 3(FLOOR) IN THE ARRAY
	STRB	R1, [R0]		// ^
	//END
	//PUSH	{R5}
	
		
		
	// ALTER THESE VALUES TO CHANGE MAZE GENERATION	
	// Rand 1/x = For percentage value
	.set	doorP, 3
	.set	keyP, 2
	.set	spacing, 3	//Minimum Spacing between a key and a door
	// Initialization
	MOV 	R0, #1		// R0 = STACK COUNTER
	MOV 	R10, #1		// R10 = DOOR IF
	MOV 	R9, #0		// R9 = KEY IF
	MOV 	R8, #spacing	// R8 = SPACING
	MOV 	R7, #0		// R7 = DOOR COUNT
	MOV 	R6, #0		// R6 = KEY COUNT
	SUB	R5, #1		// R5 = CURRENT POS
	PUSH	{R5}
	PUSH	{R4}
	LDR	R4, =finalPos
.ltorg
.align 2
	STRH	R5, [R4]
	POP	{R4}
	LDR 	R4, =Array2D	// R4 = Array2D address

mazeloop:
	CMP	R0, #0
	BEQ	loopout
	MOV 	R3, R4		// TEMP VALUE FOR R4
	ADD 	R3, R5		// R3 = CURRENT POS ADDRESS
	
	PUSH	{LR}
	BL 	CHKDIRECTIONS	// CHECK POSSIBLE MOVES TO BE FILLED
	POP	{LR}
debug:	
	// R1 IS THE CHOICE DIRECTION	
	// R1 IS INPUT FOR SETDIRECTIONS
	// REFER TO POSSIBLEDIRECTIONS IN DATA SECTION FOR THE EQUIVALENT VALUE OF R1
	CMP	R1, #0
	BEQ	noway
setway:
	PUSH	{R4,R6}
	LDR	R4, =ENDRDY	// FLAG SIGNIFING THAT ARRAY WILL STORE THE NEXT POSITION
				// THAT WILL ENCOUNTER A DEAD END, THIS WIL BE USED LATER
				// TO DETERMINE START POSITION
	MOV	R6, #1
	STRB	R6, [R4]
	POP	{R4,R6}


	PUSH	{R0}
	PUSH	{LR}
	BL 	SETDIRECTIONS	// SET DIRECTIONS AND DETERMINE RANDON EVENTS IN THIS MOVE
	POP	{LR}
	POP	{R0}
	ADD	R0, #1		// ADD 1 TO STACK COUNTER
	SUB	R3, R4
	PUSH	{R3}		// PUSH CURRENT POS
	MOV	R5, R3
	PUSH	{R4}
	LDR	R4, =finalPos
	STRH	R3, [R4]
	POP	{R4}
	B	mazeloop
	

noway:
	POP	{R5}		// POP CURRENT POS UNTIL GENERATOR CAN MOVE AGAIN
	PUSH	{R4, R6, R7}
	LDR	R4, =ENDPOS	// GET END POS
	LDR	R6, =ENDPOSC	// GET COUNT
	LDR	R7, =ENDRDY	// FLAG TO DETERMINE IF POSITION IS A DEAD END CORNER
	LDRB	R7,[R7]		
	CMP	R7,#1
	BNE	NOSTORE
	LDRB	R6, [R6]	// GET COUNT VALUE
	ADD	R4, R6, LSL#1	// BASE ADDRESS + OFFSET*2, BECAUSE ARRAY IS HALF-WORD PER INDEX
	STRH	R5, [R4]	// STORE POS
	ADD	R4, R6, #1	// ADD 1 TO COUNTER
	LDR	R6, =ENDPOSC
	STRB	R4, [R6]	// STORE COUNTER
	MOV	R4, #0
	LDR	R7, =ENDRDY
	STRB	R4,[R7]
	POP	{R4, R6, R7}
	B	NOSTORE2
	
NOSTORE:
	POP	{R4, R6, R7}
NOSTORE2:
	SUB	R0, #1
	B	mazeloop
	// MAYBE SET SOMETHING HERE TO CHOOSE END SPOTS SO IT'S HARDER



loopout:
	// GENERATOR WILL NOW DO THE POST-INDEX FIX TO COMPLETE HE MAZE GENERATION
	PUSH	{R1,R2,R3}
	LDR	R0, =ENDPOSC	// GET COUNT OR POSSIBLE START POS
	LDRB	R0, [R0]	// LOAD TO R0 TO BE TESTED BY RANDOMIZER

	PUSH	{LR}
	BL	randomization	// r2 is the choice
	POP	{LR}
	SUB	R2, #1		// SUBTRACT 1 BECAUSE WE ARE DEALING WITH AN ARRAY INDEX
	LDR	R1, =ENDPOS
	ADD	R1, R2, LSL#1	// BASE ADDRESS + OFFSET*2
	LDRH	R1, [R1]

	PUSH	{R4}
	PUSH	{R1}		// SAVE R1 AND R4
	MOV	R2, #17		// NEED TO DIVIDE TO GET X AND Y POSITION, WILL BE USED BY GAME LOGIC
	PUSH	{R0,R2,R3}
	push {lr}
	BL udivision	// R0 = R1/R2 unsigned
	pop {lr}
	MOV	R4, R0
	POP	{R0,R2,R3}
	POP	{R1}
	ADD	R7, R4, #1	// Y POSITION
	ADD	R4, R4, LSL#4	// ANSWER * 17
	PUSH	{R1}
	SUB	R1, R4
	MOV	R6,R1		// X POSITION
	POP	{R1}
	POP	{R4}	

	MOV	R0, R1
	POP	{R1,R2,R3}
	
	ADD	R0, R4
	MOV	R1, #5
	STRB	R1, [R0]
	
	// SETTING UP REG VALUES FOR OUTPUT
	MOV	R0,R4		// Array2D ADDRESS
	MOV	R1,R6		// X POS - STARTING POS
	MOV	R2,R7		// Y POS - STARTING POS

	POP	{R4,R5,R6,R7,R8,R9,R10}
		
	BX	LR
	
randomization:
	push {R5, R6, R7}
	MOV	R5, R0
	LDR R0, =Seed // LDR R0, =0x20003004
	LDR R0, [R0]
	MOV	R1, #1
	
	// RNG code, FROM: ARM SOFTWARE DEVELOPMENT TOOLKIT V2.0 PG. 5-25
	TST R1, R1, LSR #1 // top bit into Carry
	MOVS R2, R0, RRX // 33 bit rotate right
	ADC R1, R1, R1 // carry into lsb of R1
	EOR R2, R2, R0, LSL #12 // (involved!)
	EOR R0, R2, R2, LSR #20 // (similarly involved!)
	// END RNG code
	
	LDR R6, =Seed
	STR R0, [R6]	// Save Seed
	
	// division
	LDR	R1, =MAXUSIGNED32BIT	// = 1024
	LDR	R1, [R1]
	MOV R2, R5
	
		
	push {lr}
	BL udivision	// R0 = R1/R2 unsigned
	pop {lr}

	LDR R1, =Seed
	LDR R1, [R1]	// Random number
	LDR R7, =CLEAR	// GET ONLY THE BITS THAT FITS 1024
	LDR R7, [R7]
	MOV R7, R7, LSL#10
	BIC R1, R7
	MOV R7, #0	// ZERO THE MSB UP TO 2048 BIT

randloop:		// INSTEAD OF USING UDIVISION FUNCTION, RANDLOOP INSTEAD UNIL R0 IS GREATER THAN 1024
	CMP R1, R0
	BLS	randexit
	mov r0, r0, LSL#1
	ADD R7, #1
	B randloop
	
	
randexit:
	ADD R7, #1
	MOV R2, R7	// R2 is the choice that the program will pick
	pop {R5, R6, R7}
	BX LR
	


udivision:
	// Code for unsigned division
	// FROM: http://www.tofla.iconbar.com/tofla/arm/arm02/index.htm
	// R1/R2
	CMP	R2, #0
	BEQ	divide_end
	//check for divide by zero!
	
	MOV      R0,#0     //clear R0 to accumulate result
	MOV      R3,#1     //set bit 0 in R3, which will be
						//shifted left then right
uloop:
	CMP      R2,R1
	MOVLS    R2,R2,LSL#1
	MOVLS    R3,R3,LSL#1
	BLS      uloop
	//shift R2 left until it is about to
	//be bigger than R1
	//shift R3 left in parallel in order
	//to flag how far we have to go
next:
	CMP       R1,R2      //carry set if R1>R2 (don't ask why)
	SUBCS     R1,R1,R2   //subtract R2 from R1 if this would
						  //give a positive answer
	ADDCS     R0,R0,R3   //and add the current bit in R3 to
						  //the accumulating answer in R0
	MOVS      R3,R3,LSR#1     //Shift R3 right into carry flag
	MOVCC     R2,R2,LSR#1     //and if bit 0 of R3 was zero, also
							   //shift R2 right
	BCC       next            //If carry not clear, R3 has shifted
							   //back to where it started, and we
							   //can end
divide_end:
	// R1 = Remainder
	// R0 = Result
	BX		LR

.section .data

Array2D:
	.byte	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	
Count2D:
	.int	.-Array2D
	
.align	4

PossibleStart:
	.byte	1, 16
	.byte	3, 16
	.byte	5, 16
	.byte	7, 16
	.byte	9, 16
	.byte	11, 16
	.byte	13, 16
	.byte	15, 16
	
.align 4

finalPos:
	.hword	0
	
currentPos:
	.hword	0

.align 4
	
possibleDirection:
	.byte	0
	//	4 bits for 4 direction, 1111 - udlr
	//	0 - No direction			[YES][YES]
	//	1 - Up					[YES]
	//	2 - left				[YES]
	//	3 - right				[YES]
	//	4 - down				[YES]
	//	5 - left and right			[YES]
	//	6 - down and right			[YES]
	//	7 - down and left			[YES]
	//	8 - up and down				[YES]
	//	9 - up and right			[YES]
	//	10 - up and left			[YES]
	//	11 - up and left and right		[YES]
	//	12 - down and left and right		[YES]
	//	13 - up and down and right		[YES]
	//	14 - up and down and left		[YES]
	//	15 - all				[YES]

.align 4
	
Seed:
	 .int	589527792
	// .int 49160
	// .int 6583
	// .int 58804039
	// .int 918981515

Seed2:
	.int 0

frameB:
	.int 0

	
MAXUSIGNED32BIT:
	.int	1024

CLEAR:
	.int	0b1111111111111111111111

ENDPOS:
	.hword	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

ENDPOSC:
	.byte	0

ENDRDY:
	.byte	1
