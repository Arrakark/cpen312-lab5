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

