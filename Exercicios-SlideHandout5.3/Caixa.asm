.data
texto:
	.asciiz "Digite um valor:\n"
	
	.text
	.globl main
	
main:
	la $a0, texto
	li $v0, 4
	syscall
	
	li $v0 5
	syscall
	
	move $t0, $v0
	
	
nota50:
	blt $t0, 50, nota20
	li $t1, 50
	div $s0, $t0, $t1
	sub $t0, $t0, $t1
	
nota20:
	blt $t0, 20, nota10
	li $t1, 20
	div $s1, $t0, $t1
	sub $t0, $t0, $t1
	
nota10:
	blt $t0, 10, nota5
	li $t1, 10
	div $s2, $t0, $t1
	sub $t0, $t0, $t1
	
nota5:
	blt $t0, 5, moeda1
	li $t1, 5
	div $s3, $t0, $t1
	sub $t0, $t0, $t1
	
moeda1:
	blt $t0, 1, imprimir
	li $t1, 1
	div $s4, $t0, $t1
	sub $t0, $t0, $t1

.data
espaco:
	.ascii " "
	.text

imprimir:
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, espaco
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, espaco
	li $v0, 4
	syscall
	
	move $a0, $s2
	li $v0, 1
	syscall
	la $a0, espaco
	li $v0, 4
	syscall
	
	move $a0, $s3
	li $v0, 1
	syscall
	la $a0, espaco
	li $v0, 4
	syscall
	
	move $a0, $s4
	li $v0, 1
	syscall
	
end:
	li $v0, 10
	syscall
