
C_LONGINT:C283($color)
C_LONGINT:C283($offset)

If (oForm.cbShadow=2)
	oForm.cbShadow:=0
End if 

$offset:=oForm.shadowOffset

If (oForm.cbShadow=1)
	If ($offset=0)
		$offset:=1
	End if 
	OBJECT GET RGB COLORS:C1074(*;"ColorShadow";$color;$color)
	WP_SetTextShadow (Form:C1466.selection;$offset;$color)
Else 
	WP_SetTextShadow (Form:C1466.selection;$offset;wk transparent:K81:134)
End if 
