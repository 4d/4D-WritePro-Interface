//%attributes = {"invisible":true}
#DECLARE($range : Object; $family : Text)

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range; wk font family:K81:65; $family)
	WP_SetListFont($range)
End if 
