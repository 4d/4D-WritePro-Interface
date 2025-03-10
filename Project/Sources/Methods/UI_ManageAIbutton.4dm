//%attributes = {}
// "btnAI" is the name of the button

If (oForm.aiKey="")
	If (Not:C34(Undefined:C82(Storage:C1525.aiKey)))  // The key has been added
		oForm.aiKey:=Storage:C1525.aiKey.key
	End if 
Else 
	If (Undefined:C82(Storage:C1525.aiKey))  // The key has been removed
		oForm.aiKey:=""
	End if 
End if 

OBJECT SET ENABLED:C1123(*; "btnAI"; (oForm.aiKey#""))


