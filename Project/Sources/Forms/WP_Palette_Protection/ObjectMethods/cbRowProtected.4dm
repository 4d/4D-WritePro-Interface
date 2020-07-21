If (Form:C1466.rowProtected=2)
	Form:C1466.rowProtected:=0
End if 


WP_SetRowProtection (Form:C1466.selection;Form:C1466.rowProtected)
SET TIMER:C645(-1)

