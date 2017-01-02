// Created by Michael David Pascual
// JUST DRAW OUT NAMES

.section	.text

.globl	DRAWNAMES

DRAWNAMES:
	PUSH	{LR}
	MOV	R9, #1
	BL	DrawCharNM
	BL	DrawCharNI
	BL	DrawCharNC
	BL	DrawCharNH
	BL	DrawCharNA
	BL	DrawCharNE
	BL	DrawCharNL

	BL	DrawCharND
	BL	DrawCharNA2
	BL	DrawCharNV
	BL	DrawCharNI2
	BL	DrawCharND2

	BL	DrawCharNP
	BL	DrawCharNA3
	BL	DrawCharNS
	BL	DrawCharNC2
	BL	DrawCharNU
	BL	DrawCharNA4
	BL	DrawCharNL2


	BL	DrawCharNM2
	BL	DrawCharNA5
	BL	DrawCharNR
	BL	DrawCharNC3
	BL	DrawCharNU2
	BL	DrawCharNS3

	BL	DrawCharNS4
	BL	DrawCharNT
	BL	DrawCharNE5
	BL	DrawCharNW
	BL	DrawCharNA6
	BL	DrawCharNR2
	BL	DrawCharNT2

	BL	DrawCharNJ
	BL	DrawCharNO
	BL	DrawCharNE2
	BL	DrawCharNL3

	BL	DrawCharNN
	BL	DrawCharNI3
	BL	DrawCharNE3
	BL	DrawCharNL4
	BL	DrawCharNS2
	BL	DrawCharNE4
	BL	DrawCharNN2

	POP	{PC}
	


DrawCharNM:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'M'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop$:
	mov		px, #25
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNI:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'I'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop1$:
	mov		px, #33
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop1$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel1$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
	bl		DrawPixel			// draw blue pixel at (px, py)
noPixel1$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1
	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop1$
	add		py,		#1			// increment y coordinate by 1
	tst		chAdr,	#0xF
	bne		charLoop1$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)
	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask
	pop		{r4-r8, pc}

DrawCharNC:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'C'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop2$:
	mov		px, #41
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop2$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel2$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNH:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'H'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop3$:
	mov		px, #49
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop3$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel3$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNA:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'A'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop4$:
	mov		px, #57
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop4$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel4$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNE:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'E'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop5$:
	mov		px, #65
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop5$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel5$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
	bl		DrawPixel			// draw blue pixel at (px, py)
.ltorg
.align 4
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

DrawCharNL:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'L'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop6$:
	mov		px, #73
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop6$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel6$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharND:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'D'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop7$:
	mov		px, #89
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop7$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel7$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNA2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'A'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop8$:
	mov		px, #97
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop8$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel8$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNV:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'V'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop9$:
	mov		px, #105
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop9$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel9$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNI2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'I'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop10$:
	mov		px, #113
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop10$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel10$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharND2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'D'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop11$:
	mov		px, #121
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop11$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel11$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNP:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'P'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop12$:
	mov		px, #137
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop12$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel12$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNA3:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'A'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop13$:
	mov		px, #145
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop13$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel13$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNS:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'S'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop14$:
	mov		px, #153
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop14$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel14$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNC2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'C'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop15$:
	mov		px, #161
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop15$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel15$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
	bl		DrawPixel			// draw blue pixel at (px, py)
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

DrawCharNU:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'U'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop16$:
	mov		px, #169
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop16$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel16$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNA4:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'A'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop17$:
	mov		px, #177
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop17$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel17$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNL2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'L'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2D4
charLoop18$:
	mov		px, #185
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop18$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel18$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNJ:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'J'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop19$:
	mov		px, #25
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop19$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel19$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNO:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'O'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop20$:
	mov		px, #33
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop20$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel20$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNE2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'E'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop21$:
	mov		px, #41
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop21$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel21$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNL3:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'L'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop22$:
	mov		px, #49
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop22$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel22$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNN:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'N'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop23$:
	mov		px, #65
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop23$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel23$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNI3:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'I'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop24$:
	mov		px, #73
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop24$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel24$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNE3:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'E'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop25$:
	mov		px, #81
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop25$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel25$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNL4:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'L'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop26$:
	mov		px, #89
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop26$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel26$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNS2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'S'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop27$:
	mov		px, #97
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop27$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel27$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNE4:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'E'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop28$:
	mov		px, #105
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop28$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel28$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNN2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'N'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2C0
charLoop29$:
	mov		px, #113
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop29$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel29$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNM2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'M'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop30$:
	mov		px, #25
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop30$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel30$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNA5:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'A'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop31$:
	mov		px, #33
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop31$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel31$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNR:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'R'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop32$:
	mov		px, #41
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop32$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel32$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNC3:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'C'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop33$:
	mov		px, #49
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop33$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel33$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNU2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'U'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop34$:
	mov		px, #57
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop34$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel34$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNS3:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'S'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop35$:
	mov		px, #65
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop35$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel35$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNS4:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'S'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop36$:
	mov		px, #81
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop36$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel36$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNT:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'T'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop37$:
	mov		px, #89
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop37$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel37$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNE5:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'E'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop38$:
	mov		px, #97
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop38$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel38$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNW:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'W'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop39$:
	mov		px, #105
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop39$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel39$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNA6:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'A'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop40$:
	mov		px, #113
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop40$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel40$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNR2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'R'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop41$:
	mov		px, #121
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop41$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel41$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

DrawCharNT2:
	push	{r4-r8, lr}
	chAdr	.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	mask	.req	r8
	ldr		chAdr,	=font		// load the address of the font map
	mov		r0, #'T'
	add		chAdr,	r0, lsl #4	// char address = font base + (char * 16)
	LDR		py, =0x2E8
charLoop42$:
	mov		px, #129
	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	ldrb		row,	[chAdr], #1	// load the row byte, post increment chAdr
rowLoop42$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel42$
	mov		r0,		px
	mov		r1,		py
	CMP		R9, #0
	LDREQ		R2,		=0xffff
	LDRNE		R2,		=0xF920	// redorange
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

.section .data
.align 4
font:		.incbin	"font.bin"
