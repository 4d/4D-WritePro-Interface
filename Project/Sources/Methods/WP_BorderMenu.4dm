//%attributes = {"invisible":true}
#DECLARE($where : Text; $withMenu : Boolean)

//C_LONGINT($menu)
var $applyTo; $select; $menuRef : Text

// read the "applyTo"
$applyTo:=UI_GetApplyTo

If ($withMenu)
	
	$menuRef:=Create menu:C408
	
	//APPEND MENU ITEM($menuRef; Get localized string("bordersAll"))
	////APPEND MENU ITEM($menuRef; ak standard action title)
	//SET MENU ITEM PROPERTY($menuRef; -1; Associated standard action name; $applyTo+"/borderStyle"+$where+"?value=solid")
	
	APPEND MENU ITEM:C411($menuRef; Localized string:C991("bordersStyle"))
	//APPEND MENU ITEM($menuRef; ak standard action title)
	SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/borderStyle"+$where)
	
	APPEND MENU ITEM:C411($menuRef; Localized string:C991("bordersColor"))
	//APPEND MENU ITEM($menuRef; ak standard action title)
	SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/borderColor"+$where)
	
	APPEND MENU ITEM:C411($menuRef; Localized string:C991("borderWidth"))
	//APPEND MENU ITEM($menuRef; ak standard action title)
	SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/borderWidth"+$where)
	
	APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/backgroundColor"+$where)
	
	$select:=Dynamic pop up menu:C1006($menuRef)
	
	RELEASE MENU:C978($menuRef)
	
	
Else 
	
	INVOKE ACTION:C1439($applyTo+"/borderStyle"+$where+"?value=solid")
	
	//INVOKE ACTION($applyTo+"/borderColor"+$where+"?value=black")
	//INVOKE ACTION($applyTo+"/borderWidth"+$where+"?value=1pt")
	//INVOKE ACTION($applyTo+"/padding"+$where+"?value=5pt")
	
End if 