    .data
result: .word 0      # Vend per te ruajtur rezultatin
hex_str: .asciiz "0x"  # Prefix per vleren hex

.text
.globl main

main:
    # Inicializo vlerat
    li $t0, 0x79      # A = 79H (fillimisht)
    li $t1, 0         # R5 = 0 (regjistri per mbartje)
    
    # Shto 40H ne A (79H + 40H = B9H)
    addiu $t0, $t0, 0x40   # A = 79H + 40H = B9H
    sltu $t2, $t0, $zero    # Kontrollo per mbartje (ne kete rast, CY=0)
    beqz $t2, N_1          # Nese CY=0, kalo ne N_1
    addi $t1, $t1, 1       # Inkremento R5 (R5 = 1)
    
N_1:
    # Shto E0H ne A (B9H + E0H = 199H, mbartje ka ndodhur)
    addiu $t3, $t0, 0xE0   # A = B9H + E0H = 199H
    andi $t0, $t3, 0xFF    # Mbaj vetem 8 bit te pare (99H)
    sltu $t2, $t3, $t0     # Kontrollo per mbartje
    beqz $t2, N_2          # Nese CY=0, kalo ne N_2
    addi $t1, $t1, 1       # Inkremento R5 (R5 = 2)
    
N_2:
    # Per te marre 68H (99H - 31H = 68H)
    addiu $t0, $t0, -0x31   # A = 99H - 31H = 68H
    
    # Ruaj rezultatin
    sw $t0, result
    
    # Shtyp prefixin "0x"
    li $v0, 4
    la $a0, hex_str
    syscall
    
    # Shtyp vleren ne hex (duke perdorur print integer)
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Programi perfundon
    li $v0, 10
    syscall
	
	
	# PERSHKRIM:
	# Ky kod kryen operacione aritmetike ne vleren fillestare 0x79.
	# Shton 0x40 (rezultati 0xB9), pastaj shton 0xE0 (rezultati 0x199 me mbartje).
	# Pastaj zbret 0x31 (rezultati 0x68).
	# Gjithashtu ruan mbartjet ne R5.
	# Printon rezultatin perfundimtar ne formatin "0x68".