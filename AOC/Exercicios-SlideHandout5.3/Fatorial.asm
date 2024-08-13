.text

.globl main


main:
	li $v0, 5 	# Seta o codigo do syscall em 5, para ler um inteiro que o usuario digita
	syscall		# Chama o sistema com codigo 5, para ler inteiro
	move $s1, $v0	# Move o valor lido do usuario para o registrador s1
	li $s0, 1	# Seta o valor de s0 para 1

while:
	mult $s1, $s0 		# Multiplica fatorialmente e salva no registrador lo
	mflo $s0	   	# Move o valor do registrador lo para o registrador s0
	addi $s1, $s1, -1	# Decerementa em 1 o valor do registrador s1
	bnez $s1, while		# Compara o valor de s1 a 0

imprimir:
	li $v0, 1	# Seta o codigo do syscall em 1, para imprimir um inteiro
	move $a0, $s0	# Move o inteiro do registrador s0 para o registrador a0, que é o registrador utilizado para impressao
	syscall		# Imprime o nomero na tela

end:
	li $v0, 10
	syscall