C_OBJECT:C1216($range)
$range:=WP Text range:C1341([SAMPLE:1]WP:2;1;5)
If (Shift down:C543)
	WP SET ATTRIBUTES:C1342($range;wk font bold:K81:68;wk true:K81:174)
Else 
	WP SET ATTRIBUTES:C1342($range;wk font bold:K81:68;wk false:K81:173)
End if 

WP UpdateWidget ("WPwidget")