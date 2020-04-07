//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($o_Document)
C_POINTER:C301($ptrArrayNames;$ptrArrayValues)
C_TEXT:C284($unit)
C_LONGINT:C283($p)

$o_Document:=$1

If (Not:C34(OB Is empty:C1297($o_Document)))
	
	WP GET ATTRIBUTES:C1345($o_Document;wk layout unit:K81:78;$unit)
	
	$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5;"UserUnitNames")
	$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5;"UserUnitValues")
	
	$p:=Find in array:C230($ptrArrayValues->;$unit)
	If ($p>0)
		$ptrArrayNames->:=$p
	End if 
	
End if 
