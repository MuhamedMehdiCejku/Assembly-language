.data
newline:    .asciiz "\n"

.text
.globl main

main:
BACK:
    li $a0, 0x33        # ngarko 0x33 ne $a0
    li $v0, 1           # syscall print integer
    syscall

    li $v0, 4           # syscall print string
    la $a0, newline
    syscall

    jal DELAY           # thirrje funksioni per vonese

    li $a0, 0xCC        # ngarko 0xCC ne $a0
    li $v0, 1           # syscall print integer
    syscall

    li $v0, 4           # syscall print string
    la $a0, newline
    syscall

    jal DELAY           # thirrje funksioni per vonese

    j BACK              # shko prap te BACK

# ---------------- Funksioni per vonese ----------------
DELAY:
    li $t1, 5000        # vendos nje numer te madh per vonese
AGAIN:
    addi $t1, $t1, -1   # zbresim 1
    bnez $t1, AGAIN     # nese $t1 nuk eshte zero, vazhdo ne AGAIN
    jr $ra              # kthehu tek funksioni therrites
	
	
	# PERSHKRIM:
	# Version me i permiresuar i: detyra_asm_7.s
	# Kryen te njejten pune si: detyra_asm_7.s, por printon vlerat ne konsole.
	# Gjithashtu shton rresht te ri pas cdo vlere.
	# Perdoret per te demonstruar nje sinjal oscilues ne konsole.