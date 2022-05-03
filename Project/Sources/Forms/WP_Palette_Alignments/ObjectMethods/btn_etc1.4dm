
var $action : Text

$action:=MENU_Display("ColumnsSettings")
If ($action#"")
	MENU_Execute($action)
End if 
