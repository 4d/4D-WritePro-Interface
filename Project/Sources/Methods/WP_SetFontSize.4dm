//%attributes = {"invisible":true}
#DECLARE($range : Object; $size : Integer)

If (Not:C34(OB Is empty:C1297($range))) && ($range.type#2)
	// set the size (always in pt)
	//WP RESET ATTRIBUTES($range;wk style sheet)  //†††
	WP SET ATTRIBUTES:C1342($range; wk font size:K81:66; $size)
End if 

