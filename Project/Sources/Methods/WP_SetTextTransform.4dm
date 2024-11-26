//%attributes = {"invisible":true}
#DECLARE($range : Object; $transform : Integer)

If (Not:C34(OB Is empty:C1297($range)))
	WP SET ATTRIBUTES:C1342($range; wk text transform:K81:70; $transform)
End if 
