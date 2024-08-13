.data

texto:
	.asciiz "Ola mundo!\n"
	
	.text
	.globl main
	
main:
	la $a0, texto
	li $v0, 4	#syscall para imprimir string
	syscall
	
end:
	li $v0, 10
	syscall