
C_PICTURE:C286($pict)
C_POINTER:C301($ptr)
C_OBJECT:C1216($oCurrent)

$oCurrent:=WP_FillCurrent("popup")

If ($oCurrent#Null:C1517)
	
	//clear preview
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndPictPreview")
	$ptr->:=$ptr->*0
	
	// reset attribute
	WP_SetBackgroundPicture($oCurrent; $pict)
	
End if 