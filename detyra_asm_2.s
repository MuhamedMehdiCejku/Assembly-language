    .data
result: .word 0      # Vend per te ruajtur rezultatin

    .text
    .globl main

main:
    # Inicializo A = 55H, R3 = 10
    li $t0, 0x55       # A = 55H (t0 = 55H)
    li $t1, 10         # R3 = 10 (outer loop count)

NEXT:
    # Inicializo R2 = 70
    li $t2, 70         # R2 = 70 (inner loop count)

AGAIN:
    # Komplemento vleren e A
    not $t0, $t0       # Komplemento A (not t0)

    # Ul vleren e R2 dhe bej kontroll
    addi $t2, $t2, -1  # R2 = R2 - 1 (t2 = t2 - 1)
    bnez $t2, AGAIN    # Përsërit derisa R2 nuk eshte zero (t2 != 0)

    # Ul vleren e R3 dhe bej kontroll
    addi $t1, $t1, -1  # R3 = R3 - 1 (t1 = t1 - 1)
    bnez $t1, NEXT     # Perserit derisa R3 nuk eshte zero (t1 != 0)

    # Ruaj rezultatin ne memorie
    sw $t0, result     # Ruaj A (t0) ne variablin 'result'

    # Shtyp rezultatin
    li $v0, 1          # Kod per printimin e integer
    lw $a0, result     # Ngarko vleren nga 'result' ne $a0
    syscall            # Kryej thirrjen per printimin

    # Programi perfundon
    li $v0, 10         # Kod per dalje
    syscall
	
	
	# PERSHKRIM:
	# Ky kod demonstron nje loop te brendshem dhe te jashtem.
	# Fillon me A=0x55 dhe R3=10 (loop i jashtem).
	# Cdo iteracion i jashtem vendos R2=70 (loop i brendshem).
	# Loop-i i brendshem komplementon vleren e A dhe zvogelon R2 deri ne 0.
	# Loop-i i jashtem zvogelon R3 deri ne 0.
	# Rezultati perfundimtar (komplementi i A pas 10×70 komplementimesh) printohet.