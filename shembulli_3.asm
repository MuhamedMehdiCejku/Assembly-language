ORG 0000H          ; Adresa fillestare
    MOV A, #55H    ; Vlera fillestare: 01010101

BACK:
    MOV P1, A      ; Dergo vleren ne portin P1
    ACALL DELAY    ; Thirr vonesen
    CPL A          ; Komplemento A → ndrron nga 55H ne AAH dhe anasjelltas
    SJMP BACK      ; Kthehu ne fillim

DELAY:
    MOV R5, #0FFH  ; Vendos 255 ne R5
HERE:
    DJNZ R5, HERE  ; Zbret R5 dhe vazhdon derisa te jete zero
    RET            ; Kthehu nga subrutina

END


; PERSHKRIM
; Programi dergon vleren 55H dhe AAH me rradhe ne P1 duke i alternuar. Perdoret vonese per te pare ndryshimin. Komplementimi i A ndrron vleren ne cdo rreth