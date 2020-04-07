//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_REAL:C285($2)
C_TEXT:C284($3)

C_OBJECT:C1216($range)
C_REAL:C285($indent)
C_TEXT:C284($tempUnit)


$range:=$1
$indent:=$2

If (Not:C34(OB Is empty:C1297($range)))
	
	If (Count parameters:C259=3)
		
		$tempUnit:=$3
		
		$indent:=WP_Convert ($indent;$tempUnit;userUnit)
		WP SET ATTRIBUTES:C1342($range;wk text indent:K81:52;$indent)
		
	Else 
		WP SET ATTRIBUTES:C1342($range;wk text indent:K81:52;$indent)
	End if 
	
End if 
