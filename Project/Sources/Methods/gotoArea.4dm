//%attributes = {"invisible":true}
//#DECLARE($1 : Text)
C_TEXT:C284($1)
C_LONGINT:C283($2)

var $areaName : Text
var $focusName : Text

$areaName:=$1

If (Count parameters:C259=1)
	
	$focusName:=OBJECT Get name:C1087(Object with focus:K67:3)
	If ($focusName#$areaName)
		CALL FORM:C1391(Frontmost window:C447; "gotoArea"; $areaName; 0)
	End if 
	
Else 
	
	//mark:-
	
	GOTO OBJECT:C206(*; $areaName)
	
End if 

