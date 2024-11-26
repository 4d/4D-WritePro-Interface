//%attributes = {"invisible":true}
#DECLARE($range : Object)

var $ptrArrayNames; $ptrArrayValues : Pointer
var $p; $transform : Integer

If (Not:C34(OB Is empty:C1297($range)))
	
	$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "textTransformNames")
	$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "textTransformValues")
	
	WP Get attributes:C1345($range; wk text transform:K81:70; $transform)
	$p:=Find in array:C230($ptrArrayValues->; $transform)
	If ($p>0)
		$ptrArrayNames->:=$p
	End if 
	
End if 