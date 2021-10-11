//%attributes = {"shared":true,"invisible":true}
  //ACI0099141 fixed 29/01/2019 by RL  (WP SwitchToolbar intead of WP SwichToolbar, without "t")

C_TEXT:C284($1;$2)

C_TEXT:C284($subformName)
C_TEXT:C284($newfolderName)

If (Count parameters:C259>=2)
	
	$subformName:=$1
	$newfolderName:=$2
	
	EXECUTE METHOD IN SUBFORM:C1085($subformName;"WP_SwitchToolbar";*;$newfolderName)  // same here (ACI0099141)
	
End if 

