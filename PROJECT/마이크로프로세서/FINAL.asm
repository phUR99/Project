;뱀오락

;공통
	ORG 	8000H
DATAOUT	EQU 	0FFF0H ;데이터 아웃의 주소
DATAIN 	EQU 	0FFF1H ;데이터 인의 주소

;segment
SEG1	EQU 	0FFC1H
SEG2	EQU 	0FFC2H
SEG3	EQU 	0FFC3H

SCORE	EQU	29H ;score
MOV	SCORE,#00H ;초기화 score

;DOT-MATRIX
COLGREEN   	EQU 0FFC5H
COLRED      	EQU 0FFC6H
ROW      	EQU 0FFC7H

SROW      	EQU 30H      ;SNAKE의 ROW 
SCOL      	EQU 31H      ;SNAKE의 COL
FROW      	EQU 32H      ;먹이의 ROW
FCOL      	EQU 33H      ;먹이의 COL

;뱀위치 초기치
MOV	SROW,#00010000B	
MOV	SCOL,#00010000B

CALL	DOTCOLG 	;뱀 출력

;LCD 표시
LCDWIR	EQU 	0FFE0H 	;LCD IR WRITE
LCDWDR	EQU 	0FFE1H 	;LCD DR WRITE
LCDRIR 	EQU 	0FFE2H 	;LCD IR READ
LCDRDR 	EQU	0FFE3H 	;LCD DR READ

;variable
INST 	EQU 	20H 	;LCD INST 값 보관
DATA 	EQU 	21H 	;LCD DATA 값 보관
LROW 	EQU 	22H 	;ROW 값 
LCOL 	EQU 	23H 	;COL 값
NUMFONT EQU 	24H 	;MESSAGE 값 보관
FDPL	EQU 	25H 	;DPL 값 보관
FDPH	EQU 	26H	;DPH 값 보관

CLEAR 	EQU 	01H	;CLEAR 명령 
CUR_HOME EQU 	02H	;CURSOR HOME 위치로 변경
ENTRY2 	EQU 	06H 	;ADDR +1, CURSOR OR BLINK를 우로 이동
DCB6 	EQU 	0EH	;표시, 커서, 블링크
FUN5 	EQU 	38H	;0비트 2행

LINE_1	EQU 	80H 	;LCD 1번째 줄로 이동
LINE_2	EQU 	0C0H 	;LCD 2번째 줄로 이동

KEY_STATE	EQU	27H ;키 상태의 보관

;게임 상태

MOV	R6,#00H 	;R6 초기화	
GAME_PHASE	EQU 36H ;GAME PHASE 값 보관
MOV	GAME_PHASE,#00H ;GAME_PHASE 초기화

MOV	R7,#00H		;R7 초기화
GAME_PAUSE	EQU 35H ;GAME PAUSE 값 보관
MOV	GAME_PAUSE,#00H ;GAME_PAUSE 초기화
	
TIME	EQU	28H	;시간 값 보관
MOV	TIME,#00H	;시간 초기화

LIFE	EQU	34H	;목숨값 보관
MOV	LIFE,#03H	;목숨 값 초기화(3개)


MOV	P1,#11111000B	;port diode 초기설정

;lcd 초기화
LCD_INIT:
	MOV 	INST, #FUN5	;#FUN5 를 INST에 할당
	CALL 	INSTWR		;LCD 출력


	MOV 	INST, #DCB6	;#DCB6 를 INST에 할당
	CALL 	INSTWR		;LCD 출력


	MOV 	INST, #CLEAR	;#CLEAR 를 INST에 할당
	CALL 	INSTWR		;LCD 출력


	MOV 	INST, #ENTRY2	;#ENTRY2 를 INST에 할당
	CALL 	INSTWR		;LCD 출력


;타이머 초기화
	MOV TMOD,#00000001B	;GATE=0,TIMER MODE,RUN MODE 01
	MOV 	IE,#10000011B   ; 인터럽트0 이랑 타이머0 인터럽트 활성화
	MOV	TH0,#00011111B  ; 57600 cycle * 16 = 1second
	MOV 	TL0,#00H	;

