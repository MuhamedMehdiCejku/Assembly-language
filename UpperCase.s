.data
    mesazhi: .asciiz "Shkruaj emrin: "      # Mesazhi i paraqitjes
    emri: .space 100                        # Hapsira per emrin

.text
.globl main

main:
    li $v0, 4                               # Printo mesazhin
    la $a0, mesazhi
    syscall

    li $v0, 8                               # Lexo input nga perdoruesi
    la $a0, emri
    li $a1, 100                             # Maksimumi i karaktereve
    syscall

    li $t0, 0                               # Inicijalizo indeksin
    la $t1, emri                            # Merr adresen e emrit

    loop:
        lb $t2, 0($t1)                      # Lexo karakterin nga emri
        beqz $t2, end_loop                  # Nese arrin ne fund, dil nga loopi
        
        li $t3, 0xDF                        # Masko me 11011111 (pastrimi i bitit 5)
        and $t4, $t2, $t3                   # AND logjik per te konvertuar ne shkronje te madhe

        li $v0, 11                          # syscall per te printuar karakterin
        move $a0, $t4
        syscall

        addi $t1, $t1, 1                    # Shko ne karakterin e ardhshëm
        j loop

    end_loop:
        li $v0, 10                          # Perfundo programin
        syscall

# ---------------------------------------------------------------
# PERSHKRIM:
# Ky kod merr emrin nga perdoruesi dhe perdor instruksionin logjik AND
# per te konvertuar çdo shkronje te vogel ne nje shkronje te madhe 
# duke pastruar bitin 5 te ASCII.
#
# 1) SI KRIJOHET?
#    - Me `and $t4, $t2, 0xDF` per te pastruar bitin e 5-te dhe per te konvertuar shkronjen.
#
# 2) SI ZEVENDESOHT?
#    - Ky funksion mund te zevendesohet gjithashtu me nje metode si `subi $t4, $t2, 32`.
#
# 3) KU PERDORET?
#    - Ky kod perdoret per standardizimin e shkronjave ne tekstet e emrave dhe informacionit
#      qe mund te jepen nga perdoruesi.
# ---------------------------------------------------------------
