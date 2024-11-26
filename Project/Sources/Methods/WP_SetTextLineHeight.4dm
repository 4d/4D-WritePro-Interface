//%attributes = {"invisible":true}
#DECLARE($range : Object; $heightValue : Real)

//ACI0098389 (new item added)

var $heightValue_t : Text
var $ptrTextLineHeightUnit : Pointer

If (Not:C34(OB Is empty:C1297($range)))
	
	$ptrTextLineHeightUnit:=OBJECT Get pointer:C1124(Object named:K67:5; "TextLineHeightUnit")
	
	If (($ptrTextLineHeightUnit->)=1)  // "%"
		$heightValue_t:=String:C10($heightValue)+"%"
	Else   //                         "pt"
		$heightValue_t:=String:C10($heightValue)+"pt"
	End if 
	
	WP SET ATTRIBUTES:C1342($range; wk line height:K81:51; $heightValue_t)
End if 
