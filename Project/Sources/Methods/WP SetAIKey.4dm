//%attributes = {"invisible":true,"shared":true}
#DECLARE($key : Text)
var $aiKey : Object

If ($key#"")
	$aiKey:=New shared object:C1526
	Use ($aiKey)
		$aiKey.key:=$key
	End use 
End if 

Use (Storage:C1525)
	If ($key#"")
		Storage:C1525.aiKey:=$aiKey
	Else 
		OB REMOVE:C1226(Storage:C1525; "aiKey")
	End if 
End use 
