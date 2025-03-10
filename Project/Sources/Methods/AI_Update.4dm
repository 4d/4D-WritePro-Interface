//%attributes = {}
#DECLARE($action : Text; $selection : Object)

Case of 
	: ($action="Context")
		Form:C1466.wpSelection:=$selection
		
	: ($action="Close")
		CANCEL:C270
		
End case 