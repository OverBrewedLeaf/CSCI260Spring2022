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
la $s0,frameBuffer
addi $s1,$s0,524388 #512 * 256 * 4 to find max size + frame buffer
la $s2,n
la $s3,m
li $s7,0x00FFFF00 # $s7 <- yellow

addi $t0,$s0,0 # start point for t1
background:
sw $s7,($t0) # color with yellow
addi $t0,$t0,4 # add 4 each iteration
beq $t0,$s1,endback# # if t1 < t4 continue; else end
j background
endback:

#outer Square
addi $s7,$zero,0x0000FF00 #s7 <- outer color hardcode for now
srl $t1,$s2,1 # t1<-n/2
addi $t2,$zero,256 #t2 <- 256
sub $t2,$t2,$t1 # t2 <- 256-n/2
add $t0,$s0,$t2 #reset framebuff to first line + 256-n/2
addi $t3,$zero,128 #t3 <- 128
sub $t3,$t3,$t1 # t3 <- 128-n/2 number of layers until topleft corner

outBoxCorner:
beq $t4,$t3, offset1
add $t5,$t5,2048
j outBoxCorner
offset1:
add $t0,$t0,$t5

colorOutBox:
sw $s7,($t5)
addi $t0,$t0,4
beq $t0,$s1,finOutBox
j colorOutBox
finOutBox:

li $v0,10 # exit code
syscall # exit to OS
