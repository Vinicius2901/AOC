.data

texto:
	.asciiz "Digite um numero\n"
	
	.text
	.globl main
	
main:
	la $a0, texto
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	beqz $t0, end
	
	div $t1, $t0, 2
	
imprimirPar:
	mfhi $t2
	bnez $t2, imprimirImpar
	.data
	textoPar:
	.asciiz "O numero eh par\n"
	
	.text
	
	la $a0, textoPar
	li $v0, 4
	syscall
	bnez $t0, main
	beqz $t2, end
imprimirImpar:
	.data
	textoImpar:
	.asciiz "O numero eh impar\n"
	
	.text
	
	la $a0, textoImpar
	li $v0, 4
	syscall
	bnez $t0, main
	
end:
	li $v0, 10
	syscall
	

