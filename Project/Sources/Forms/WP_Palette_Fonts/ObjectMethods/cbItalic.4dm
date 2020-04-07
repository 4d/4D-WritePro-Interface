
If (oForm.cbItalic=2)
	oForm.cbItalic:=0
End if 

WP_SetFontItalic (Form:C1466.selection;oForm.cbItalic)

WP_GetFontInfo (Form:C1466.selection;True:C214)