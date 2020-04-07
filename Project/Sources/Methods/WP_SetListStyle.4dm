//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_POINTER:C301($ptrArrayNames;$ptrArrayValues)

$range:=$1

If (Not:C34(OB Is empty:C1297($range)))
	
	$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5;"listStyleNames")
	$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5;"listStyleValues")
	
	WP SET ATTRIBUTES:C1342($range;wk list style type:K81:55;$ptrArrayValues->{$ptrArrayNames->})
	
End if 


