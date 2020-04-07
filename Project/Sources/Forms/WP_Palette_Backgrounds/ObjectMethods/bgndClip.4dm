C_OBJECT:C1216($oCurrent)
C_LONGINT:C283($clipVal)

$oCurrent:=WP_FillCurrent 

$clipVal:=(OBJECT Get pointer:C1124(Object named:K67:5;"bgndClipVal"))->{Self:C308->}

WP_SetBackgroundClip ($oCurrent;$clipVal)