//%attributes = {}
var $format; $action : Text
var $result : Object

ARRAY LONGINT:C221($_events; 0)
$result:=Get action info:C1442("textBox/remove"; ak main form:K76:69)

If ($result.enabled=True:C214)
	APPEND TO ARRAY:C911($_events; On Clicked:K2:4)
	$action:=""
	$format:=";;;;;;;;;;1;;"  // 1 activates the popup triangle
	
Else 
	
	$action:="insertTextBox"
	$format:=";;;;;;;;;;0;;"  //0 removes the popup triangle
End if 

OBJECT SET ACTION:C1259(*; "btn_insertTextArea@"; $action)
OBJECT SET EVENTS:C1239(*; "btn_insertTextArea@"; $_events; Enable events disable others:K42:37)  // maybe none if standard action
OBJECT SET FORMAT:C236(*; "btn_insertTextArea@"; $format)