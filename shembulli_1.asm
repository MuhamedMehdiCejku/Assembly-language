ORG 0000H        ; Adresa fillestare e programit
BACK:   
    MOV A, #55H  ; Ngarko vleren 55H ne regjistrin A
    MOV P0, A    ; Dergo vleren ne Portin 0
    ACALL DELAY  ; Thirr funksionin e voneses

    MOV A, #0AAH ; Ngarko vleren AAH ne regjistrin A
    MOV P0, A    ; Dergo vleren ne Portin 0
    ACALL DELAY  ; Thirr perseri funksionin e voneses

    SJMP BACK    ; Kthehu ne fillim per te vazhduar pafund

; Nenprogrami i voneses
DELAY:  
    MOV R5, #0FFH  ; Vendos 255 ne regjistrin R5

HERE:  
    DJNZ R5, HERE  ; Zbret R5 dhe vazhdon derisa te jete zero

    RET            ; Kthehu nga thirrja e nenprogramit

END                ; Fundi i programit


; PERSHKRIM
; Ky program alternon vlerat 55H (01010101) dhe AAH (10101010) ne portin P0. Kjo krijon nje efekt ndezje/fikje ne pinat e portit me renditje alternuese. Pas seciles vlere thirret nje vonese per te ngadalesuar ndryshimin, duke e bere efektin e dukshem. Loop-i perseritet pafundesisht.