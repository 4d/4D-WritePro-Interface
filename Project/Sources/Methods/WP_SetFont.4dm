//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)

C_OBJECT:C1216($range)
C_TEXT:C284($font)

$range:=$1
$font:=$2

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range;wk font:K81:69;$font)
End if 
