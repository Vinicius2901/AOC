.data
	digiteX:
		.asciiz "Digite o x;\n"
		
		.text
		.globl main
		
.data
	digiteY:
		.asciiz "Digite o y:\n"
		
		.text
		
.data
	origem:
		.asciiz "A coordenada esta na origem\n"
		
		.text
		
.data
	sobreEixoX:
		.asciiz "A coordenada esta no eixo X\n"
		
		.text
		
.data
	sobreEixoY:
		.asciiz "A coordenada esta no eixo y\n"
		
		.text

.data
	PQuad:
		.asciiz "A coordenada esta no 1 Quadrante\n"
		
		.text
		
.data
	SQuad:
		.asciiz "A coordenada esta no 2 Quadrante\n"
		
		.text
		
.data
	TQuad:
		.asciiz "A coordenada esta no 3 Quadrante\n"
		
		.text
		
.data
	QQuad:
		.asciiz "A coordenada esta no 4 Quadrante\n"
		
		.text

main:
	la $a0, digiteX
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	la $a0, digiteY
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	eixoX:
		beqz $t0, eixoY1
		bnez $t0, eixoY2
		
	xMaior:
		bgtz $t0, y1Quad4Quad
		
	xMenor:
		bltz $t0, y2Quad3Quad
		
	eixoY1:
		beqz $t1, imprimirOrigem
		bnez $t1, imprimirEixoX
		
	eixoY2:
		beqz $t1, imprimirEixoY
		bnez $t1, xMaior
		
	y1Quad4Quad:
		bgtz $t1, imprimir1Quad
		bltz $t1, imprimir4Quad
		
	y2Quad3Quad:
		bgtz $t1, imprimir2Quad
		bltz $t1, imprimir3Quad
		
	imprimirOrigem:
		la $a0, origem
		li $v0, 4
		syscall
		beqz $t0, end
		
	imprimirEixoX:
		la $a0, sobreEixoX
		li $v0, 4
		syscall
		beqz $t0, end
		
	imprimirEixoY:
		la $a0, sobreEixoY
		li $v0, 4
		syscall
		beqz $t1, end
		
	imprimir1Quad:
		la $a0, PQuad
		li $v0, 4
		syscall
		bgtz $t1, end
		
	imprimir2Quad:
		la $a0, SQuad
		li $v0, 4
		syscall
		bgtz $t1, end
		
	imprimir3Quad:
		la $a0, TQuad
		li $v0, 4
		syscall
		bltz $t1, end
		
	imprimir4Quad:
		la $a0, QQuad
		li $v0, 4
		syscall
		bltz $t1, end
		
	end:
		li $v0, 10
		syscall
		
	
		