;interrupt setting
MOV   	IP, #00000001B 		; 인터럽트0 우선순위 높게
SETB     IT0 			; interrupt 0의 감지 모드 설정: dedge trigger

;초기화면----------------------------------------------------------------------
MAINSCREEN0:
	MOV 	R0 , #02H	;R0 값 할당

MAINSCREEN:
	DEC 	R0		;R0 값 감소
	MOV 	LROW,#01H	;ROW 값 할당
	MOV 	LCOL, R0	;COL 값 할당
	CALL 	CUR_MOV		;CURSOR 값 변경

	MOV 	DPTR,#MESSAGE1	;#MESSAGE1 할당
	MOV 	FDPL, DPL	;DPL값 할당
	MOV 	FDPH, DPH	;DPH값 할당
	MOV 	NUMFONT, #0EH	;MESSAGE값 보관
	CALL 	DISFONT		;LCD에 MESSAGE 출력

	CALL	FINDKEYCODE	;KEYPAD 입력을 체크

	MOV 	LROW, #02H	;ROW 값 할당
	MOV 	LCOL, R0	;COL 값 할당
	CALL 	CUR_MOV		;CURSOR 값 변경

	MOV 	DPTR, #MESSAGE2	;#MESSAGE2 할당
	MOV	FDPL, DPL	;DPL값 할당
	MOV 	FDPH, DPH	;DPH값 할당
	MOV 	NUMFONT, #0EH	;MESSAGE값 보관
	CALL 	DISFONT		;LCD에 MESSAGE 출력


	CJNE 	R0, #00H, MAINSCREEN1	;R0값을 체크해서 MAINSCREEN1으로 점프
	MOV 	R0, #14H		;R0 값 할당

MAINSCREEN1:
	CALL 	DELAY		;정해진 시간만큼 지연
	MOV 	INST,#CLEAR	;#CLEAR값을 INST에 할당
	CALL 	INSTWR		;LCD 초기화
	CALL	FINDKEYCODE	;입력 체크
	CALL	START_PRESS	;입력 받으면 탈출
	JMP 	MAINSCREEN	;점프

START_PRESS:  	CJNE   A, #0FFH, START_PRESS1 ;아무거나 누르면 탈출
		RET

START_PRESS1:  	MOV	KEY_STATE,A	;입력 여부 할당	
		JMP	MAIN		;MAIN 실행

NO_KEY:   	RET			;입력X 반복

;메인---------------------------------------------------------

MAIN:	SETB	TCON.TR0	;타이머 실행
	MOV	P1,#11111000B	;목숨 초기
	CALL	FOOD_GENERATE 	;초기먹이위치 생산
	MOV	A,SCORE		;점수 초기
	DA	A		;
	CALL	DISSEC		;SEGMENT 초기화
MAINLOOP:
	MOV	R3,#08H		;반복횟수 초기화
	
DELAY7:
	CALL	DOTCOLR_CLEAR	;뱀 초기화 
	CALL	DOTCOLG		;뱀표시
	CALL	DELAY4		;정해진 시간만큼 지연
	CALL	FINDKEYCODE	;중간중간 키 입력확인
	CALL	IF_INT0		;INT0 CHECK
	CALL	DOTCOLG_CLEAR	;뱀 초기화
	CALL	DOTCOLR		;먹이표시
	CALL	DELAY4		;정해진 시간만큼 지연	
	CALL	FINDKEYCODE	;입력 체크
	DJNZ	R3,DELAY7	;8회반복

	CALL	MOVE		;이동
	CALL	FOOD_CHECK	;먹이 먹었는지확인
	JMP	MAINLOOP	;반복

;INT0에 의해서 INTERRUPT 되었을 때 사용하는 서브루틴
IF_INT0:
	MOV	A,GAME_PAUSE	;인터럽트 여부 체크
	CJNE	A,#00H,WAIT	;인터럽트 재입력 전까지 계속 유지
	RET		

