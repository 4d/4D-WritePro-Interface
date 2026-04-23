If (formData.comboFontSizes.currentValue<1)  // check < 1  (must be >=1)
	formData.comboFontSizes.currentValue:=1
End if 

WP_SetFontSize(Form:C1466.selection; formData.comboFontSizes.currentValue)

WP_BackToArea

UI_Toolbar  // ACI0104990 Pat Bensky
