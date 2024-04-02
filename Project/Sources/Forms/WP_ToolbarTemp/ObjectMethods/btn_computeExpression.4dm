var $action : Text

$action:=MENU_Display("ComputeFormulas")

If ($action#"")
	MENU_Execute($action)
End if 
