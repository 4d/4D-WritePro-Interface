C_TEXT:C284($font)

$font:=WP_fontLongName{WP_fontStyle}

WP_SetFont(Form:C1466.selection; $font)

WP_GetFontInfo(Form:C1466.selection; True:C214)

//ACI0103661 report to v19R7
oForm.forcedEventCode:=On After Edit:K2:43
SET TIMER:C645(-1)