//%attributes = {"invisible":true}
#DECLARE($range : Object; $weight : Integer)

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range; wk font bold:K81:68; $weight)
	WP_SetListFont($range)
End if 
