// Created by Michael David Pascual
// This is where the jumptest will link to a specific function

.section	.text

.globl	DrawClearKNUM2
.globl	DrawCharK
.globl	DrawCharE
.globl	DrawCharY
.globl	DrawCharS
.globl	DrawCharL
.globl	DrawCharSPC

.globl	DrawCharM
.globl	DrawCharO
.globl	DrawCharV
.globl	DrawCharE2
.globl	DrawCharS2
.globl	DrawCharSPC2

.globl	DrawCharKNUM10
.globl	DrawCharKNUM11
.globl	DrawCharKNUM12
.globl	DrawCharKNUM13
.globl	DrawCharKNUM14
.globl	DrawCharKNUM15
.globl	DrawCharKNUM16
.globl	DrawCharKNUM17
.globl	DrawCharKNUM18
.globl	DrawCharKNUM19

.globl	DrawCharKNUM20
.globl	DrawCharKNUM21
.globl	DrawCharKNUM22
.globl	DrawCharKNUM23
.globl	DrawCharKNUM24
.globl	DrawCharKNUM25
.globl	DrawCharKNUM26
.globl	DrawCharKNUM27
.globl	DrawCharKNUM28
.globl	DrawCharKNUM29

.globl	DrawCharMNUM10
.globl	DrawCharMNUM11
.globl	DrawCharMNUM12
.globl	DrawCharMNUM13
.globl	DrawCharMNUM14
.globl	DrawCharMNUM15
.globl	DrawCharMNUM16
.globl	DrawCharMNUM17
.globl	DrawCharMNUM18
.globl	DrawCharMNUM19
.globl	DrawCharMNUM20
.globl	DrawCharMNUM21
.globl	DrawCharMNUM22
.globl	DrawCharMNUM23
.globl	DrawCharMNUM24
.globl	DrawCharMNUM25
.globl	DrawCharMNUM26
.globl	DrawCharMNUM27
.globl	DrawCharMNUM28
.globl	DrawCharMNUM29
.globl	DrawCharMNUM30
.globl	DrawCharMNUM31


// 	USE R0 FOR CHAR INPUT, USE THE FORMAT BELOW
//	mov		r0,		#'B'
//	R6 = Y
//	R5 = X

DrawCharK:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'K'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop$:
	mov		px, #300
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharE:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'E'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop2$:
	MOV		px, #100
	ADD		px, #210
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop2$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel2$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel2$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop2$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop2$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharY:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'Y'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop3$:
	MOV		px, #320
	//ADD		px, #210
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop3$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel3$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel3$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop3$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop3$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharS:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'S'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop4$:
	MOV		px, #100
	ADD		px, #230
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop4$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel4$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel4$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop4$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop4$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharSPC:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #':'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop5$:
	MOV		px, #110
	ADD		px, #230
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop5$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel5$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel5$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop5$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop5$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharM:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'M'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop6$:
	MOV		px, #400
	ADD		px, #100
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop6$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel6$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel6$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop6$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop6$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharO:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'O'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop7$:
	MOV		px, #400
	ADD		px, #110
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop7$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel7$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel7$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop7$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop7$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharV:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'V'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop8$:
	MOV		px, #400
	ADD		px, #120
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop8$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel8$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel8$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop8$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop8$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharE2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'E'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop9$:
	MOV		px, #400
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop9$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel9$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel9$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop9$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop9$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharS2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'S'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop10$:
	MOV		px, #400
	ADD		px, #140
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop10$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel10$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel10$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop10$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop10$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharSPC2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #':'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop11$:
	MOV		px, #420
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop11$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel11$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel11$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop11$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop11$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM10:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'0'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop12$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop12$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel12$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel12$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop12$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop12$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM11:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'1'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop13$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop13$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel13$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel13$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop13$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop13$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM12:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'2'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop14$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop14$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel14$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel14$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop14$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop14$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM13:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'3'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop15$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop15$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel15$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
.ltorg
.align 4
noPixel15$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop15$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop15$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM14:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'4'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop16$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop16$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel16$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel16$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop16$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop16$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM15:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'5'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop17$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop17$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel17$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel17$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop17$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop17$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM16:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'6'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop18$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop18$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel18$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel18$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop18$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop18$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM17:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'7'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop19$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop19$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel19$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel19$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop19$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop19$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM18:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'8'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop20$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop20$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel20$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel20$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop20$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop20$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM19:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'9'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop21$:
	MOV		px, #230
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop21$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel21$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel21$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop21$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop21$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM20:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'0'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop22$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop22$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel22$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel22$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop22$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop22$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM21:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'1'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop23$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop23$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel23$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel23$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop23$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop23$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM22:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'2'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop24$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop24$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel24$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel24$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop24$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop24$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM23:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'3'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop25$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop25$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel25$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel25$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop25$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop25$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM24:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'4'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop26$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop26$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel26$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel26$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop26$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop26$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM25:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'5'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop27$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop27$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel27$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel27$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop27$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop27$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM26:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'6'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop28$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop28$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel28$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel28$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop28$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop28$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM27:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'7'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop29$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop29$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel29$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel29$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop29$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop29$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM28:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'8'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop30$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop30$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel30$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel30$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop30$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop30$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharKNUM29:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'9'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop31$:
	MOV		px, #220
	ADD		px, #130
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop31$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel31$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel31$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop31$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop31$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM10:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'0'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop32$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop32$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel32$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel32$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop32$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop32$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM11:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'1'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop33$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop33$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel33$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel33$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop33$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop33$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM12:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'2'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop34$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop34$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel34$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel34$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop34$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop34$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM13:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'3'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop35$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop35$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel35$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel35$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop35$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop35$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM14:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'4'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop36$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop36$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel36$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel36$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop36$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop36$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM15:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'5'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop37$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop37$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel37$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel37$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop37$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop37$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM16:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'6'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop38$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop38$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel38$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel38$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop38$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop38$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM17:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'7'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop39$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop39$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel39$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel39$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop39$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop39$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM18:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'8'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop40$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop40$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel40$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel40$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop40$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop40$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM19:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'9'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop41$:
	MOV		px, #300
	ADD		px, #280
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop41$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel41$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel41$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop41$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop41$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM20:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'0'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop42$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop42$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel42$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel42$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop42$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop42$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM21:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'1'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop43$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop43$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel43$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel43$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop43$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop43$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM22:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'2'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop44$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop44$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel44$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel44$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop44$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop44$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM23:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'3'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop45$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop45$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel45$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel45$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop45$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop45$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM24:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'4'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop46$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop46$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel46$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel46$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop46$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop46$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM25:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'5'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop47$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop47$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel47$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel47$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop47$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop47$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM26:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'6'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop48$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop48$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel48$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel48$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop48$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop48$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM27:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'7'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop49$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop49$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel49$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel49$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop49$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop49$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM28:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'8'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop50$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop50$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel50$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel50$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop50$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop50$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM29:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'9'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop51$:
	MOV		px, #400
	ADD		px, #170
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop51$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel51$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel51$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop51$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop51$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM30:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'0'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop52$:
	MOV		px, #400
	ADD		px, #160
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop52$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel52$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel52$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop52$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop52$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharMNUM31:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'1'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	mov		py, #130
charLoop53$:
	MOV		px, #400
	ADD		px, #160
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop53$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel53$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	MOVNE		r2,		#0x1f		// blue
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel53$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop53$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop53$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}


.section .data
.align 4
font:		.incbin	"font.bin"