WAIT:	JMP	IF_INT0		;인터럽트 재입력 전까지 계속 유지
;**********************************************
;LCD관련
;CURSOR값 변경
CUR_MOV:
	MOV 	A, LROW		;ROW 값 할당
	CJNE 	A, #01H, NEXT	;ROW 값 체크
	MOV 	A,#LINE_1	;주소 할당
	ADD 	A, LCOL		;주소 + COL값 
	MOV 	INST,A		;주소 INST값 할당
	CALL 	INSTWR		;주소의 값 출력
	JMP 	RET_PT		;RETURN
NEXT:
	CJNE 	A,#02H, RET_PT	;값 CHECK
	MOV 	A, #LINE_2	;주소 할당
	ADD 	A, LCOL		;주소 + COL값 
	MOV 	INST ,A		;주소 INST값 할당
	CALL 	INSTWR		;주소의 값 출력


RET_PT:				;RETURN
	RET		



DISFONT: 
	MOV 	R5, #00H	;R5값 초기화
	MOV 	R6, LCOL	;COL값 할당

FLOOP: 
	MOV 	DPL, FDPL 	;저장했던 DPL값 할당
	MOV 	DPH, FDPH	;저장했던 DPH값 할당
	MOV 	A, R5		;R5값 A에 할당
	MOVC 	A,@A+DPTR	;DIODE의 주소 할당
	MOV 	DATA, A		;주소를 DATA에 할당
	CALL 	DATAWR		;DATA 출력
	INC 	R5		;R5+
	INC 	R6		;R6+
	CJNE 	R6,#14H,DISFONT1	;R6값 끝인지 CHECK
	MOV 	R6,#00H			;R6값 끝인지 CHECK
	MOV 	LCOL, R6		;COL값 할당
	CALL 	CUR_MOV			;CURSOR 변경
DISFONT1: 
	MOV 	A, R5			;R5 할당
	CJNE 	A,NUMFONT,FLOOP		;NUMFONT 비교
	RET				;RET
;흘러간 시간 표기
;****************************************
;100A+10B+C의 형식으로 10진수 형태로 SEGMENT에 출력함
DISFONT_GAMETIME:
   		MOV   	A, TIME		;시간 A 할당
   		MOV   	B, #100		;나눌 B 할당
   		DIV   	AB		;A/B (A몫, B나머지)
   		MOV     DPL, FDPL	;저장했던 DPL값 할당
   		MOV     DPH, FDPH	;저장했던 DPH값 할당
   		MOVC    A, @A+DPTR	;DIODE의 주소에 값 할당
   		MOV     DATA, A		;주소를 DATA에 할당
   		CALL    DATAWR		;DATA 출력

   		MOV   	A, B		;B SHIFT A
   		MOV   	B, #10		;B에 10할당
   		DIV   	AB		;A/B (A몫, B나머지)
   		MOV     DPL, FDPL	;저장했던 DPL값 할당
   		MOV     DPH, FDPH	;저장했던 DPH값 할당
   		MOVC   	A, @A+DPTR	;DIODE의 주소에 값 할당	
   		MOV   	DATA, A		;주소를 DATA에 할당
   		CALL    DATAWR		;DATA 출력

   		MOV   	A, B		;B SHIFT A
   		MOV   	B, #10		;B에 10할당
   		DIV   	AB		;A/B (A몫, B나머지)
   		MOV   	A, B		;B SHIFT A
   		MOV     DPL, FDPL	;저장했던 DPL값 할당
   		MOV     DPH, FDPH	;저장했던 DPH값 할당
   		MOVC   	A, @A+DPTR	;DIODE의 주소에 값 할당
   		MOV   	DATA, A		;주소를 DATA에 할당
   		CALL   	DATAWR		;DATA 출력
   		RET        		;RET
;*********************************************************
;CURSOR의 초기화
SET_CUR_ZERO: 
	MOV 	LCOL, #00H		;COL 초기화
	JMP	CUR_MOV			;CURSOR 변경
	RET				;RET



INSTWR : 
	CALL 	INSTRD			;INST를 읽어들임
	MOV 	DPTR,#LCDWIR		;주소 할당
	MOV 	A,INST			;값 복사
	MOVX 	@DPTR ,A		;값 할당
	RET


