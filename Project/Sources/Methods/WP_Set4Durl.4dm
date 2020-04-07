//%attributes = {"invisible":true}
C_TEXT:C284($1;$2)  // initial call

C_TEXT:C284($3)  // second call
C_LONGINT:C283($4;$5)

C_TEXT:C284($label;$URL)
C_TEXT:C284($areaName)
C_LONGINT:C283($start;$end)

C_OBJECT:C1216($oCurrent)


If (Count parameters:C259=2)  // component context
	
	If (areaName#"")
		
		$label:=$1
		$URL:=$2
		
		$oCurrent:=Form:C1466.selection
		$start:=OB Get:C1224($oCurrent;wk start:K81:87)
		$end:=OB Get:C1224($oCurrent;wk end:K81:88)
		
		CALL FORM:C1391(Current form window:C827;Current method name:C684;$label;$URL;areaName;$start;$end)
		
	End if 
	
	
Else   // parent form context
	
	$label:=$1
	$URL:=$2
	$areaName:=$3
	$start:=$4
	$end:=$5
	
	ST INSERT URL:C1280(*;$areaName;$label;$URL;$start;$end)
	
	GOTO OBJECT:C206(*;$areaName)
	WP SELECT:C1348(*;$areaName;$end;$end)
	
End if 