.data
num:    .word 0       # Vlera e hyre nga perdoruesi
textOdd:  .asciiz "Numri asht tek\n"
textEven: .asciiz "Numri asht qift\n"
prompt:   .asciiz "Shkruaj nje numer: "

.text
.globl main

main:
    li $v0, 4                  # syscall 4 - print_str
    la $a0, prompt             # printo mesazhin per input
    syscall

    li $v0, 5                  # syscall 5 - lexon integer
    syscall
    sw $v0, num                # e ruan vleren ne memorie

    lw $t0, num                # e merr numrin nga memoria
    andi $t1, $t0, 1           # kontrollo bitin e fundit per tek/qift

    beq $t1, $zero, even       # nese biti 0, numri asht qift
    li $v0, 4
    la $a0, textOdd            # perndryshe asht tek
    syscall
    j exit

even:
    li $v0, 4
    la $a0, textEven
    syscall

exit:
    li $v0, 10                 # perfundon programin
    syscall


# ---------------------------------------------------------------
# PERSHKRIM:
# Ky kod lexon nje numer nga perdoruesi dhe perdor operacionin logjik AND
# per me kontrollu nese numri asht tek apo qift. Ai kontrollon bitin e fundit
# (LSB) te numrit: nese asht 1, numri asht tek; nese asht 0, numri asht qift.
#
# 1) SI KRIJOHET?
#    - Me `andi $t1, $t0, 1` ku numri 1 ne binar (00000001) kontrollon vetem
#      bitin e fundit te numrit. Kjo na lejon me kuptu nese numri asht tek (1) apo qift (0).
#
# 2) SI ZEVENDESOHT?
#    - Mund te zevendesohet me `rem` (modulus), p.sh. `rem $t1, $t0, 2`,
#      por operacioni AND asht ma i shpejte dhe ma efikas ne sistemet low-level.
#
# 3) KU PERDORET?
#    - Perdoret ne algoritma qe varen nga vetite tek/qift, qysh jane
#      iterimet selektive, kodimi binar, filtrimi i te dhanave apo edhe ne lojera
#      per llogjik vendimesh te shpejta ne lidhje me numrat.
# ---------------------------------------------------------------

