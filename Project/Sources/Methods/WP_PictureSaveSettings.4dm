//%attributes = {"invisible":true}

If ($1="save")
	Form:C1466.backup:=OB Copy:C1225(Form:C1466.pictSettings)
Else   // rollback
	Form:C1466.pictSettings:=OB Copy:C1225(Form:C1466.backup)
End if 


