// Created by Michael David Pascual
// Just a jumptest function to determine which number to be prined in MoveCount

.section	.text

.globl	DECIDECHAR2
//	INPUT
//	R0 = NUMBER INPUT
//	OUTPUT
//	

DECIDECHAR2:
	PUSH	{R4,R5,R6, LR}
	
	PUSH	{LR}
	MOV	R1, R0
	MOV	R2, #100
	BL	udivision
	MOV	R4, R0
	POP	{LR}

	PUSH	{LR}
	MOV	R2, #10
	BL	udivision
	MOV	R5, R0
	MOV	R6, R1
	POP	{LR}
	
	BL	DECIDE1ST
	BL	DECIDE2ND
	BL	DECIDE3RD
	POP	{R4,R5,R6,PC}


DECIDE1ST:
	PUSH	{LR}

	CMP	R6, #0
	BLEQ	DrawCharMNUM10
	CMP	R6, #1
	BLEQ	DrawCharMNUM11
	CMP	R6, #2
	BLEQ	DrawCharMNUM12
	CMP	R6, #3
	BLEQ	DrawCharMNUM13
	CMP	R6, #4
	BLEQ	DrawCharMNUM14
	CMP	R6, #5
	BLEQ	DrawCharMNUM15
	CMP	R6, #6
	BLEQ	DrawCharMNUM16
	CMP	R6, #7
	BLEQ	DrawCharMNUM17
	CMP	R6, #8
	BLEQ	DrawCharMNUM18
	CMP	R6, #9
	BLEQ	DrawCharMNUM19
	POP	{PC}

DECIDE2ND:
	PUSH	{LR}

	CMP	R5, #0
	BLEQ	DrawCharMNUM20
	CMP	R5, #1
	BLEQ	DrawCharMNUM21
	CMP	R5, #2
	BLEQ	DrawCharMNUM22
	CMP	R5, #3
	BLEQ	DrawCharMNUM23
	CMP	R5, #4
	BLEQ	DrawCharMNUM24
	CMP	R5, #5
	BLEQ	DrawCharMNUM25
	CMP	R5, #6
	BLEQ	DrawCharMNUM26
	CMP	R5, #7
	BLEQ	DrawCharMNUM27
	CMP	R5, #8
	BLEQ	DrawCharMNUM28
	CMP	R5, #9
	BLEQ	DrawCharMNUM29
	POP	{PC}

DECIDE3RD:
	PUSH	{LR}

	CMP	R4, #0
	BLEQ	DrawCharMNUM30
	CMP	R4, #1
	BLEQ	DrawCharMNUM31
	POP	{PC}
