.data 
	
	texto1: .asciiz "Vector "
	texto2: .asciiz "Max value: "
	texto3: .asciiz "Min value: "
	texto4: .asciiz "Numeros pares del vector: "
	texto5: .asciiz "Numeros impares del vector: "
	newLine: .asciiz "\n"
	vector:  .word 2,4,6,-8,10,12,14,16,18,20
	max: .space 4
	min: .space 4
	pares: .space 4
	impares: .space 4
.text

	#Imprimimos texto1
	li $v0, 4
	la $a0, texto1
	syscall
	
	#Nueva linea
	li $v0, 4
	la $a0, newLine
	syscall 

	addi $t0, $zero, 0
	#Max = vector[0]
	lw $s0, vector($t0)
	#Min = vector[0]
	lw $s1, vector($t0)
	
	addi $s2, $zero, 0
	addi $s3, $zero, 0
	addi $s4, $zero, 2
		
while: 
	beq $t0, 40, exit
	
	lw $t6, vector($t0)
	
	addi $t0, $t0, 4
	
	#Imprimimos el vector
	li $v0, 1
	move $a0, $t6
	syscall
	
	#Nueva linea
	li $v0, 4
	la $a0, newLine
	syscall
	
IF:
	#Calculamos el mayor
	blt $t6, $s0, etiq
		move $s0, $t6 
etiq:
	#Calculamos el menor
	blt $s1, $t6, etiq2
		move $s1, $t6
	
etiq2:	
	#Calculamos pares e impares
	div $t6, $s4
	mfhi $s5
	beq $s5, $zero, par
		addi $s3, $s3, 1
		j while

par:
	addi $s2, $s2, 1
	
	j while
exit:

	#Guardamos los datos optenidos en memoria
	sw $s0, max($zero)
	sw $s1, min($zero)
	sw $s2, pares($zero)
	sw $s3, impares($zero)

	#Imprimimos el maximo
	li $v0, 4
	la $a0, texto2
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	
	#Imprimimnos una nueva linea
	li $v0, 4
	la $a0, newLine
	syscall
	
	#Imprimimos el minimo
	li $v0, 4
	la $a0, texto3
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	
	#Imprimimnos una nueva linea
	li $v0, 4
	la $a0, newLine
	syscall
	
	#Imprimimos los pares
	li $v0, 4
	la $a0, texto4
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	
	#Imprimimnos una nueva linea
	li $v0, 4
	la $a0, newLine
	syscall
	
	#Imprimimos los impares
	li $v0, 4
	la $a0, texto5
	syscall
	li $v0, 1
	move $a0, $s3
	syscall
	
	
	
	
	#Fin del programa
	 li $v0, 10
	 syscall
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 