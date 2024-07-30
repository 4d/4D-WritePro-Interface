
If (oForm.fontSize<1)  // check < 1  (must be >=1)
	oForm.fontSize:=1
End if 

WP_SetFontSize(Form:C1466.selection; oForm.fontSize)

UI_PaletteFonts  // ACI0104990 Pat Bensky
