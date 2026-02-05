        ORG 0               ; Fillimi i programit nga adresa 0

        SETB P1.0           ; Vendos P1.0 si hyrje (input)

AGAIN:  MOV C, P1.0         ; Lexo statusin e nderpreresit nga P1.0 ne flamurin e bartjes (Carry)
        MOV P2.7, C         ; Dergo vleren e flamurit te bartjes (C) ne P2.7 (LED)
        SJMP AGAIN          ; Vazhdo monitorimin pa nderprerje

        END                 ; Fundi i programit


; PERSHKRIM
; Programi lexon statusin e nje nderpreresi te lidhur ne P1.0 dhe e shfaq ate ne LED-in e lidhur ne P2.7. Nese nderpreresi eshte i shtypur (0), LED-i fiket; nese eshte i lire (1), LED-i ndizet.
