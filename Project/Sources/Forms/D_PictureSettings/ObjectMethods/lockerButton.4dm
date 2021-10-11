Form:C1466.display.pictureRatioLocked:=Not:C34(Form:C1466.display.pictureRatioLocked)
If (Form:C1466.display.pictureRatioLocked)
	Form:C1466.pictSettings[wk height:K81:46]:=0  //Round(Form.pictSettings[wk width]/Form.display.pictureRatio; 2)
	GOTO OBJECT:C206(*; "alternateText")  // display "auto" for height rather than 0 if height gets the focus
End if 
SET TIMER:C645(-1)
