var $color; $style : Integer
var $ptrStyleNames; $ptrStyleValues : Pointer

Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT SET VISIBLE:C603(*; "FakeFocusUnderlineColor"; True:C214)
		OBJECT SET VISIBLE:C603(*; "FakeFocusFontColor"; False:C215)
		
	: (Form event code:C388=On Losing Focus:K2:8)
		OBJECT SET VISIBLE:C603(*; "FakeFocusUnderlineColor"; False:C215)
		OBJECT SET VISIBLE:C603(*; "FakeFocusFontColor"; True:C214)
		
	: (Form event code:C388=On After Edit:K2:43)
		OBJECT GET RGB COLORS:C1074(Self:C308->; $color)  // get the color of the text
		OBJECT SET RGB COLORS:C628(Self:C308->; $color; $color)  // set the same color on the background
		
		$ptrStyleNames:=OBJECT Get pointer:C1124(Object named:K67:5; "underlineStylesNames")
		$ptrStyleValues:=OBJECT Get pointer:C1124(Object named:K67:5; "underlineStylesValues")
		$style:=$ptrStyleValues->{$ptrStyleNames->}
		
		WP_SetTextUnderline(Form:C1466.selection; $style; $color)
		
End case 
