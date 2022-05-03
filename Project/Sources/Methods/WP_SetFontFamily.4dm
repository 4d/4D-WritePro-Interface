//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_TEXT:C284($2)

C_OBJECT:C1216($range)
C_TEXT:C284($family)

$range:=$1
$family:=$2

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range; wk font family:K81:65; $family)
	WP_SetListFont($range)
End if 
