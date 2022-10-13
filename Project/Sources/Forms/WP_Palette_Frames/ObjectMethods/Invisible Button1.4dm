//C_OBJECT($oCurrent)
//$oCurrent:=WP_FillCurrent

//C_LONGINT($i; $NewVal)

//ARRAY POINTER($_pCB; 4)
//$_pCB{1}:=OBJECT Get pointer(Object named; "CB1")
//$_pCB{2}:=OBJECT Get pointer(Object named; "CB2")
//$_pCB{3}:=OBJECT Get pointer(Object named; "CB3")
//$_pCB{4}:=OBJECT Get pointer(Object named; "CB4")

//If (($_pCB{1}->)=0)
//$NewVal:=1
//Else   // checked or semi-checked
//$NewVal:=0
//End if 

//For ($i; 1; 4)
//$_pCB{$i}->:=$NewVal
//End for 

//WP_SetFrame($oCurrent; wk border style)
//WP_SetFrame($oCurrent; wk border width)
//WP_SetFrame($oCurrent; wk border color)
