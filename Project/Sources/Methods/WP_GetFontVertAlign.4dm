//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_LONGINT:C283($p)
C_LONGINT:C283($verticalAlign)
C_POINTER:C301($ptrVerticalAlignNames)
C_POINTER:C301($ptrVerticalAlignValues)


$range:=$1

If (Not:C34(OB Is empty:C1297($range)))
	
	$ptrVerticalAlignNames:=OBJECT Get pointer:C1124(Object named:K67:5;"verticalAlignNames")
	$ptrVerticalAlignValues:=OBJECT Get pointer:C1124(Object named:K67:5;"verticalAlignValues")
	
	WP GET ATTRIBUTES:C1345($range;wk vertical align:K81:9;$verticalAlign)
	$p:=Find in array:C230($ptrVerticalAlignValues->;$verticalAlign)
	If ($p>0)
		$ptrVerticalAlignNames->:=$p
	Else 
		$ptrVerticalAlignNames->:=0
	End if 
	
End if 