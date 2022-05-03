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
			
			OBJECT SET ENABLED:C1123(*; "cbBold"; WP Is font style supported:C1363(Form:C1466.selection; wk font bold:K81:68))
			OBJECT SET ENABLED:C1123(*; "cbItalic"; WP Is font style supported:C1363(Form:C1466.selection; wk font italic:K81:67))
			
			//If (Not(Undefined(oSettings1)))
			//If (Not(OB Is empty(oSettings1)))
			//OBJECT SET ENABLED(*; "btnPaste"; True)
			//Else 
			//OBJECT SET ENABLED(*; "btnPaste"; False)
			//End if 
			//End if 
			
	End case 
	
	OBJECT SET ENTERABLE:C238(*; "UnderlineColor"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "LinethroughColor"; False:C215)
	
End if 
