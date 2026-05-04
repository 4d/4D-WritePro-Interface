var $color:=Call_CustomColorPalette(False:C215; "UnderlineColor")  // False means do not allow transparency"

If ($color=-1)
	
	// Do nothing
	
Else 
	
	OBJECT SET VISIBLE:C603(*; "MultiLineColor"; False:C215)
	
	// (OBJECT Get pointer(Object named;"cbUnderline"))->:=1
	formData.cbUnderline:=1
	
	Case of 
			
			//________________________________________________________________________________
		: ($color>=0)
			
			OBJECT SET RGB COLORS:C628(*; "UnderlineColor"; $color; $color)
			
			WP_SetTextUnderline(Form:C1466.selection; $color)
			
			//________________________________________________________________________________
		: ($color=-2)  // Other…
			
			OPEN COLOR PICKER:C1304
			GOTO OBJECT:C206(*; "UnderlineColor")  // Gives the focus to the object that will manage the color…"
			
			//________________________________________________________________________________
	End case 
End if 