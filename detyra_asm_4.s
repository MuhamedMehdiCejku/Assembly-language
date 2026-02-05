    .data
result: .word 0      # Vend per te ruajtur rezultatin

    .text
    .globl main

main:
    # Inicializo vlerat
    move $t0, $s0      # Perdorim $t0 per te mbajtur vleren e R5 (t0 = $s0)
    
    # Kontrollo nese R5 (t0) eshte zero
    beq $t0, $zero, SET55   # Nese A (t0) eshte 0, bej jump ne 'SET55'
    
    # Vazhdon nese R5 nuk eshte zero
    j NEXT               # Vazhdon ne etiketen NEXT

SET55:
    # Nese R5 eshte zero, vendos 55H ne R5 (t0)
    li $t0, 0x55        # Ngarko vleren 55H ne $t0 (t0 = 55H)
    
NEXT:
    # Vendos vleren 50 ne R2
    li $t2, 50          # R2 = 50
    sw $t2, result      # Ruaj vleren e R2 ne memorje (ne variablin 'result')

    # Printim ne konsole
    li $v0, 1           # Kod per printim integer (1 = print integer)
    move $a0, $t2       # Vlera qe do te printohet (R2 = 50)
    syscall             # Thirrje sistemi per te shtypur ne konsole

    # Programi perfundon
    li $v0, 10          # Kod per dalje nga programi
    syscall
	
	
	# PERSHKRIM:
	# Ky kod kontrollon nese R5 eshte zero.
	# Nese R5=0, vendos vleren 0x55 ne R5.
	# Ne fund vendos R2=50 dhe e printon kete vlere.
	# Nese R5≠0, kalon direkt ne vendosjen e R2=50.