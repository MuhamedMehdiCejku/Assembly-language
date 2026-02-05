    ORG 0000H            ; Adresa fillestare

    MOV A, #0FFH         ; A = 0FFH (Te gjitha bitet janë 1)
    MOV P1, A            ; Konfiguro P1 si port hyres (duke shkruar 1 ne të gjitha pinat)

    MOV A, P1            ; Lexo te dhenat nga P1 (input)
    MOV R7, A            ; Ruaj te dhenat e para ne regjistrin R7

    ACALL DELAY          ; Prit nje periudhe te shkurter

    MOV A, P1            ; Lexo te dhenat e tjera nga P1 (input)
    MOV R5, A            ; Ruaj te dhenat e dyta ne regjistrin R5

    SJMP $               ; Loop i pafund per te mbajtur programin ne ekzekutim

; Subrutina për vonese
DELAY:
    MOV R2, #0FFH        ; Inicializo numeruesin per vonesen
DELAY_LOOP:
    DJNZ R2, DELAY_LOOP  ; Zbrit nga R2 dhe perserit derisa te behet zero
    RET                  ; Kthehu nga subrutina

END                     ; Fundi i programit


; PERSHKRIM
; Programi lexon dy here vleren nga porta P1 me nje vonese ne mes. Vlera e pare ruhet ne R7, e dyta ne R5. Pas leximeve, programi qendron ne loop te pafund.