        ORG 0              ; Fillimi i programit nga adresa 0

        SETB P1.2          ; Konfiguro P1.2 si hyrje (input)
        MOV A, #45H        ; Vendos vleren 45H ne regjistrin A

AGAIN:  JNB P1.2, AGAIN    ; Qendro ne loop derisa P1.2 te behet 1
        MOV P0, A          ; Dergo vleren 45H ne portin P0
        SETB P2.3          ; Vendos P2.3 ne high
        CLR P2.3           ; Pastaj menjehere ne low (pulse H -> L)

        END                ; Fundi i programit


; PERSHKRIM
; Programi pret derisa bit-i P1.2 te behet 1. Pasi kjo ndodh, dergon vleren 45H ne portin P0 dhe gjeneron nje pulsi H-ne-L ne pinin P2.3 per sinjalizim.