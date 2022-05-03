
If (Form:C1466.document=Null:C1517)
	Form:C1466.document:=Form:C1466.selection.owner
End if 

If (Form:C1466.document#Null:C1517)
	
	WP_StylesheetUpdate
Else 
	
End if 
