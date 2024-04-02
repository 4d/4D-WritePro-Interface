
var $action : Text

$action:=MENU_Display("ParagraphSettings")
If ($action#"")
	MENU_Execute($action)
End if 
