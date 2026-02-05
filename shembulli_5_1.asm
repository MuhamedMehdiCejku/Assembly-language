	ORG 0

BACK:   CPL P1.2         ; Komplemento (ndrysho) gjendjen e pin-it P1.2 te Portit 1
        ACALL DELAY      ; Thirrja e voneses
        SJMP BACK        ; Kthehu ne fillim per te vazhduar pafundesisht

; Nje version alternativ qe ndez dhe fik pinin P1.2 ne menyre te vazhdueshme
;AGAIN:  SETB P1.2       ; Vendos pinin P1.2 ne gjendje HIGH (ndizje)
;        ACALL DELAY
;        CLR P1.2        ; Vendos pinin P1.2 ne gjendje LOW (fikje)
;        ACALL DELAY
;        SJMP AGAIN

DELAY:  MOV R5, #255     ; Vonesa e thjeshte duke perdorur cikle
LOOP1:  MOV R4, #255
LOOP2:  DJNZ R4, LOOP2
        DJNZ R5, LOOP1
        RET

END                       ; Fundi i programit


; PERSHKRIM
; Programi komplementon (ndryshon) gjendjen e pinit P1.2 te Portit 1, duke e kaluar nga HIGH ne LOW dhe anasjelltas. Ky cikl vazhdon pafundesisht, duke u kthyer ne fillim pas cdo ndryshimi te gjendjes. Versioni alternativ i programit ndez dhe fik pinin P1.2 duke e vendosur ate ne HIGH (ndizje) dhe LOW (fikje) alternativisht.