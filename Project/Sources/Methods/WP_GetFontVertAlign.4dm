//%attributes = {"invisible":true}
#DECLARE($range : Object)

var $p; $verticalAlign : Integer
var $ptrVerticalAlignNames; $ptrVerticalAlignValues : Pointer

If (Not:C34(OB Is empty:C1297($range)))
	
	$ptrVerticalAlignNames:=OBJECT Get pointer:C1124(Object named:K67:5; "verticalAlignNames")
	$ptrVerticalAlignValues:=OBJECT Get pointer:C1124(Object named:K67:5; "verticalAlignValues")
	
	WP Get attributes:C1345($range; wk vertical align:K81:9; $verticalAlign)
	$p:=Find in array:C230($ptrVerticalAlignValues->; $verticalAlign)
	If ($p>0)
		$ptrVerticalAlignNames->:=$p
	Else 
		$ptrVerticalAlignNames->:=0
	End if 
	
End if 