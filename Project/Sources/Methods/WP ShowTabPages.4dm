//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1;$subformName)
C_COLLECTION:C1488($2;$tabs)


If (Count parameters:C259>=2)
	$subformName:=$1
	$tabs:=$2
	EXECUTE METHOD IN SUBFORM:C1085($subformName;"WP_ShowTabPages";*;$tabs)
End if 
