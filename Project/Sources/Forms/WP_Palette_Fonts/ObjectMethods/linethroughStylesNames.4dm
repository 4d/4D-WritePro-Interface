C_LONGINT:C283($color)

C_POINTER:C301($ptrText)
C_POINTER:C301($ptrValue)
C_LONGINT:C283($value)

oForm.cbLinethrough:=1

$ptrText:=OBJECT Get pointer:C1124(Object named:K67:5;"linethroughStylesNames")
$ptrValue:=OBJECT Get pointer:C1124(Object named:K67:5;"linethroughStylesValues")

$value:=$ptrValue->{$ptrText->}

If (OBJECT Get visible:C1075(*;"MultiLineColor"))
	$color:=wk mixed:K81:89
Else 
	OBJECT GET RGB COLORS:C1074(*;"linethroughColor";$color;$color)
End if 

WP_SetTextLinetrough (Form:C1466.selection;$value;$color)
