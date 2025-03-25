//%attributes = {}
// "btnAI" is the name of the button

var $visible; $enabled : Boolean

If (oForm.aiKey="")
	If (Not:C34(Undefined:C82(Storage:C1525.aiKey)))  // The key has been added
		oForm.aiKey:=Storage:C1525.aiKey.key
	End if 
Else 
	If (Undefined:C82(Storage:C1525.aiKey))  // The key has been removed
		oForm.aiKey:=""
	End if 
End if 


$visible:=(oForm.aiKey#"")
OBJECT SET VISIBLE:C603(*; "btnAI"; $visible)  // toolbar & sidebar

OBJECT SET VISIBLE:C603(*; "Separator_AI"; $visible)  // sidebar
OBJECT SET VISIBLE:C603(*; "sepLbl_AI"; $visible)  // sidebar

If ($visible)
	
	If (Not:C34(Undefined:C82(Form:C1466.selection))) && (Not:C34(Undefined:C82(Form:C1466.selection.type)))
		If (Form:C1466.selection.type=2)  // static picture
			$enabled:=False:C215
		Else 
			$enabled:=True:C214
		End if 
	Else 
		$enabled:=False:C215
	End if 
	
	OBJECT SET ENABLED:C1123(*; "btnAI"; $enabled)  // toolbar & sidebar
	
End if 