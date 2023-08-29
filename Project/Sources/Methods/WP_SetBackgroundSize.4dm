//%attributes = {"invisible":true}
#DECLARE($range : Object)

// <ACI0104082>
var $value1; $value2 : Real
var $attribute1; $attribute2 : Text
If (Not:C34(OB Is empty:C1297($range)))
	
	$value1:=OBJECT Get value:C1743("bgndSizeHor")
	If ($value1>0)
		$attribute1:=String:C10($value1; "&xml")
	End if 
	$attribute1:=$attribute1+oForm.horizontalSizeUnits.css[oForm.horizontalSizeUnits.index]
	
	$value2:=OBJECT Get value:C1743("bgndSizeVert")
	If ($value2>0)
		$attribute2:=String:C10($value2; "&xml")
	End if 
	$attribute2:=$attribute2+oForm.verticalSizeUnits.css[oForm.verticalSizeUnits.index]
	
	WP SET ATTRIBUTES:C1342($range; wk background width:K81:27; $attribute1; wk background height:K81:28; $attribute2)
	
	// </ACI0104082>
End if 