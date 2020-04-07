C_OBJECT:C1216($oCurrent)
C_LONGINT:C283($repeatModeVal)

$oCurrent:=WP_FillCurrent 

$repeatModeVal:=(OBJECT Get pointer:C1124(Object named:K67:5;"bgndRepeatModeVal"))->{Self:C308->}

WP_SetBackgroundRepeat ($oCurrent;$repeatModeVal)