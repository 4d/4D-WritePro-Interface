//%attributes = {"shared":true,"invisible":true}
#DECLARE($subformName : Text; $tabs : Collection)

If (Count parameters:C259>=2)
	EXECUTE METHOD IN SUBFORM:C1085($subformName; "WP_ShowTabPages"; *; $tabs)
End if 
