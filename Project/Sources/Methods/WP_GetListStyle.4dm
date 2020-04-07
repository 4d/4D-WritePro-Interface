//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($oCurrent)

C_POINTER:C301($ptrArrayNames;$ptrArrayValues)
C_LONGINT:C283($p;$list)

$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5;"listStyleNames")
$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5;"listStyleValues")

$oCurrent:=$1
If (Not:C34(OB Is empty:C1297($oCurrent)))
	
	WP GET ATTRIBUTES:C1345($oCurrent;wk list style type:K81:55;$list)
	$p:=Find in array:C230($ptrArrayValues->;$list)
	If ($p>0)
		$ptrArrayNames->:=$p
	End if 
	
End if 
