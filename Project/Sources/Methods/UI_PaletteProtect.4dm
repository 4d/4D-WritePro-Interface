//%attributes = {"invisible":true}
If (UI_isProtected(True:C214))  // true means take focus into account
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
	
Else 
	
	If (Form:C1466.protectionEnabled=True:C214)
		// disable everything…
		OBJECT SET ENABLED:C1123(*; "@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
		
	Else 
		
		OBJECT SET ENABLED:C1123(*; "@"; True:C214)
		OBJECT SET ENTERABLE:C238(*; "@"; True:C214)
		
	End if 
	
End if 


// the tab buttons are always enabled
OBJECT SET ENABLED:C1123(*; "tabBtn_@"; True:C214)

//… except the document protection itlself
OBJECT SET ENABLED:C1123(*; "cbProtectionEnabled"; True:C214)
OBJECT SET ENTERABLE:C238(*; "cbProtectionEnabled"; True:C214)
