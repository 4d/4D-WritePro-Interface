If (Form:C1466.tableProtected=2)
	Form:C1466.tableProtected:=0
End if 


WP_SetTableProtection (Form:C1466.selection;Form:C1466.tableProtected)
SET TIMER:C645(-1)

