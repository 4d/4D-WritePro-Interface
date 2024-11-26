//%attributes = {"invisible":true}
#DECLARE($range : Object; $verticalAlign : Integer)

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range; wk vertical align:K81:9; $verticalAlign)
End if 
