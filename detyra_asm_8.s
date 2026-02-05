.data
newline:    .asciiz "\n"

.text
.globl main

main:
    li $t0, 0x77        # ngarko vleren fillestare 0x77 ne $t0

BACK:
    move $a0, $t0       # kopjo vleren ne $a0 per ta printuar
    li $v0, 1           # syscall print integer
    syscall

    li $v0, 4           # syscall print string (newline)
    la $a0, newline
    syscall

    jal DELAY           # thirrje funksioni per vonese

    nor $t0, $t0, $zero # bej komplementimin e t0 (bitwise NOR)
    j BACK              # kthehu te BACK (loop pa fund)

# ---------------- Funksioni per vonese ----------------
DELAY:
    li $t1, 5000        # vendos nje numer te madh per vonese
AGAIN:
    addi $t1, $t1, -1   # zbresim 1
    bnez $t1, AGAIN     # nese $t1 nuk eshte zero, vazhdo ne AGAIN
    jr $ra              # kthehu tek funksioni therrites
	
	
	# PERSHKRIM:
	# Ky kod krijon nje loop te pafund qe alternon midis 0x77 dhe komplementit te tij.
	# Per cdo vler printon ne konsole dhe therret funksionin e voneses.
	# Perdoret per te demonstruar nje sinjal oscilues ne konsole.
	# Komplementimi behet me instruksionin NOR.