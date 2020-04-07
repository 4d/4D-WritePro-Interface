//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_TEXT:C284($2)

C_LONGINT:C283($option)
C_TEXT:C284($areaName)

If (Count parameters:C259=1)  // component context
	
	$option:=$1
	If (areaName#"")
		CALL FORM:C1391(Current form window:C827;Current method name:C684;$option;areaName)
	End if 
	
Else   // host database context
	
	$option:=$1
	$areaName:=$2
	
	ST SET OPTIONS:C1289(*;$areaName;ST Expressions display mode:K78:5;$option)
	
End if 