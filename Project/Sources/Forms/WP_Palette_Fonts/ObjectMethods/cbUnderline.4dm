C_LONGINT:C283($color;$style)

C_POINTER:C301($ptrStyleNames)
C_POINTER:C301($ptrStyleValues)

If (Self:C308->=2)
	Self:C308->:=0
End if 

$ptrStyleNames:=OBJECT Get pointer:C1124(Object named:K67:5;"underlineStylesNames")
$ptrStyleValues:=OBJECT Get pointer:C1124(Object named:K67:5;"underlineStylesValues")

If (Self:C308->=0)
	
	$style:=wk none:K81:91
	$color:=0
	
	If ($ptrStyleNames->=0)
		$ptrStyleNames->:=1
	End if 
	
Else 
	
	$color:=-1  // automatic
	$style:=$ptrStyleValues->{$ptrStyleNames->}
	
End if 

WP_SetTextUnderline (Form:C1466.selection;$style;$color)
WP_GetTextUnderline (Form:C1466.selection)  // to set the interface