DATAWR: 
	CALL 	INSTRD			;읽어들임
	MOV 	DPTR,#LCDWDR		;주소 할당
	MOV 	A,DATA			;값 복사
	MOVX 	@DPTR, A		;값 할당
	RET


INSTRD:
	MOV 	DPTR, #LCDRIR		;주소 할당
	MOVX 	A, @DPTR		;값 할당
	JB 	ACC.7, INSTRD		
	RET
;**************************************
;DELAY 관련

;정해진 시간만큼 지연
DELAY: MOV 	R3, #05H
DELAY1: MOV 	R2, #0FFH
DELAY2: MOV 	R1, #0FFH
DELAY3:	DJNZ 	R1, DELAY3
	DJNZ 	R2,DELAY2
	DJNZ 	R3,DELAY1
	RET

;정해진 시간만큼 지연
DELAY4: MOV 	R2, #070H
DELAY5: MOV 	R1, #0FFH
DELAY6:	DJNZ 	R1, DELAY6
	DJNZ 	R2,DELAY5
	RET
 
;***************************************

MESSAGE1:
	DB 	'p','r','e','s','s'
	DB 	' ','A','n','y',' '
	DB 	'K','e','y',' '

MESSAGE2:
	DB 	't','o',' ','S','t'
	DB 	'a','r','t','!',' '
	DB 	' ',' ',' ',' '

MESSAGE_pause:
	DB 	'P','a','u','s','e'
	DB 	' ',' ',' ',' ',' '
	DB 	' ',' ',' ',' '
MESSAGE_over:
	DB 	'G','a','m','e',' '
	DB 	'O','v','e','r',' '
	DB 	' ',' ',' ',' '
NUMBER:   
   	DB '0','1','2','3','4'
   	DB '5','6','7','8','9'

MESSAGE_EMPTY:
	DB 	' ',' ',' ',' ',' '
	DB 	' ',' ',' ',' ',' '
	DB 	' ',' ',' ',' '
;**********************************************
;입력 체크
FINDKEYCODE: 
		PUSH PSW
		SETB PSW.4
		SETB PSW.3

INITIAL: 	MOV R1, #00H		;초기화
		MOV A, #11101111B	;초기 위치 설정
		SETB C			;CARRY 1

COLSCAN:	MOV R0, A		;A값 복사
		INC R1			;R1+
		CALL SUBKEY		:DATAOUT/DATAIN 변경

		CJNE A,#0FFH,RSCAN	;끝에 있는지 체크

		MOV A,R0		;R0 값 복사
		SETB C			;CARRY 1
		RRC A			;ROTATE A
		JNC RETURN	
		JMP COLSCAN		;RET

RSCAN:		MOV R2,#00H		;R2 초기화

ROWSCAN:	RRC A			;ROTATE A
		JNC MATRIX
		INC R2			;R2+
		JMP ROWSCAN		;RET

MATRIX:	MOV 	A,R2			;R2 값 복사
	MOV 	B,#05H			;B 값 할당
	MUL 	AB			;A*B
	ADD 	A,R1			;A+R1
	CALL 	INDEX			;
	CALL	PRESS4			;
	POP 	PSW			;
	RET
;
SUBKEY:	MOV DPTR,#DATAOUT		;DATAOUT 주소 할당
	MOVX @DPTR,A			;A 값 할당
	MOV DPTR, #DATAIN		;DATAIN 주소 할당
	MOVX A,@DPTR			;A 값 할당
	RET

RETURN: POP PSW
	RET

;함수키 정의
RWKEY	EQU	10H
COMMA	EQU	11H
PERIOD	EQU	12H
GO	EQU	13H
REG	EQU	14H
CD	EQU	15H
INCR	EQU	16H
ST	EQU	17H
RST	EQU	18H

INDEX:	MOVC A,@A+PC
	RET

