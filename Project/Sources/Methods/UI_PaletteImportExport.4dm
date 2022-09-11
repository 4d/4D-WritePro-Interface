//%attributes = {"invisible":true}
C_OBJECT:C1216($document)
C_BOOLEAN:C305($docProtected)

If (UI_isProtected(True:C214))  // // ACI0103075 //true means take focus into account
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
	// Except TAB buttons
	OBJECT SET ENABLED:C1123(*; "tab@"; True:C214)
	
Else 
	
	OBJECT SET ENABLED:C1123(*; "@"; True:C214)
	OBJECT SET ENTERABLE:C238(*; "@"; True:C214)
	
	
	$document:=Form:C1466.selection.owner
	WP GET ATTRIBUTES:C1345($document; wk protection enabled:K81:307; $docProtected)
	
	If ($docProtected)
		
		OBJECT SET ENABLED:C1123(*; "btnImport@"; False:C215)
		OBJECT SET ENABLED:C1123(*; "btnClear@"; False:C215)
		
	End if 
	
End if 
