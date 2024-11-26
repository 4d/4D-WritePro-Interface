
var $pict : Picture
var $ptr : Pointer
var $oCurrent : Object

$oCurrent:=WP_FillCurrent("popup")

If ($oCurrent#Null:C1517)
	
	//clear preview
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndPictPreview")
	$ptr->:=$ptr->*0
	
	// reset attribute
	WP_SetBackgroundPicture($oCurrent; $pict)
	
	// 
	WP_GetBackgroundURL($oCurrent)
	WP_GetBackgroundSize($oCurrent)
	
End if 