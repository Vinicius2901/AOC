.data
texto:
	.asciiz "Digite quantos termos de Fibonacci deseja:"
	
	.text
	.globl main
	
main:
	la $a0, texto
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0
	
	addi $s0, $s0, -1
	
	li $s1, 1
	li $s2, 1
	li $s3, 1
	ble $s0, 1, imprimir
	
fibonacci:
	add $s3, $s1, $s2
	addi $s0, $s0, -1
	move $s1, $s2
	move $s2, $s3
	bnez $s0, fibonacci
	
imprimir:
	move $a0, $s3
	li $v0, 1
	syscall
	
end:
	li $v0, 10
	syscall
	