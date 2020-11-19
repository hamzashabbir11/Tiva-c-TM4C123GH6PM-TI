;PRESERVE8;
	THUMB
	AREA	MyData,	DATA , READWRITE 
X 		SPACE 	2
data 	SPACE  	2
	AREA	Text ,	CODE , READONLY, ALIGN=2
	ENTRY
	EXPORT	__main

__main
	MOV R0 , #0x1234
	MOV R1 , #0x4567

	LDR R2 , =X      ; load store archtecture
	LDR R3 , =data
	STR R0 , [R2]
	STR R1 , [R3]
	LDR R1, =0x20000004
	STR R0,[R1]
STOP
	B STOP
	END