C_LONGINT:C283($color)

$color:=Call_CustomColorPalette(False:C215; "ColorSample")  // false means do not allow transparency

Case of 
		
	: ($color>=0)
		OBJECT SET RGB COLORS:C628(*; "ColorSample"; $color; $color)
		WP_SetTextColor(Form:C1466.selection; $color)
		
		SET TIMER:C645(-1)  // update underscore and linethrough colors too
		
	: ($color=-1)
		// closed palette
		
	: ($color=-2)  // other…
		OPEN COLOR PICKER:C1304
		GOTO OBJECT:C206(*; "ColorSample")  // gives the focus to the object that will manage the color…
		
	: ($color=-2)  // transparent (can't happend here)
		
End case 

WP_GetFontInfo(Form:C1466.selection; True:C214)
