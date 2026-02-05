.data
result: .word 0      # Vend per te ruajtur rezultatin
hex_str: .asciiz "0x"  # Prefix per vleren hex

.text
.globl main

main:
    # Inicializo vlerat
    li $t0, 0x60      # A = 60H (fillimisht)
    li $t1, 0         # R0 = 0 (regjistri per mbartje)
    
    # Kontrollo nese A = 0, nese eshte e vertete, kaloni ne NEXT
    beqz $t0, NEXT

    # Rritni R0 nese A ≠ 0
    addi $t1, $t1, 1
    
AGAIN:
    # Shto dy here 1 ne A
    addi $t0, $t0, 1
    addi $t0, $t0, 1
    
NEXT:
    # Shto 50H ne A (60H + 50H = B0H)
    addi $t0, $t0, 0x50
    
    # Kontrollo nese ka ndodhur mbartje (CY)
    sltu $t2, $t0, 0x50
    beqz $t2, OVER
    
    # Nese ka mbartje, pastro A dhe vendos vlerat 0 per R0, R1, R2, R3
    li $t0, 0
    li $t1, 0
    li $t2, 0
    li $t3, 0
    
OVER:
    # Shto vleren e R3 (tani R3 = 0)
    add $t0, $t0, $t3
    
    # Kontrollo nese mbartja eshte e pranueshme, nese jo kthehu ne AGAIN
    sltu $t2, $t0, 0xFF
    beqz $t2, AGAIN
    
    # Pjesa finale (loop pa fund)
HERE:
    j HERE
    
    # Perfundon programi
    li $v0, 10
    syscall
	
	
	# PERSHKRIM:
	# Ky kod punon me vleren fillestare A=0x60.
	# Nese A≠0, rrit R0 me 1.
	# Pastaj rrit A dy here me 1.
	# Shton 0x50 ne A dhe kontrollon per mbartje.
	# Nese ka mbartje, pastron te gjithe regjistrat.
	# Shton R3 ne A (0 ne kete rast).
	# Nese rezultati kalon 0xFF, kthehet ne fillim.
	# Programi perfundon ne nje loop te pafund.