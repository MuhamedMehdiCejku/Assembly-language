ORG 0
		BACK: 	MOV A, #55H
			MOV P0, A
			MOV P1, A
			MOV P2, A
			ACALL QSDELAY		 ;Quarter of a second
			MOV A, #0AAH
			MOV P0, A
			MOV P1, A
			MOV P2, A
			ACALL QSDELAY
			SJMP BACK
	QSDELAY:
			MOV R5, #11
		H3:	 MOV R4, #248
		H2: 	MOV R3, #255
		H1:	DJNZ R3, H1			 ;4 MC for DS89C4x0
			DJNZ R4, H2
			DJNZ R5, H3
			RET
			END


; PERSHKRIM
; Ky program alternon ne menyre te vazhdueshme vlerat 55H dhe AAH ne portet P0, P1 dhe P2. Vlera 55H (01010101) dhe AAH (10101010) krijojne nje efekt alternues binary. Pasi secila vlere dergohet ne porte, thirret nje vonese e cila zgjat rreth 1/4 e sekondes. Ky model vazhdon pafundesisht duke alternuar vlerat ne porte dhe duke i dhene efekt vizual (nese jane LED te lidhur).