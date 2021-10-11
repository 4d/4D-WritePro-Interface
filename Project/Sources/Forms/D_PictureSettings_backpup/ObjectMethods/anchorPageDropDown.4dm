Case of 
	: (_anchorPage=1)
		Form:C1466.pictSettings[wk anchor page:K81:231]:=wk anchor all:K81:229
		
	: (_anchorPage=2)
		Form:C1466.pictSettings[wk anchor page:K81:231]:=wk anchor first page:K81:232
		
	: (_anchorPage=3)
		Form:C1466.pictSettings[wk anchor page:K81:231]:=wk anchor left page:K81:233
		
	: (_anchorPage=4)
		Form:C1466.pictSettings[wk anchor page:K81:231]:=wk anchor right page:K81:234
		
	Else   //_anchorPage=5
		
		If (Form:C1466.display.anchorPage<1)
			Form:C1466.display.anchorPage:=1
		End if 
		
		Form:C1466.pictSettings[wk anchor page:K81:231]:=Form:C1466.display.anchorPage  // display
End case 


SET TIMER:C645(-1)
