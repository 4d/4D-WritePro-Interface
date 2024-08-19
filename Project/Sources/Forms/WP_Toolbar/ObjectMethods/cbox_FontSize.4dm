If (oForm.comboFontSizes.currentValue<1)  // check < 1  (must be >=1)
	oForm.comboFontSizes.currentValue:=1
End if 

WP_SetFontSize(Form:C1466.selection; oForm.comboFontSizes.currentValue)

WP_BackToArea

UI_Toolbar  // ACI0104990 Pat Bensky
