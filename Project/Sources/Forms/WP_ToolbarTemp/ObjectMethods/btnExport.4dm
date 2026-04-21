var $action : Text

$action:=MENU_Display("Export")

If ($action#"")
	MENU_Execute($action)
End if 
