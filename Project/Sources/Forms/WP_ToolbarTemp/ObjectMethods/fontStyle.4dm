C_TEXT:C284($font)

$font:=WP_fontLongName{WP_fontStyle}
WP_SetFont(Form:C1466.selection; $font)

If (Form:C1466.selection.start#Form:C1466.selection.end)  //ACI0104450
	WP_GetFontInfo(Form:C1466.selection; True:C214)
	oForm.forcedEventCode:=On After Edit:K2:43
	SET TIMER:C645(-1)
End if 