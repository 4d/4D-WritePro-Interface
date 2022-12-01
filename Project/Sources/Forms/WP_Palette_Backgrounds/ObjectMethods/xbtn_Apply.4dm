
C_PICTURE:C286($pict)
C_POINTER:C301($ptr)
C_OBJECT:C1216($oCurrent)

$oCurrent:=WP_FillCurrent("popup")

If ($oCurrent#Null:C1517)
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndPictPreview")
	$pict:=$ptr->
	WP_SetBackgroundPicture($oCurrent; $pict)
	
Else 
	
	ALERT:C41("not available yet ffor this target")
	
End if 