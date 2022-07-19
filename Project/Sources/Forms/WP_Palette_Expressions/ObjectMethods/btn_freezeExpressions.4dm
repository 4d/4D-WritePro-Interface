var $action : Text

$action:=MENU_Display("FreezeFormulas")

If ($action#"")
	MENU_Execute($action)
End if 
