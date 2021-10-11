If (Form:C1466.display.pictureRatioLocked)  //& (Form.display.pictureRatio#0)
	Form:C1466.pictSettings[wk height:K81:46]:=0  //Round(Form.pictSettings[wk width]/Form.display.pictureRatio; 2)
	GOTO OBJECT:C206(*; "alternateText")  // display "auto" for height rather than 0 if height gets the focus
End if 
