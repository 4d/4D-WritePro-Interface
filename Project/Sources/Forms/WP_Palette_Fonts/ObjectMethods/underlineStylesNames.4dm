C_LONGINT:C283($color)

C_POINTER:C301($ptrText)
C_POINTER:C301($ptrValue)
C_LONGINT:C283($value)

oForm.cbUnderline:=1

$ptrText:=OBJECT Get pointer:C1124(Object named:K67:5;"underlineStylesNames")
$ptrValue:=OBJECT Get pointer:C1124(Object named:K67:5;"underlineStylesValues")

$value:=$ptrValue->{$ptrText->}

If (OBJECT Get visible:C1075(*;"MultiLineColor"))
	$color:=wk mixed:K81:89
Else 
	OBJECT GET RGB COLORS:C1074(*;"UnderlineColor";$color;$color)
End if 

WP_SetTextUnderline (Form:C1466.selection;$value;$color)
