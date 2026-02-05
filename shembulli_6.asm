        ORG 0

HERE:   SETB P1.0        ; Vendos pinin P1.0 ne gjendje HIGH (1)
        LCALL DELAY      ; Thirr vonesen
        CLR P1.0         ; Vendos pinin P1.0 ne gjendje LOW (0)
        LCALL DELAY
        SJMP HERE        ; Kthehu ne fillim, vazhdo pafundesisht

DELAY:  MOV R5, #255     ; Vonesa me cikle te brendshme
LOOP1:  MOV R4, #255
LOOP2:  DJNZ R4, LOOP2
        DJNZ R5, LOOP1
        RET

        END              ; Fundi i programit


; PERSHKRIM
; Programi vendos pinin P1.0 ne gjendje HIGH (1), pastaj me vonese e vendos ate ne gjendje LOW (0). Ky cikl perseritet pafundesisht duke nderrur gjendjen e P1.0 midis HIGH dhe LOW.