
If (formData.fontSize<1)  // check < 1  (must be >=1)
	formData.fontSize:=1
End if 

WP_SetFontSize(Form:C1466.selection; formData.fontSize)

UI_PaletteFonts  // ACI0104990 Pat Bensky
