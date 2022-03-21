.data
frameBuffer: 	.space 	0x80000 # 512 wide X 256 high pixels
m: 		.word 	80
n: 		.word 	120
c1r: 		.word 	0x0
c1g: 		.word 	0x0
c1b: 		.word	0x0
c2r: 		.word 	0x0
c2g: 		.word 	0x0000FF00
c2b: 		.word 	0x0

.text
drawLine: 
la $s0,frameBuffer
addi $s1,$s0,524388 #512 * 256 * 4 to find max size + frame buffer
li $t3,0x00FFFF00 # $t3 <- yellow

addi $t1,$s0,0 # start point for t1
background:
sw $t3,($t1) # color with yellow
addi $t1,$t1,4 # add 4 each iteration
beq $t1,$s1,endback# # if t1 <t4 continue; else end
j background
endback:

#outter Square

addi $s2,$zero,0x0000FF00 #t2 <- outer color
#end outer color
add $t1,$zero,$zero #reset t1
la $t3,n #load in outer square for t3
lw $t3,n 





li $v0,10 # exit code
syscall # exit to OS
