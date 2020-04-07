C_LONGINT:C283($color;$style)

C_POINTER:C301($ptrStyleNames)
C_POINTER:C301($ptrStyleValues)

If (Self:C308->=2)
	Self:C308->:=0
End if 

$ptrStyleNames:=OBJECT Get pointer:C1124(Object named:K67:5;"linethroughStylesNames")
$ptrStyleValues:=OBJECT Get pointer:C1124(Object named:K67:5;"linethroughStylesValues")

If (Self:C308->=0)
	
	$style:=wk none:K81:91
	$color:=0
	
	If ($ptrStyleNames->=0)
		$ptrStyleNames->:=1
	End if 
	
	  //OBJECT SET VISIBLE(*;"MultiLinethroughColor";False)
	  //OBJECT SET RGB COLORS(*;"linethroughColor";0;0)
	
Else 
	
	  //OBJECT GET RGB COLORS(*;"linethroughColor";$color;$color)
	$color:=-1
	$style:=$ptrStyleValues->{$ptrStyleNames->}
	
End if 


WP_SetTextLinetrough (Form:C1466.selection;$style;$color)
WP_GetTextUnderline (Form:C1466.selection)  // to set interface