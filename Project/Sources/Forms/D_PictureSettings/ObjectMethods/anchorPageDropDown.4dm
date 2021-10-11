


If (_anchorPage<=4)
	Case of 
		: (_anchorPage=1)
			Form:C1466.pictSettings[wk anchor page:K81:231]:=wk anchor all:K81:229
			
		: (_anchorPage=2)
			Form:C1466.pictSettings[wk anchor page:K81:231]:=wk anchor first page:K81:232
			
		: (_anchorPage=3)
			Form:C1466.pictSettings[wk anchor page:K81:231]:=wk anchor left page:K81:233
			
		: (_anchorPage=4)
			Form:C1466.pictSettings[wk anchor page:K81:231]:=wk anchor right page:K81:234
			
	End case 
	
	Form:C1466.display.anchorPage:=Form:C1466.pictSettings[wk anchor page:K81:231]  // negative value = not displayed
	GOTO OBJECT:C206(*; "")
	
	
Else   //_anchorPage=5
	
	UI_PictureSettings  // no wait. otherwise GOTO OBJECT(*; "anchorPageNumberInput") will not work
	
	Form:C1466.display.anchorPage:=1
	Form:C1466.pictSettings[wk anchor page:K81:231]:=1
	
	Form:C1466.pictSettings[wk anchor section:K81:228]:=wk anchor all:K81:229
	Form:C1466.display.anchorSection:=wk anchor all:K81:229  // negative value = not displayed
	
	GOTO OBJECT:C206(*; "anchorPageNumberInput")
	
End if 

SET TIMER:C645(-1)
