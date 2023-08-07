//%attributes = {"invisible":true}
#DECLARE($areaName : Text; $execInParent : Integer)->$selected : Boolean


var $focusName : Text


If (Count parameters:C259=1)
	// widget context
	
	$focusName:=OBJECT Get name:C1087(Object with focus:K67:3)
	If ($focusName#$areaName)
		CALL FORM:C1391(Frontmost window:C447; "gotoArea"; $areaName; 0)
	End if 
	
Else 
	
	// parent form context
	var $i; $n; $p : Integer
	
	//{ACI0103944
	ARRAY TEXT:C222($_objectNames; 0)
	FORM GET OBJECTS:C898($_objectNames)
	$p:=Find in array:C230($_objectNames; $areaName)
	If ($p>0)
		GOTO OBJECT:C206(*; $areaName)
		$selected:=True:C214
	Else 
		$n:=Size of array:C274($_objectNames)
		For ($i; 1; $n)
			If (OBJECT Get type:C1300(*; $_objectNames{$i})=Object type subform:K79:40)
				EXECUTE METHOD IN SUBFORM:C1085($_objectNames{$i}; "gotoArea"; $selected; $areaName; 0)
				If ($selected)
					$i:=$n  // exit loop
				End if 
			End if 
		End for 
	End if 
	//ACI0103944}
	
End if 

