C_OBJECT:C1216($oCurrent)
$oCurrent:=WP_FillCurrent 

If (Self:C308->=2)
	Self:C308->:=0
End if 

WP_SetFrame ($oCurrent;wk border style:K81:29)
WP_SetFrame ($oCurrent;wk border width:K81:39)
WP_SetFrame ($oCurrent;wk border color:K81:34)