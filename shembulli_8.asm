        ORG 0               ; Fillimi i programit nga adresa 0

        SETB P1.7           ; Vendos P1.7 si hyrje (input)

AGAIN:  MOV C, P1.7         ; Lexo statusin e P1.7 ne flamurin e bartjes (Carry)
        JC OVER             ; Nese SW=1 (pra CF=1), shko te OVER
        MOV P2, #'N'        ; SW=0, dergo shkronjen 'N' ne portin P2
        SJMP AGAIN          ; Vazhdo monitorimin

OVER:   MOV P2, #'Y'        ; SW=1, dergo shkronjen 'Y' ne portin P2
        SJMP AGAIN          ; Vazhdo monitorimin

        END                 ; Fundi i programit


; PERSHKRIM
; Programi kontrollon gjendjen e nderpreresit ne P1.7 dhe shfaq ne P2 shkronjen 'N' nese ai eshte i shtypur (0), ose 'Y' nese ai eshte i lire (1). Vlera lexohet permes flamurit te bartjes (Carry flag).
