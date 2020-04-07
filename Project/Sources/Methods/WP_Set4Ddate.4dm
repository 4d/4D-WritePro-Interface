//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_LONGINT:C283($2;$3)

C_TEXT:C284($areaName)

C_LONGINT:C283($start;$end)
C_OBJECT:C1216($oCurrent)

If (Count parameters:C259=0)  // component context
	
	If (areaName#"")
		
		$oCurrent:=Form:C1466.selection
		$start:=OB Get:C1224($oCurrent;wk start:K81:87)
		$end:=OB Get:C1224($oCurrent;wk end:K81:88)
		
		CALL FORM:C1391(Current form window:C827;Current method name:C684;areaName;$start;$end)
		
	End if 
	
Else 
	
	$areaName:=$1
	$start:=$2
	$end:=$3
	
	ST INSERT EXPRESSION:C1281(*;$areaName;"Current date:C33";$start;$end)
	WP SELECT:C1348(*;$areaName;$end+1;$end+1)
	
End if 