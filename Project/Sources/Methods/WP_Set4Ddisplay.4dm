//%attributes = {"invisible":true}
#DECLARE($option : Integer; $areaName : Text)  //$option : 0 : values, 1 : references

If (Count parameters:C259=1)  // component context
	If (areaName#"")
		CALL FORM:C1391(Current form window:C827; Current method name:C684; $option; areaName)
	End if 
Else   // host database context
	WP SET VIEW PROPERTIES:C1648(*; $areaName; New object:C1471(wk visible references:K81:286; ($option=1)))
End if 
