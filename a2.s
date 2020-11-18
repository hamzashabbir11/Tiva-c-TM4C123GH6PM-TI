;PRESERVE8;
	THUMB
	AREA	MyData,	DATA , READWRITE 
X SPACE 4
Y SPACE 4
	
	AREA	Text ,	CODE , READONLY, ALIGN=4
	ENTRY
	EXPORT	__main

__main
  ; mov r0,#0x0020
   ;movt r0,#0x2000
                                                                                                                       
   ;ldr r1,=0xDEADBEEF
   ;str r1,[r0]
   ;ldr r1,=0x012345678
   ;str r1,[r0, #0x4]!
   ;ldr r1,=0x00001111
   ;str r1,[r0, #0x4]!
   ;ldr r1,=0xaaaabbbb
   ;str r1,[r0, #0x4]!
   ;ldr r1,=0xccccdddd
   ;str r1,[r0, #0x4]!
   ;ldr r1,=0xeeee7777
   ;str r1,[r0, #0x4]!
   ;mov r0,#0x0020
   ;movt r0,#0x2000
   ;LDMIA r0,{r4,r5,r6,r7,r10,r11}
   ;ADCS r10,r11
   ;ADDW r10,r11,#-2
   ;RSBS r10,r11,#-1
   ;MLS r10,r10,r4,r10
   ;UMLAL r10,r11,r10,r11
   ;ASR r10,#12
   ;LSRS r10 ,#12
   ;ADD r6,#4
   ;subs r6,#4
   mov r0,#0
   mov r1,#10
   mov r2,#5
   TBB [PC, r0]
branchtable
        DCB ((dest0-branchtable)/2)
		DCB ((dest1-branchtable)/2)
		DCB ((dest2-branchtable)/2)
		DCB ((dest3-branchtable)/2)
		DCB ((dest4-branchtable)/2)
		
dest0
 
            ADD r5,r1,r2
			END
   
dest1
            SUB r6,r1,r2
            END
dest2    
            MUL r7,r1,r2
			END
				
dest3  

            UDIV r8,r1,r2
			END
dest4
            BL power
			MOV R4,R1
			END
power       
            subs r2,#1
			mul r1,r1
			bgt power
			bx lr 
			END
			
   
  
   ;STMIA r0!,{r4-r7,r10-r11}
   ;mov r10,#0xdddd
  ;movt r10,#0xcccc
  ; mov r11,#0x7777
   ;movt r11,#0xeeee
  ; addw.w r5,r11,#0xffff
   ;ldmia r3!, {r0-r2}
   
STOP
	B STOP
	END