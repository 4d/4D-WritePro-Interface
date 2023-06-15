Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.currentRow#Null:C1517)
			If (Form:C1466.currentRow.check)
				
			Else 
				LISTBOX SELECT ROW:C912(*; "LB_collection"; 1; lk replace selection:K53:1)
			End if 
		Else 
			LISTBOX SELECT ROW:C912(*; "LB_collection"; 1; lk replace selection:K53:1)
		End if 
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Data Change:K2:15)  // check-uncheck
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Begin Drag Over:K2:44)
		Form:C1466.tempRow:=Form:C1466.currentRow
		ALERT:C41("drag"+JSON Stringify:C1217(Form:C1466.tempRow; *))
		
	: (Form event code:C388=On Drop:K2:12)
		ALERT:C41("drop")
		
End case 