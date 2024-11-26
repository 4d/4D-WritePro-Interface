//%attributes = {"invisible":true}
#DECLARE($range : Object; $color : Integer)

If (Not:C34(OB Is empty:C1297($range)))
	
	If ($color>=0) | ($color=-1)
		WP SET ATTRIBUTES:C1342($range; wk text linethrough color:K81:76; $color)
	End if 
	
End if 