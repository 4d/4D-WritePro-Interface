
C_LONGINT:C283($color)

$color:=Call_CustomColorPalette (True:C214;"BackgroundColor")  // true means allow transparency

Case of 
	: ($color=-1)
		  // do nothing
		
	: ($color>=0)
		  // play selectde color
		WP_SetBackgroundColor (Form:C1466.selection;$color)
		OBJECT SET RGB COLORS:C628(*;"BackgroundColor";$color;$color)
		
	: ($color=-2)  // open color picker…
		OPEN COLOR PICKER:C1304
		GOTO OBJECT:C206(*;"BackgroundColor")  // gives the focus to the object that will manage the color…
		
	: ($color=-3)
		  //apply transparency
		WP_SetBackgroundColor (Form:C1466.selection;wk transparent:K81:134)
End case 

WP_GetBackgroundColor (Form:C1466.selection)
