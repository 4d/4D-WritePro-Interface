C_OBJECT:C1216($document)

$document:=Form:C1466.selection[wk owner:K81:168]
If ($document#Null:C1517)
	If (Shift down:C543)
		SET PRINT PREVIEW:C364(True:C214)
	End if 
	
	WP USE PAGE SETUP:C1358($document)
	WP PRINT:C1343($document)
End if 