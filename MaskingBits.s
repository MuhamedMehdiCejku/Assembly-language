.data
    prompt: .asciiz "Futni nje numer 8-bit (0-255): "  # Mesazh per perdoruesin
    mesazh: .asciiz "Rezultati: "  # Mesazh per te treguar rezultatin

.text
    .globl main

main:
    # Printo mesazhin per hyrjen e perdoruesit
    li $v0, 4
    la $a0, prompt
    syscall

    # Lexo numrin e dhene nga perdoruesi
    li $v0, 5
    syscall
    move $t0, $v0  # Ruaj numrin e hyrjes ne $t0

    # Masko me 0x0F (00001111) per te mbajtur vetem 4 bitet me te ulet
    andi $t0, $t0, 0x0F  # Operacioni AND per maskim

    # Printo mesazhin e rezultatit
    li $v0, 4
    la $a0, mesazh
    syscall

    # Printo rezultatin ne formatin decimal
    li $v0, 1
    move $a0, $t0  # Vendos rezultatin ne $a0
    syscall

    # Mbyll programin
    li $v0, 10
    syscall

# ---------------------------------------------------------------
# PERSHKRIM:
# Ky kod perdor operacionin AND per te maskuar (izoluar) 4 bitet e fundit
# te nje numri 8-bit dhe per te shfaqur rezultatin ne ekran.
#
# 1) SI KRIJOHET?
#    - Me `andi $t0, $t0, 0x0F` ku 0x0F (binari 00001111) maskon vetem
#      4 bitet me te ulet dhe pastron 4 bitet e larte.
#
# 2) SI ZEVENDESOHT?
#    - Mund te perdoret operacioni `shr` (shift to the right) per te
#      levizur bitet dhe per te arritur nje rezultat te ngjashem.
#
# 3) KU PERDORET?
#    - Ky operacion eshte i dobishem per filtrimin e te dhenave binare
#      dhe per analiza te avancuara te biteve, si dhe per maskimin
#      e pjeseve te caktuara te nje numri ne aplikacione te ndryshme.
# ---------------------------------------------------------------
