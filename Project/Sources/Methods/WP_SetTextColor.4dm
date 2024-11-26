//%attributes = {"invisible":true}
#DECLARE($range : Object; $color : Integer)

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range; wk text color:K81:64; $color)
End if 
