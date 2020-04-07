
C_OBJECT:C1216($oCurrent)
C_LONGINT:C283($originVal)

$oCurrent:=WP_FillCurrent 

$originVal:=(OBJECT Get pointer:C1124(Object named:K67:5;"bgndOriginVal"))->{Self:C308->}

WP_SetBackgroundOrigin ($oCurrent;$originVal)


