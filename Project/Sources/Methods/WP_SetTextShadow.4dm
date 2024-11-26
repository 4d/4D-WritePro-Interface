//%attributes = {"invisible":true}
#DECLARE($range : Object; $offset : Integer; $color : Integer)


If (Count parameters:C259<3)
	$color:=-1
End if 

If (Not:C34(OB Is empty:C1297($range)))
	
	// set the shadow offset in pt
	WP SET ATTRIBUTES:C1342($range; wk text shadow offset:K81:72; $offset)
	
	If ($color>=0) | ($color=wk transparent:K81:134)
		WP SET ATTRIBUTES:C1342($range; wk text shadow color:K81:71; $color)
	End if 
End if 