
C_OBJECT:C1216($oCurrent)
$oCurrent:=WP_FillCurrent 

C_PICTURE:C286($pict)
C_POINTER:C301($ptr)

$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndPictPreview")
$ptr->:=$ptr->*0

WP_SetBackgroundPicture ($oCurrent;$pict)
