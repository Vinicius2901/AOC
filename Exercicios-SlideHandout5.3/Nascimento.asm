.data
texto:
	.asciiz "Digite quantos dias você tem:\n"
	
	.text
	.globl main
	
main:
	la $a0, texto
	li $v0, 4
	syscall
	
	li $v0 5
	syscall
	
	move $t0, $v0
	
	
ano:
	blt $t0, 365, mes
	li $t1, 365
	div $s0, $t0, $t1
	mfhi $t0
	
mes:
	blt $t0, 30, dia
	li $t1, 30
	div $s1, $t0, $t1
	mfhi $t0
	
dia:
	blt $t0, 1, imprimir
	li $t1, 1
	div $s2, $t0, $t1
	mfhi $t0

.data
barra:
	.ascii "/"
	.text

imprimir:
	move $a0, $s0
	li $v0, 1
	syscall
	la $a0, barra
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	la $a0, barra
	li $v0, 4
	syscall
	
	move $a0, $s2
	li $v0, 1
	syscall
	
end:
	li $v0, 10
	syscall
