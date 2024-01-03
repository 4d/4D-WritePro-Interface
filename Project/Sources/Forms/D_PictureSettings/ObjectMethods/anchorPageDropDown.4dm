


If (Form:C1466.anchorPage.index<=3)
	
	Form:C1466.pictSettings[wk anchor page:K81:231]:=Form:C1466.anchorPage.anchorValues[Form:C1466.anchorPage.index]  //wk anchor all
	Form:C1466.display.anchorPage:=Form:C1466.pictSettings[wk anchor page:K81:231]  // negative value = not displayed
	GOTO OBJECT:C206(*; "")
	
	
Else   //Form.anchorPage.index = 4
	
	UI_PictureSettings  // no wait. otherwise GOTO OBJECT(*; "anchorPageNumberInput") will not work
	
	Form:C1466.display.anchorPage:=1
	Form:C1466.pictSettings[wk anchor page:K81:231]:=1
	
	Form:C1466.pictSettings[wk anchor section:K81:228]:=wk anchor all:K81:229
	Form:C1466.display.anchorSection:=wk anchor all:K81:229  // negative value = not displayed
	
	GOTO OBJECT:C206(*; "anchorPageNumberInput")
	
End if 

SET TIMER:C645(-1)
