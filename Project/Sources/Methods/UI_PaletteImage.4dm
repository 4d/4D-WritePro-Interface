//%attributes = {}
C_OBJECT:C1216($range)
C_COLLECTION:C1488($elements)

If (UI_isProtected(False:C215))  // false means do NOT take focus into account
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
Else 
	
	
	C_OBJECT:C1216($form)
	
	$range:=Form:C1466.selection
	
	$form:=New object:C1471()
	$form.range:=$range
	
	If ($range.type=2)
		$form.picture:=$range
	Else 
		
		$elements:=WP Get elements:C1550($range; wk type image:K81:192)
		
		If ($elements.length>=1)
			$form.picture:=$elements[0]
		End if 
		
	End if 
	
	If (Not:C34(Undefined:C82($form.picture)))
		OBJECT SET ENABLED:C1123(*; "btn_PictInfo"; True:C214)
	Else 
		OBJECT SET ENABLED:C1123(*; "btn_PictInfo"; False:C215)
	End if 
	
End if 


// the tab buttons are always enabled
OBJECT SET ENABLED:C1123(*; "tabBtn_@"; True:C214)
//… except the document protection itlself
OBJECT SET ENABLED:C1123(*; "cbProtectionEnabled"; True:C214)
