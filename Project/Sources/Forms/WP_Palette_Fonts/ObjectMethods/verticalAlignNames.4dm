C_POINTER:C301($ptrText)
C_POINTER:C301($ptrValue)
C_LONGINT:C283($value)

$ptrText:=OBJECT Get pointer:C1124(Object named:K67:5;"verticalAlignNames")
$ptrValue:=OBJECT Get pointer:C1124(Object named:K67:5;"verticalAlignValues")

$value:=$ptrValue->{$ptrText->}

WP_SetFontVertAlign (Form:C1466.selection;$value)


