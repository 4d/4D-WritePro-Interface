Case of 
	: (Form event code:C388=On Load:K2:1)
		
		OBJECT SET ENABLED:C1123(*; "bOK"; False:C215)
		HIGHLIGHT TEXT:C210(*; "expression"; MAXLONG:K35:2; MAXLONG:K35:2)
		If (Not:C34(Undefined:C82(Form:C1466.windowTitle)))
			SET WINDOW TITLE:C213(Form:C1466.windowTitle)
		End if 
		
		If (Not:C34(Undefined:C82(Form:C1466.placeHolder)))
			OBJECT SET PLACEHOLDER:C1295(*; "expression"; Form:C1466.placeHolder)
		End if 
		
		
		
End case 