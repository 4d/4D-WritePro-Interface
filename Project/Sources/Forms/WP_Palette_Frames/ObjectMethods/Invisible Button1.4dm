C_OBJECT:C1216($oCurrent)
$oCurrent:=WP_FillCurrent 

C_LONGINT:C283($i;$NewVal)

ARRAY POINTER:C280($_pCB;4)
$_pCB{1}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB1")
$_pCB{2}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB2")
$_pCB{3}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB3")
$_pCB{4}:=OBJECT Get pointer:C1124(Object named:K67:5;"CB4")

If (($_pCB{1}->)=0)
	$NewVal:=1
Else   // checked or semi-checked
	$NewVal:=0
End if 

For ($i;1;4)
	$_pCB{$i}->:=$NewVal
End for 

WP_SetFrame ($oCurrent;wk border style:K81:29)
WP_SetFrame ($oCurrent;wk border width:K81:39)
WP_SetFrame ($oCurrent;wk border color:K81:34)
