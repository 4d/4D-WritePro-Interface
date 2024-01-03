

Case of 
	: (Form:C1466.anchorSection.index=0)
		Form:C1466.pictSettings[wk anchor section:K81:228]:=wk anchor all:K81:229
		Form:C1466.display.anchorSection:=wk anchor all:K81:229  // negative value = not displayed
		
		GOTO OBJECT:C206(*; "")
		
	: (Form:C1466.anchorSection.index=1)
		
		UI_PictureSettings  // no wait. otherwise GOTO OBJECT(*; "anchorPageNumberInput") will not work
		Form:C1466.display.anchorSection:=1
		Form:C1466.pictSettings[wk anchor section:K81:228]:=1
		
		GOTO OBJECT:C206(*; "anchorSectionNumberInput")
		
End case 

SET TIMER:C645(-1)


