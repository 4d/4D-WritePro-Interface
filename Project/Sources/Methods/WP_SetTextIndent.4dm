//%attributes = {"invisible":true}
#DECLARE($range : Object; $indent : Real; $tempUnit : Text)

If (Not:C34(OB Is empty:C1297($range)))
	
	If (Count parameters:C259=3)
		
		$indent:=WP_Convert($indent; $tempUnit; userUnit)
		WP SET ATTRIBUTES:C1342($range; wk text indent:K81:52; $indent)
		
	Else 
		WP SET ATTRIBUTES:C1342($range; wk text indent:K81:52; $indent)
	End if 
	
End if 
