//%attributes = {"invisible":true}
#DECLARE($range : Object; $color : Integer)

If (OB Is empty:C1297($range))\
 || ($color<wk transparent:K81:134)
	
	return 
	
End if 

WP SET ATTRIBUTES:C1342($range; wk text underline color:K81:74; $color)