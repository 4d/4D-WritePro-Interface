If (Form:C1466.textBoxProtected=2)
	Form:C1466.textBoxProtected:=0
End if 

WP_SetTableProtection(Form:C1466.selection; Form:C1466.textBoxProtected)
SET TIMER:C645(-1)

