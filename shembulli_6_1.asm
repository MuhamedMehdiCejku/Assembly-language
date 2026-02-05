        ORG 0

HERE:   CPL P1.0         ; Ndrysho gjendjen e pin-it P1.0 (nga 0 ne 1 ose anasjelltas)
        LCALL DELAY      ; Thirr vonesen
        SJMP HERE        ; Perserit pafundesisht

DELAY:  MOV R5, #255     ; Vonesa me dy cikle brenda
LOOP1:  MOV R4, #255
LOOP2:  DJNZ R4, LOOP2
        DJNZ R5, LOOP1
        RET

        END              ; Fundi i programit


; PERSHKRIM
; Programi ndryshon gjendjen e pin-it P1.0 nga 0 ne 1 dhe anasjelltas (puls) duke perdorur instrukcionin CPL. Pas cdo nderrimi, thirret nje vonese dhe ky cikel perseritet pafundesisht.