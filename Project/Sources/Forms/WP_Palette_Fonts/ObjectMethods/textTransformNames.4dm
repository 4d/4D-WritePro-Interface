C_POINTER:C301($ptrText)
C_POINTER:C301($ptrValue)
C_LONGINT:C283($value)

$ptrText:=OBJECT Get pointer:C1124(Object named:K67:5;"textTransformNames")
$ptrValue:=OBJECT Get pointer:C1124(Object named:K67:5;"textTransformValues")

$value:=$ptrValue->{$ptrText->}

WP_SetTextTransform (Form:C1466.selection;$value)


