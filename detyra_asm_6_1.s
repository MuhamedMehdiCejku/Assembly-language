.data
    output_msg: .asciiz "Vlera e A: 0x"
    newline: .asciiz "\n"
    counter: .word 0     # Numëruesi për rezultatet

.text
.globl main

main:
    # Inicializimi
    li $t1, 0           # R0 = 0
    li $t0, 0x55        # A = 55H
    sw $zero, counter   # Reset numëruesin

    jal print_hex       # Shfaq vlerën fillestare (55H)

    beqz $t0, next      # Nëse A=0, kalo te next
    addi $t1, $t1, 1    # R0++ nëse A≠0

    addi $t0, $t0, 1    # A++ (57H)
    addi $t0, $t0, 1    
    jal print_hex       # Shfaq vlerën e dytë (57H)

next:
    addi $t0, $t0, 0x77 # Shto 77H (CEH)
    jal print_hex       # Shfaq vlerën e tretë (CEH)

    # Mbyllje e programit
    li $v0, 10         # Syscall për dalje
    syscall

# Funksioni për të shfaqur vlerën hex
print_hex:
    addi $sp, $sp, -12
    sw $a0, 0($sp)
    sw $v0, 4($sp)
    sw $t0, 8($sp)

    # Kontrollo nëse kemi shfaqur më shumë se 3 rezultate
    lw $t3, counter
    addi $t3, $t3, 1
    sw $t3, counter
    bgt $t3, 3, skip_print

    li $v0, 4
    la $a0, output_msg
    syscall

    # Shifra e parë (4 bit të parë)
    srl $a0, $t0, 4
    andi $a0, $a0, 0xF
    li $v0, 1
    syscall

    # Shifra e dytë (4 bit të fundit)
    andi $a0, $t0, 0xF
    syscall

    li $v0, 4
    la $a0, newline
    syscall

skip_print:
    lw $t0, 8($sp)
    lw $v0, 4($sp)
    lw $a0, 0($sp)
    addi $sp, $sp, 12
    jr $ra
	
	
	# PERSHKRIM:
	# Version me i permiresuar i: detyra_asm_6.s
	# Fillon me A=0x55 dhe R0=0.
	# Nese A≠0, rrit R0 me 1.
	# Rrit A dy here me 1 (0x57).
	# Shton 0x77 ne A (0xCE).
	# Printon cdo hap ne formatin hex "Vlera e A: 0xXX".
	# Kufizon printimet ne 3 rezultate.