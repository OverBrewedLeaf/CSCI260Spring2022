.data
frameBuffer: 	.space 	0x80000 # 512 wide X 256 high pixels
m: 		.word 	80
n: 		.word 	256
c1r: 		.word 	0x0
c1g: 		.word 	0x0
c1b: 		.word	0x0
c2r: 		.word 	0x0
c2g: 		.word 	0x0000FF00
c2b: 		.word 	0x0

.text
drawLine: 
la $s1,frameBuffer
addi $s2,$s1,524388 #512 * 256 * 4 to find max size
li $t3,0x00FFFF00 # $t3 ? yellow

addi $t1,$s1,0 # start point for t1
background:
sw $t3,($t1) # color with yellow
addi $t1,$t1,4 # add 4 each iteration
beq $t1,$s2,endback# # if t1 <t4 continue; else end
j background
endback:

#outter Square

la $t2,c2r
lw $t2,c2r
la $t3,c2g
lw $t3,c2g
la $t4,c2b
lw $t4,c2b

add $t2,$t2,$t3
add $t2,$t2,$t4 #t2 <- outer color
#end outer color
add $t1,$zero,$zero #reset t1
add $t3,$zero,$zero
la $t3,n #load in outer square for t3
lw $t3,n 
j square

square:




li $v0,10 # exit code
syscall # exit to OS