KEYBASE:	DB ST
		DB INCR		
		DB CD
		DB REG
		DB GO
		DB 0CH
		DB 0DH
		DB 0EH
		DB 0FH
		DB COMMA
		DB 08H	
		DB 09H
		DB 0AH
		DB 0BH		
		DB PERIOD
		DB 04H
		DB 05H		
		DB 06H
		DB 07H
		DB RWKEY		
		DB 00H
		DB 01H
		DB 02H		
		DB 03H
		DB RST
;--------------------------------------------------------------------
;키체크
PRESS4:   	CJNE   A, #04H, PRESS5   ; 입력값이 4(좌측)인지 확인
   		MOV    KEY_STATE, A	;KEY STATE 변경
   		RET

PRESS5:   	CJNE   A, #05H, PRESS6   ; 입력값이 5(아래)인지 확인
   		MOV    KEY_STATE, A	;KEY STATE 변경
   		RET

PRESS6:   	CJNE   A, #06H, PRESS9   ; 입력값이 6(우측)인지 확인
   		MOV    KEY_STATE, A	;KEY STATE 변경
   		RET	

PRESS9:   	CJNE   A, #09H, NOTPRESS   ; 입력값이 9(위)인지 확인
   		MOV    KEY_STATE, A	;KEY STATE 변경
NOTPRESS:   	RET

MOVE:		MOV	A,KEY_STATE		;KEY STATE 복사

MOVE_LEFT:	CJNE	A,#04H,MOVE_DOWN;KEYPAD '4' CHECK
		MOV	A,SCOL		;COL 값 복사
		CLR	C		;CARRY 0
		RRC	A		;ROTATE RIGHT
		JC	LIFE_DECREASE	;벽에 부딪히면 목숨감소
		MOV	SCOL,A		;변경된 COL 값 할당
		RET

MOVE_DOWN:	CJNE	A,#05H,MOVE_RIGHT;KEYPAD '5' CHECK
		MOV	A,SROW		;ROW 값 복사
		CLR	C		;CARRY 0
		RLC	A		;ROTATE LEFT
		JC	LIFE_DECREASE	;벽에 부딪히면 목숨감소
		MOV	SROW,A		;변경된 ROW 값 할당
		RET

MOVE_RIGHT:	CJNE	A,#06H,MOVE_UP	;KEYPAD '6' CHECK
		MOV	A,SCOL		;COL 값 복사
		CLR	C		;CARRY 0
		RLC	A		;ROTATE LEFT
		JC	LIFE_DECREASE	;벽에 부딪히면 목숨감소
		MOV	SCOL,A		;변경된 COL 값 할당
		RET

MOVE_UP:	CJNE	A,#09H,NOT_MOVE ;KEYPAD '9' CHECK
		MOV	A,SROW		;ROW 값 복사
		CLR	C		;CARRY 0
		RRC	A		;ROTATE RIGHT
		JC	LIFE_DECREASE	;벽에 부딪히면 목숨감소
		MOV	SROW,A		;변경된 ROW 값 할당
NOT_MOVE:	RET

;---------------------------------------------------------------
;dot matrix
;초록색 정리

DOTCOLG_CLEAR:
   	MOV	DPTR, #COLGREEN 	;COLGREEN 주소 할당
	MOV   	A, #00H			;A 초기화
	MOVX   	@DPTR, A		;DPTR 초기화
	MOV    	DPTR,#ROW		;#ROW 주소 할당
	MOV    	A, #00H			;A 초기화
	MOVX   	@DPTR,A			;DPTR 초기화
	RET

;빨간색 정리
DOTCOLR_CLEAR:
   	MOV	DPTR, #COLRED		;COLRED 주소 할당
	MOV   	A, #00H			;A 초기화
	MOVX   	@DPTR, A		;DPTR 초기화
	MOV    	DPTR,#ROW		;#ROW 주소 할당
	MOV    	A, #00H			;A 초기화
	MOVX   	@DPTR,A			;DPTR 초기화
	RET

;초록뱀 표시
DOTCOLG:
	MOV	DPTR,#COLGREEN		;COLGREEN 주소 할당
	MOV	A,SCOL			;SCOL 복사
	MOVX	@DPTR,A			;SCOL 출력
	MOV	DPTR,#ROW		;ROW 주소 할당
	MOV	A,SROW			;SROW 복사
	MOVX	@DPTR,A			;SROW 출력
	RET
