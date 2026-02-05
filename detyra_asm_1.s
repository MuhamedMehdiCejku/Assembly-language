    .data
result: .word 0      # Vend per te ruajtur rezultatin

    .text
    .globl main

main:
    # Inicializo ACC = 0, R2 = 10
    li $t0, 0          # ACC (t0) = 0
    li $t1, 10         # R2 = 10

AGAIN:
    # Shto 3 ne ACC
    addi $t0, $t0, 3   # ACC = ACC + 3 (t0 = t0 + 3)

    # Ul numeratorin R2 (t1) dhe bej kontroll
    addi $t1, $t1, -1  # R2 = R2 - 1 (t1 = t1 - 1)
    bnez $t1, AGAIN    # Perserit derisa R2 nuk eshte zero (t1 != 0)

    # Ruaj rezultatin ne memorie
    sw $t0, result     # Ruaj ACC (t0) ne variablin 'result'

    # Shtyp rezultatin
    li $v0, 1          # Kod per printimin e integer
    lw $a0, result     # Ngarko vleren nga 'result' ne $a0
    syscall            # Kryej thirrjen per printimin

    # Programi perfundon
    li $v0, 10         # Kod per dalje
    syscall
	
	
	# PERSHKRIM:
	# Ky kod implementon nje loop qe shton vleren 3 ne nje akumulator (ACC) 10 here.
	# Fillon me ACC=0 dhe R2=10.
	# Cdo iteracion shton 3 ne ACC dhe zvogelon R2 deri ne 0.
	# Rezultati perfundimtar (30) printohet ne konsole.