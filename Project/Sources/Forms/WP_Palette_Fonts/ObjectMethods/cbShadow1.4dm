
var $color : Integer
var $offset : Integer

If (formData.cbShadow=2)
	formData.cbShadow:=0
End if 

$offset:=formData.shadowOffset

If (formData.cbShadow=1)
	If ($offset=0)
		$offset:=1
	End if 
	OBJECT GET RGB COLORS:C1074(*; "ColorShadow"; $color; $color)
	WP_SetTextShadow(Form:C1466.selection; $offset; $color)
Else 
	WP_SetTextShadow(Form:C1466.selection; $offset; wk transparent:K81:134)
End if 