;빨간음식 표시
DOTCOLR:
	MOV	DPTR,#COLRED		;COLRED 주소 할당
	MOV	A,FCOL			;FCOL 복사
	MOVX	@DPTR,A			;FCOL 출력
	MOV	DPTR,#ROW		;ROW 주소 할당
	MOV	A,FROW			;FROW 복사
	MOVX	@DPTR,A			;FROW 출력
	RET
;----------------------------------------------------
;LIFE DECRAESE 목숨,게임오버

LIFE_DECREASE:
	MOV	A,LIFE			;LIFE 값 값 복사
	CJNE	A,#00H,LIFE_DOWN	;목숨이 0인지 CHECK
	
GAME_OVER:
	CLR	TCON.TR0	;죽었으니 타이머 해제
	MOV	LROW,#01H	;LCDROW 값 할당
	MOV 	LCOL,#02H	;LCDCOL 값 할당
	CALL 	CUR_MOV		;CURSOR 위치 변경

	MOV 	DPTR,#MESSAGE_over ;메시지 출력
	MOV 	FDPL, DPL		;DPL 값 저장
	MOV 	FDPH, DPH		;DPH 값 저장
	MOV 	NUMFONT, #0EH		;NUMFONT 0EH 복사
	CALL 	DISFONT			;출력
	JMP	GAME_OVER		;끝
;포트 다이오드 하나감소
LIFE_DOWN:
	DEC	A		;A-
	MOV	LIFE,A		;목숨 하나 감소

	MOV	R1,A		;목숨 값 복사
	MOV	A,#03H		;A 3 할당
	SUBB	A,R1		;A-R1
	MOV	R1,A		;R1 A 값 복사
	MOV	A,#11111000B	;위치 초기화

AGAIN:	RR	A		;ROTATE R 
	DJNZ	R1,AGAIN	;R1값 CHECK
	ORL	A,#11111000B	;A값 할당
	MOV	P1,A
	;빨간색으로 맵 깜빡이고 뱀위치 초기화 1 
	MOV	DPTR,#COLRED	;COLRED 주소 할당
	MOV	A,#11111111B	;A값 할당
	MOVX	@DPTR,A		;A MATRIX 출력

	MOV	DPTR,#ROW	;ROW 주소 할당
	MOV	A,#11111111B	;A값 할당
	MOVX	@DPTR,A		;A MATRIX 출력

	CALL   	DELAY		;DELAY
	;빨간색으로 맵 깜빡이고 뱀위치 초기화 2
	MOV	DPTR,#COLRED	;COLRED 주소 할당
	MOV	A,#00000000B	;A값 할당
	MOVX	@DPTR,A		;A MATRIX 출력

	MOV	DPTR,#ROW	;ROW 주소 할당
	MOV	A,#00000000B	;A값 할당
	MOVX	@DPTR,A		;A MATRIX 출력S

   	CALL   	DELAY		;지연

	MOV	SROW,#00010000B	;뱀위치 초기치
	MOV	SCOL,#00010000B

	RET
;---------------------------------------------------
;먹이 먹었는지 확인
FOOD_CHECK:
	MOV	A,FCOL		;FCOL 할당
	CJNE	A,SCOL,NO_EAT	;좌표 같은지 확인
	MOV	A,FROW		;FROW 할당
	CJNE	A,SROW,NO_EAT   ;좌표 같은지 확인
	 
	MOV	A,SCORE		;SCORE 할당
	INC	A		;SCORE+
	MOV	SCORE,A		;값 할당
	DA	A
	CALL	DISSEC		;SEGMENT 갱신(SCORE)

;먹이 생성
FOOD_GENERATE:
	CLR   	TCON.TR0	;TIMER 정지
	MOV	A,TL0		;TL0 값 할당
	MOV	B,#03H		;B 값 할당
	MUL	AB		;A*B
	MOV	R1,A		;R1 값 할당
	MOV	A,TL0		;TL0 값 할당
	MOV	B,#07H		;B 값 할당
	MUL	AB		;A*B
	MOV	R2,A		;R2 값 할당
	SETB	TCON.TR0	;TIMER 가동
	MOV	A,#00000001B	;MATRIX 값 할당
