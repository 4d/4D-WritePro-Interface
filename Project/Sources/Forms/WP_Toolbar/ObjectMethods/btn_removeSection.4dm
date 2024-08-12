var $action : Text

$action:=MENU_Display("DeleteSections")

If ($action#"")
	MENU_Execute($action)
End if 
