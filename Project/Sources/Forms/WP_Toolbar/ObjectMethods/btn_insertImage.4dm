//ACI0104098   code factorisation AND back to expression

var $action : Text

$action:=MENU_Display("Image")
If ($action#"")
	MENU_Execute($action)  //pictureInsertURL or pictureEditURL or pictureInsertFormula
End if 
