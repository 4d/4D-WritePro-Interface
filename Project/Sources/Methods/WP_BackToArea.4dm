//%attributes = {"invisible":true}
#DECLARE($areaName : Text)

If (Count parameters:C259=0)
	CALL FORM:C1391(Current form window:C827; "WP_BackToArea"; Form:C1466.areaName)
Else 
	// execution in the parent form context.
	GOTO OBJECT:C206(*; $areaName)
End if 
