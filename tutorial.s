  PRESERVE8
  Thumb
  AREA test, CODE, READONLY, ALIGN=2
  ENTRY
  EXPORT main

main

	LDR R0, R1,#0xC
	MOV R1,#0x8
	ADD R2,R0,R1
	MOV R6,#0xd
S	B S
	END
