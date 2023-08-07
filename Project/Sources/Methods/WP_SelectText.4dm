//%attributes = {"invisible":true}
// WP_SelectText
#DECLARE($areaName : Text; $range : Object)->$selected : Boolean

var $i; $n; $p : Integer

ARRAY TEXT:C222($_objectNames; 0)

//{ACI0103944
FORM GET OBJECTS:C898($_objectNames)
$p:=Find in array:C230($_objectNames; $areaName)
If ($p>0)
	WP SELECT:C1348(*; $areaName; $range)  //$start; $end)
	$selected:=True:C214
Else 
	$n:=Size of array:C274($_objectNames)
	For ($i; 1; $n)
		If (OBJECT Get type:C1300(*; $_objectNames{$i})=Object type subform:K79:40)
			EXECUTE METHOD IN SUBFORM:C1085($_objectNames{$i}; "WP_SelectText"; $selected; $areaName; $range)
			If ($selected)
				$i:=$n  // exit loop
			End if 
		End if 
	End for 
	
End if 
//ACI0103944}