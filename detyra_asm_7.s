.data

.text
.globl main

main:
BACK:
    li $t0, 0x33      # ngarko 0x33 ne $t0
    # ketu normalisht do dergonim ne port

    jal DELAY         # thirrje funksioni per vonese

    li $t0, 0xCC      # ngarko 0xCC ne $t0

    jal DELAY         # thirrje funksioni per vonese

    j BACK            # shko prap te BACK

# ---------------- Funksioni per vonese ----------------
DELAY:
    li $t1, 5000      # vendos nje numer te madh per vonese
AGAIN:
    addi $t1, $t1, -1 # zbresim 1
    bnez $t1, AGAIN   # nese $t1 nuk eshte zero, vazhdo ne AGAIN
    jr $ra            # kthehu tek funksioni therrites
	
	
	# PERSHKRIM:
	# Ky kod krijon nje loop te pafund qe alternon midis 0x33 dhe 0xCC.
	# Per cdo vler therret nje funksion vonese (DELAY).
	# Funksioni DELAY zbret nje numer te madh deri ne 0 per te krijuar vonese.
	# Normalisht keto vlera do dergoheshin ne nje port, por ketu vetem ruhen ne $t0.