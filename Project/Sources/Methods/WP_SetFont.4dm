//%attributes = {"invisible":true}
#DECLARE($range : Object; $font : Text)

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range; wk font:K81:69; $font)
	WP_SetListFont($range)
End if 
