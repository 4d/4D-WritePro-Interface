Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		HighlightAll
		
	: (Form event code:C388=On Data Change:K2:15)
		
		If (Form:C1466.display.anchorSection<=1)
			Form:C1466.display.anchorSection:=1
		End if 
		
		Form:C1466.pictSettings[wk anchor section:K81:228]:=Form:C1466.display.anchorSection
		
End case 




