Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		HighlightAll
		
	: (Form event code:C388=On Data Change:K2:15)
		Absolute
		
		If (Form:C1466.display.pictureRatioLocked)  //& (Form.display.pictureRatio#0)
			Form:C1466.pictSettings[wk width:K81:45]:=0  //Round(Form.pictSettings[wk height]*Form.display.pictureRatio; 2)
			GOTO OBJECT:C206(*; "alternateText")  // display "auto" for height rather than 0 if height gets the focus
		End if 
		
End case 




