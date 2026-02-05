    .data
result: .word 0      # Vend per te ruajtur rezultatin

    .text
    .globl main

main:
    # Inicializo A = R0 (t0 = R0) dhe R1
    move $t0, $s0      # A = R0 (t0 = $s0)
    move $t1, $s1      # R1 = $s1 (t1 = $s1)

    # Kontrollo nese A = 0, dhe bej jump nese eshte e vertete
    beq $t0, $zero, OVER   # Nese A (t0) = 0, jump ne 'OVER'

    # Nese A nuk eshte 0, A merr vleren e R1
    move $t0, $t1          # A = R1 (t0 = t1)

    # Kontrollo nese A = 0, dhe bej jump nese eshte e vertete
    beq $t0, $zero, OVER   # Nese A (t0) = 0, jump ne 'OVER'

    # Vazhdon me kodin tjeter
    # (ne kete rast, nuk ka asnje kod tjeter per te ekzekutuar nese A nuk eshte 0)
    
OVER:
    # Vendos vleren 70 ne R2
    li $t2, 70             # R2 = 70
    sw $t2, result         # Ruaj rezultatin ne variablin 'result'

    # Printim ne konsole
    li $v0, 1              # Kod per printim (1 = print integer)
    move $a0, $t2          # Vlera qe do te printohet (R2 = 70)
    syscall                # Thirrje systemi per te shtypur ne konsole

    # Programi perfundon
    li $v0, 10             # Kod per dalje
    syscall
	
	
	# PERSHKRIM:
	# Ky kod kontrollon vlerat e regjistrave R0 dhe R1.
	# Nese R0=0, kalon direkt ne fund.
	# Nese R0≠0, vendos A=R1 dhe kontrollon perseri.
	# Nese R1=0, kalon ne fund.
	# Ne fund vendos R2=70 dhe e printon kete vlere.