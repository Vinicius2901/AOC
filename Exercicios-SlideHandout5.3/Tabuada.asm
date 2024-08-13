.text
.globl main

main:
	li $t0, 1
	
	inicio:
	li $t1, 0
	
	addi $t0, $t0, 1
	
	imprimirTabuada:
		.data
		numero:
			.asciiz "Tabuada de "
			
			.text
		la $a0, numero
		li $v0, 4
		syscall
		move $a0, $t0
		li $v0, 1
		syscall
		
		.data
		pontos:
			.asciiz ": "
			.text
		la $a0, pontos
		li $v0, 4
		syscall
	
	multi:
	addi $t1, $t1, 1
	mult $t0, $t1
	
	mflo $t2
	
	beq $t1, 10, imprimirNumero2
	imprimirNumero1:
		.data
		espaco:
			.asciiz " "
			.text
		move $a0, $t2
		li $v0, 1
		syscall
		la $a0, espaco
		li $v0, 4
		syscall
		blt $t1, 10, multi
		
	imprimirNumero2:
		.data
		quebraLinha:
			.asciiz "\n"
			.text
		move $a0, $t2
		li $v0, 1
		syscall
		la $a0, quebraLinha
		li $v0, 4
		syscall
		beq $t0, 10, end
		beq $t1, 10, inicio
		
	end:
		li $v0, 10
		syscall
		
	
	
		