; 먹이의 COL 결정
COL_GENERATE:
	RL	A		;ROTATE LEFT
	DJNZ	R1,COL_GENERATE	;R1 값 CHECK
	MOV	R1,A		;A 값 할당
	MOV	FCOL,A		;COL 값을 FCOL에 할당
	MOV	A,#00000001B
;먹이의 ROW 결정
ROW_GENERATE:
	RR	A		;ROTATE RIGHT
	DJNZ	R2,ROW_GENERATE	;R2 값 CHECK
	MOV	R1,A		;A 값 할당
	MOV	FROW,A		;ROW 값을 FROW에 할당
;만약 먹이 위치가 뱀의 위치와 같을시 다시 만듦
	MOV	A,FCOL		
	CJNE	A,SCOL,NO_EAT	;SNAKE의 COL과 비교

	MOV	A,FROW          ;
	CJNE	A,SROW,NO_EAT	;SNAKE의 ROW 비교

	JMP	FOOD_GENERATE 	;위치 재생성

NO_EAT:	RET

DISSEC:	MOV	DPTR,#SEG1	;SEG1 주소 할당
	MOVX	@DPTR,A		;A 값 복사
	MOV	A,#00H		;초기화
	MOV	DPTR,#SEG2	;SEG2 주소 할당
	MOVX	@DPTR,A		;A 값 복사
	MOV	DPTR,#SEG3	;SEG3 주소 할당
	MOVX	@DPTR,A		;A 값 복사
	RET



;-----------------------------------------------------------------
;타이머 인터럽트
;ORG 9F0BH
;JMP TIMER

TIMER:	CLR    	TCON.TR0	;TIMER COUNTER 초기화
	SETB	TCON.TR0	;TIMER 가동
	MOV	A,GAME_PHASE	;GAME PHASE 값 할당
	INC	A		;16번 반복시 COUNT 실행
	CJNE	A,#16,NOTCOUNT	;57600 cycle * 16 = 1second

COUNT:	MOV	A,#00H	
	MOV	GAME_PHASE,A	
	MOV  	A, TIME		;lcd시간업데이트
   	INC   	A
   	MOV   	TIME, A
	MOV 	INST,#CLEAR
	CALL 	INSTWR
	MOV     LROW,#02H
        MOV     LCOL,#02H
        CALL    CUR_MOV
        MOV     DPTR,#NUMBER
        MOV     FDPL,DPL
        MOV     FDPH,DPH
        CALL    DISFONT_GAMETIME
   	RETI

NOTCOUNT:
	MOV	GAME_PHASE,A 
	RETI

;------------------------------------------------------------
;인터럽트0
;ORG     9F03H
;JMP     INT0

INT0:	
	MOV	A,	GAME_PAUSE
	CJNE	A, #00H, OUT_LOOP
	CLR    	TCON.TR0
	MOV	A, #01H
	MOV	GAME_PAUSE,A
	
INT_LOOP:
	MOV	LROW,#01H
	MOV 	LCOL,#02H
	CALL 	CUR_MOV
	MOV 	DPTR,#MESSAGE_pause
	MOV 	FDPL, DPL
	MOV 	FDPH, DPH
	MOV 	NUMFONT, #0EH
	CALL 	DISFONT
	RETI

OUT_LOOP:	
	MOV	LROW,#01H
	MOV 	LCOL,#02H
	CALL 	CUR_MOV
	MOV 	DPTR,#MESSAGE_EMPTY
	MOV 	FDPL, DPL
	MOV 	FDPH, DPH
	MOV 	NUMFONT, #0EH
	CALL 	DISFONT
	MOV	A,#00H
	MOV	GAME_PAUSE,A
	SETB    TCON.TR0
	RETI


ORG     9F03H
JMP     INT0
ORG 9F0BH
JMP TIMER

END
