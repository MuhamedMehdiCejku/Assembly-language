MOV A, #0FFH 	;A=FF hex
			MOV P0, A		;make P0 an i/p port
						;by writing it all 1s
BACK: 	MOV A, P0 		;get data from P0
			MOV P1, A 		;send it to port 1
			SJMP BACK		;keep doing it


; PERSHKRIM
; Ky program ben kopjimin e vazhdueshem te te dhenave nga porti P0 ne portin P1. Fillimisht, P0 konfigurohet si hyrje duke vendosur 1 ne te gjithe bitet. Ne loop-in e pafund, lexon vleren aktuale nga P0 dhe e dergon ne P1. Ky program mund te perdoret per monitorimin e gjendjes se nje pajisjeje hyrse, si tastiere, switch-e, ose sensor, dhe shfaqjen e gjendjes ne portin P1.