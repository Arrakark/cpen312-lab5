; Write  the  assembly  program  for  a  calculator  with  the  following  operations:  
; addition, subtraction,  multiplication,  and  division.   
; The calculator should  work  with  unsigned  32-bit  binary  numbers,  where  both  the  input  and  output  are  in  decimal.      
; The  numbers  are input by toggling switches SW0 to SW9 on/off.  Assume KEY3 is the ‘+’ button, KEY2 is  the  ‘-’  button,  and  KEY1  
; is  the  ‘=’  button.    Since  there  are  not  enough  buttons  to assign  multiplication  and  division,  use  KEY0  as  a  shift  key:    
; if  KEY0  and  KEY3  are pressed, the operation is ‘*’.  Similarly, if KEY0 and KEY2 are pressed, the operation is ‘/’. 
; Display the number in decimal using the seven segment displays HEX0 to HEX5.  To speed  up  the  development  of  your  program,  
; a  collection  of  32-bit  arithmetic  functions similar (if not identical!) to those studied in class is provide for you to use.  
; You can find the  file  in  the  course  web  page  under  the  name ‘math32.asm’.    
; A  program  that demonstrates  the  use  of  the  functions  in ‘math32.asm’  is  also  provided  under  the  name ‘math32test.asm’.

$MODDE0CV ; define soft proccessor mode

ljmp init

dseg at 30h

x:		ds	4
y:		ds	4
bcd:	ds	5

bseg

mf:		dbit 1

$include(math32.asm)

CSEG
	
init:
	mov SP, #0x7f ; Initialize the stack
	sjmp main_loop

; Assume KEY3 is the ‘+’ button, KEY2 is  the  ‘-’  button,  and  KEY1  
; is  the  ‘=’  button.    Since  there  are  not  enough  buttons  to assign  multiplication  and  division,  use  KEY0  as  a  shift  key:    
; if  KEY0  and  KEY3  are pressed, the operation is ‘*’.  Similarly, if KEY0 and KEY2 are pressed, the operation is ‘/’. 

main_loop:
	jb KEY.3, no_add ; If '+' key not pressed, skip
	jnb KEY.3, $ ; Wait for user to release '+' key
	lcall bcd2hex ; Convert the BCD number to hex in x
	lcall copy_xy ; move x to y (this is a function)
	Load_X(0) ; clear x (this is a macro)
	lcall hex2bcd ; Convert binary x to BCD
	lcall Display_BCD ; Display the new BCD number
	ljmp main_loop ; Go check for more input
no_add:
	jb KEY.2, no_subtract ; If '-' key not pressed, skip
no_subtract:
	jb KEY.1, no_equal ; If '=' key not pressed, skip
	jnb KEY.1, $ ; Wait for user to release '=' key
	lcall bcd2hex ; Convert the BCD number to hex in x
	lcall add32 ; Add the numbers stored in x and y
	lcall hex2bcd ; Convert result in x to BCD
	lcall Display_BCD ; Display the new BCD number
	ljmp main_loop ; Go check for more input

no_equal:
	; get more numbers
	lcall ReadNumber
	jnc no_new_digit ; Indirect jump to 'forever'
	lcall Shift_Digits
	lcall Display_BCD
no_new_digit:
	ljmp main_loop ; 'forever' is to far away, need to use ljmp	

    