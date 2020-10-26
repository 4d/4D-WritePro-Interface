//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)  // initial call

C_TEXT:C284($3)  // second call
C_LONGINT:C283($4; $5)

C_TEXT:C284($label; $URL)
C_TEXT:C284($areaName)
C_LONGINT:C283($start; $end)
C_LONGINT:C283($i; $n)

C_OBJECT:C1216($oCurrent)

ARRAY TEXT:C222($_objects; 0)
ARRAY POINTER:C280($_variables; 0)

If (Count parameters:C259=2)  // component context
	
	If (areaName#"")
		
		$label:=$1
		$URL:=$2
		
		$oCurrent:=Form:C1466.selection
		$start:=OB Get:C1224($oCurrent; wk start:K81:87)
		$end:=OB Get:C1224($oCurrent; wk end:K81:88)
		
		CALL FORM:C1391(Current form window:C827; Current method name:C684; $label; $URL; areaName; $start; $end)
		
	End if 
	
	
Else   // parent form context
	
	$label:=$1
	$URL:=$2
	$areaName:=$3
	$start:=$4
	$end:=$5
	
	
	OBJECT GET COORDINATES:C663(*; $areaName; $x1; $y1; $y1; $y2)  // <ACI0101020> 
	If (($x1+$y1+$y1+$y2)#0)
		
		// the form object is in the form
		
		ST INSERT URL:C1280(*; $areaName; $label; $URL; $start; $end)
		
		GOTO OBJECT:C206(*; $areaName)
		WP SELECT:C1348(*; $areaName; $end; $end)
		
	Else 
		
		FORM GET OBJECTS:C898($_objects; $_variables; Form current page:K67:6)
		$n:=Size of array:C274($_objects)
		For ($i; 1; $n)
			If (OBJECT Get type:C1300(*; $_objects{$i})=Object type subform:K79:40)
				// the form object might be in a sub form  (recursively)
				EXECUTE METHOD IN SUBFORM:C1085($_objects{$i}; "WP_Set4Durl"; *; $1; $2; $3; $4; $5)
			End if 
		End for 
		
	End if   // </ACI0101020> 
End if 