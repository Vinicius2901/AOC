.data

texto:
	.asciiz "Digite um numero\n"
	
	.text
	.globl main

main:
	la $a0, texto
	li $v0, 4
	syscall
	
digitarNum:
	li $v0, 5
	syscall
	move $s1, $v0
	beq $s1, -1, media
soma:
	add $s2, $s2, $s1
	addi $s3, $s3, 1
	bne $s1, -1, main
media:
	div $s4, $s2, $s3
	
imprimir:
	li $v0, 1
	move $a0, $s2
	syscall
	
	.data
	quebraLinha:
	.ascii "\n"
	
	.text
	
	la $a0, quebraLinha
	li $v0, 4
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall
	
end:
	li $v0, 10
	syscall