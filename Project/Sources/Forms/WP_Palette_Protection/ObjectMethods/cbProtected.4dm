If (Form:C1466.paragraphProtected=2)
	Form:C1466.paragraphProtected:=0
End if 

WP_SetParagraphProtection (Form:C1466.selection;Form:C1466.paragraphProtected)
SET TIMER:C645(-1)