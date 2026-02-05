.data
    prompt1:    .asciiz "Jep numrin e pare: "
    prompt2:    .asciiz "Jep numrin e dyte: "
    promptOp:   .asciiz "Zgjedh operacionin (+, -, *, /): "
    resText:    .asciiz "Rezultati: "
    newline:    .asciiz "\n"

.text
.globl main
main:

    # --- Input: Numri i pare ---
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5       # Lexon integer
    syscall
    move $t0, $v0   # $t0 = numri i pare

    # --- Input: Numri i dyte ---
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0   # $t1 = numri i dyte

    # --- Input: Operacioni ---
    li $v0, 4
    la $a0, promptOp
    syscall

    li $v0, 12      # Lexon 1 karakter (operacioni)
    syscall
    move $t2, $v0   # $t2 = karakteri (+, -, *, /)

    # --- Printo newline mbas operacionit, me shfaq rezultatin ne rresht tjeter ---
    li $v0, 4
    la $a0, newline
    syscall

    # --- Kontrollo Operacionin ---
    li $t3, 43      # ASCII i '+'
    beq $t2, $t3, do_add

    li $t3, 45      # ASCII i '-'
    beq $t2, $t3, do_sub

    li $t3, 42      # ASCII i '*'
    beq $t2, $t3, do_mul

    li $t3, 47      # ASCII i '/'
    beq $t2, $t3, do_div

    j end_program   # Nese s'eshte asnjana, perfundo programin

# --- Mbledhja ---
do_add:
    add $t4, $t0, $t1   # $t4 = $t0 + $t1
    j print_result

# --- Zbritja ---
do_sub:
    sub $t4, $t0, $t1   # $t4 = $t0 - $t1
    j print_result

# --- Shumezimi ---
do_mul:
    mul $t4, $t0, $t1   # $t4 = $t0 * $t1
    j print_result

# --- Pjestimi ---
do_div:
    beqz $t1, end_program   # Nese $t1 eshte zero, mos bo pjestim
    div $t0, $t1
    mflo $t4                # $t4 = rezultati i pjestimit
    j print_result

# --- Printimi i rezultatit ---
print_result:
    li $v0, 4
    la $a0, resText
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, newline
    syscall

end_program:
    li $v0, 10      # Mbyll programin
    syscall

# ------------------------------------------------------
# Ky program asht nje kalkulator i thjeshte ne QtSpim.
# 1. Useri jep dy numra dhe zgjedh operacionin: +, -, * ose /.
# 2. Programi i llogarit ne baze te operacionit dhe e shfaq rezultatin ne rresht tjeter.
# 3. Perdoret per me msu bazat e input/output, karaktere dhe aritmetike ne MIPS.
