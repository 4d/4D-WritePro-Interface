C_TEXT:C284($font)
$font:=WP_fontLongName{WP_fontStyle}

WP_SetFont(Form:C1466.selection; $font)
WP_GetFontInfo(Form:C1466.selection; True:C214)

oform.forcedEventCode:=On After Edit:K2:43
SET TIMER:C645(-1)
