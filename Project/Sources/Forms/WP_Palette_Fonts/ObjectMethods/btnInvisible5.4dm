var $color : Integer

$color:=Call_CustomColorPalette(False:C215; "UnderlineColor")  // false means do not allow transparency"

If ($color=-1)
	// do nothing
Else 
	OBJECT SET VISIBLE:C603(*; "MultiLinethroughColor"; False:C215)
	//(OBJECT Get pointer(Object named;"cbUnderline"))->:=1
	oForm.cbLinethrough:=1
	Case of 
			
		: ($color>=0)
			
			OBJECT SET RGB COLORS:C628(*; "linethroughColor"; $color; $color)
			
			WP_SetTextLinetrough(Form:C1466.selection; $color)
			
		: ($color=-2)  // other…
			
			OPEN COLOR PICKER:C1304
			GOTO OBJECT:C206(*; "linethroughColor")  // gives the focus to the object that will manage the color…"
			
	End case 
End if 
