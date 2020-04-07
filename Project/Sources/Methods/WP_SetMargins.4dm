//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)
C_REAL:C285($3)
C_TEXT:C284($4)

C_OBJECT:C1216($range)
C_TEXT:C284($target)
C_TEXT:C284($tempUnit)
C_REAL:C285($value)


$range:=$1
$target:=$2
$value:=$3

If (Not:C34(OB Is empty:C1297($range)))
	
	If (Count parameters:C259=4)
		$tempUnit:=$4
		$value:=WP_Convert ($value;$tempUnit;userUnit)
	End if 
	
	WP SET ATTRIBUTES:C1342($range;$target;$value)
	
End if 
