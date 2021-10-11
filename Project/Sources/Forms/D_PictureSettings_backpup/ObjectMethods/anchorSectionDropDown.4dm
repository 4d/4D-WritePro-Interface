
Case of 
	: (_anchorSection=1)
		Form:C1466.pictSettings[wk anchor section:K81:228]:=wk anchor all:K81:229
		
	: (_anchorSection=2)
		If (Form:C1466.display.anchorSection<1)
			Form:C1466.display.anchorSection:=1
		End if 
		
		Form:C1466.pictSettings[wk anchor section:K81:228]:=Form:C1466.display.anchorSection
		
End case 

SET TIMER:C645(-1)

