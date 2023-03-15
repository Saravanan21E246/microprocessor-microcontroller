ORG 0000H
MOV P2,#0XFF; TURN OFF THE SEVEN SEG. DISPLAY
START:MOV P0,#0XF0; ROW AS INPUT WITH 1111 & COLUMN AS OUTPUT WITH 0000
L1:MOV A,P0; READ PORT 0
CJNE A,#0XF0,KEY_PRESSED; IF ANY KEY IS PRESSED (NOT = F0) GO TO KEY_PRESSED, ELSE GO TO NEXT LINE
SJMP L1
KEY_PRESSED:MOV 30H,A; STORE ROW INFORMATION TO 30H
MOV P0,#0X0F; COLUMN AS INPUT WITH 1111 & ROW AS OUTPUT WITH 0000
MOV A,P0; READ PORT 0
ORL A,30H
MOV 31H,A
MOV DPTR,#0100
REPEAT:CLR A
MOVC A,@A+DPTR
CJNE A,31H,NEXT_BYTE
SJMP DISPLAY
NEXT_BYTE:INC DPTR
SJMP REPEAT
ORG 0100H
DB 0X77,0X7B,0X7D,0X7E,0XB7,0XBB,0XBD,0XBE,0XD7,0XDB,0XDD,0XDE,0XE7,0XEB,0XED,0XEE

ORG 0120H
DB 0XF9,0XA4,0XB0,0X88,0X99,0X92,0X82,0X83,0XF8,0X80,0X90,0XC6,0X00,0XC0,0XFF,0XA1
END
