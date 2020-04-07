//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_LONGINT:C283($page)
If (Count parameters:C259=1)
	$page:=$1
	(OBJECT Get pointer:C1124(Object named:K67:5;"tab"+String:C10($page)))->:=1
Else 
	$page:=Num:C11(OBJECT Get name:C1087(Object current:K67:2))
End if 

OBJECT SET FONT STYLE:C166(*;"tab@";Plain:K14:1)
OBJECT SET FONT STYLE:C166(*;"tab"+String:C10($page);Bold:K14:2)
FORM GOTO PAGE:C247($page;*)

SET TIMER:C645(-1)
