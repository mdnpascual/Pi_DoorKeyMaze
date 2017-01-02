// Created by Michael David Pascual
// Just a jumptest function to determine which number to be prined in KeyCount

.section	.text

.globl	DECIDECHAR
//	INPUT
//	R0 = NUMBER INPUT
//	OUTPUT
//	

DECIDECHAR:
	PUSH	{R4, LR}
	
	PUSH	{LR}
	MOV	R1, R0
	MOV	R2, #10
	BL	udivision
	MOV	R4, R0
	POP	{LR}
	BL	DECIDE1ST
	MOV	R0, R4
	BL	DECIDE2ND
	POP	{R4, PC}

DECIDE1ST:
	PUSH	{LR}
	// Synxtax is: DrawChar+'K' or 'M'+NUM+'position of number'+'The value of number'
	CMP	R1, #0
	BLEQ	DrawCharKNUM10
	CMP	R1, #1
	BLEQ	DrawCharKNUM11
	CMP	R1, #2
	BLEQ	DrawCharKNUM12
	CMP	R1, #3
	BLEQ	DrawCharKNUM13
	CMP	R1, #4
	BLEQ	DrawCharKNUM14
	CMP	R1, #5
	BLEQ	DrawCharKNUM15
	CMP	R1, #6
	BLEQ	DrawCharKNUM16
	CMP	R1, #7
	BLEQ	DrawCharKNUM17
	CMP	R1, #8
	BLEQ	DrawCharKNUM18
	CMP	R1, #9
	BLEQ	DrawCharKNUM19
	POP	{PC}

DECIDE2ND:
	PUSH	{LR}

	CMP	R0, #0
	BLEQ	DrawCharKNUM20
	CMP	R0, #1
	BLEQ	DrawCharKNUM21
	CMP	R0, #2
	BLEQ	DrawCharKNUM22
	CMP	R0, #3
	BLEQ	DrawCharKNUM23
	CMP	R0, #4
	BLEQ	DrawCharKNUM24
	CMP	R0, #5
	BLEQ	DrawCharKNUM25
	CMP	R0, #6
	BLEQ	DrawCharKNUM26
	CMP	R0, #7
	BLEQ	DrawCharKNUM27
	CMP	R0, #8
	BLEQ	DrawCharKNUM28
	CMP	R0, #9
	BLEQ	DrawCharKNUM29
	POP	{PC}
