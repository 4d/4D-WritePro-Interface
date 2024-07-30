//%attributes = {"invisible":true}
#DECLARE($range : Object; $size : Real)  // ACI0104990 Pat Bensky

If (Not:C34(OB Is empty:C1297($range))) && ($range.type#2)
	If ($size<1)  // interface should not allow this, just in case…
		$size:=1
	End if 
	// set the size (always in pt)
	//WP RESET ATTRIBUTES($range;wk style sheet)  //†††
	WP SET ATTRIBUTES:C1342($range; wk font size:K81:66; $size)
	oForm.fontSize:=$size
End if 

