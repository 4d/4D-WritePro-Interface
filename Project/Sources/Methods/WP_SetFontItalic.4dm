//%attributes = {"invisible":true}
#DECLARE($range : Object; $style : Integer)

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range; wk font italic:K81:67; $style)
	WP_SetListFont($range)
End if 
