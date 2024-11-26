//%attributes = {"shared":true,"invisible":true}
//ACI0099141 fixed 29/01/2019 by RL  (WP SwitchToolbar intead of WP SwichToolbar, without "t")
#DECLARE($subformName : Text; $newfolderName : Text)

If (Count parameters:C259>=2)
	EXECUTE METHOD IN SUBFORM:C1085($subformName; "WP_SwitchToolbar"; *; $newfolderName)  // same here (ACI0099141)
End if 
