        ORG 0               ; Fillimi i programit nga adresa 0

        MOV P1, #55H        ; P1=01010101

AGAIN:  XRL P1, #0FFH      ; EX-OR P1 with 11111111
        ACALL DELAY         ; Shto vonesen per te pare ndryshimet
        SJMP AGAIN          ; Vazhdo perseritjen e operacionit

DELAY:  MOV R5, #0FFH       ; Vlera e counter për vonese
DELAY_LOOP:
        DJNZ R5, DELAY_LOOP  ; Rregulloni numrin e cikleve per vonese
        RET                  ; Kthehu nga subrutina

        END                 ; Fundi i programit


; PERSHKRIM
; Programi alternon vlerat e portit P1 midis 55H dhe AAH ne menyre te vazhdueshme, duke perdorur tekniken Read-Modify-Write me operacionin EX-OR. Vonesa lejon qe ndryshimet te jene te dukshme.