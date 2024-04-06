A: .asciz "W"
mov r0,#26
mov r1,#1
ldr r2,=A
ldr r9,=NUM
mov r6,#1 ;X movement
mov r7,#1 ; Y movement

mov r5,#1 ; This will be the mode
/*
		x	y
	m1->	+	+
	m2->	+	-
	m3->	-	+
	m4->	-	- 
*/

bl ANIM
swi 0x11

ANIM: swi 0x206; Clear the board
swi 0x204 ; Display the letter
ldr r8,[r9]
b DELAY
ENDDELAY:

;Vertical Walls
cmp r0,#0
cmpne r0,#39
beq VERT
ENDVERT:

;Horizontal Walls
cmp r1,#0
cmpne r1,#14
beq HORI
ENDHORI:

b MOVEMENT ; Movement based on mode
ENDMOVEMENT:
b ANIM


DELAY:cmp r8,#0
beq ENDDELAY
sub r8,r8,#1
b DELAY




MOVEMENT:cmp r5,#1
addeq r0,r0,r6
addeq r1,r1,r7
beq ENDMOVEMENT

cmpne r5,#2
addeq r0,r0,r6
subeq r1,r1,r7
beq ENDMOVEMENT

cmpne r5,#3
subeq r0,r0,r6
addeq r1,r1,r7
beq ENDMOVEMENT

cmpne r5,#4
subeq r0,r0,r6
subeq r1,r1,r7
beq ENDMOVEMENT



VERT:cmp r5,#1
moveq r5,#3
beq ENDVERT

cmpne r5,#2
moveq r5,#4
beq ENDVERT

cmpne r5,#3
moveq r5,#1
beq ENDVERT

cmpne r5,#4
moveq r5,#2
beq ENDVERT


HORI: cmp r5,#1
moveq r5,#2
beq ENDHORI

cmpne r5,#2
moveq r5,#1
beq ENDHORI

cmpne r5,#3
moveq r5,#4
beq ENDHORI

cmpne r5,#4
moveq r5,#3
beq ENDHORI




NUM: .word 26000



