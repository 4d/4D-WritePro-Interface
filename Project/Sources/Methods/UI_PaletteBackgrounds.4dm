//%attributes = {"invisible":true}

C_LONGINT:C283($typeSelection)

If (UI_isProtected(False:C215))  // false means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
Else 
	
	$typeSelection:=Form:C1466.selection.type
	Case of 
			
		: ($typeSelection=2)  // static picture
			OBJECT SET ENABLED:C1123(*; "@"; False:C215)
			OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
			
		: ($typeSelection=0)
			OBJECT SET ENABLED:C1123(*; "@"; True:C214)
			OBJECT SET ENTERABLE:C238(*; "@"; True:C214)
			
			If (Not:C34(Undefined:C82(oSettings1)))
				If (Not:C34(OB Is empty:C1297(oSettings1)))
					OBJECT SET ENABLED:C1123(*; "btnPaste"; True:C214)
				Else 
					OBJECT SET ENABLED:C1123(*; "btnPaste"; False:C215)
				End if 
			Else 
				OBJECT SET ENABLED:C1123(*; "btnPaste"; False:C215)
			End if 
			
	End case 
	
End if 
