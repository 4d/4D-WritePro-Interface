//%attributes = {"invisible":true}

C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_POINTER:C301($ptrArrayNames;$ptrArrayValues)
C_LONGINT:C283($p)
C_LONGINT:C283($transform)

$range:=$1

If (Not:C34(OB Is empty:C1297($range)))
	
	$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5;"textTransformNames")
	$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5;"textTransformValues")
	
	WP GET ATTRIBUTES:C1345($range;wk text transform:K81:70;$transform)
	$p:=Find in array:C230($ptrArrayValues->;$transform)
	If ($p>0)
		$ptrArrayNames->:=$p
	End if 
	
End if 