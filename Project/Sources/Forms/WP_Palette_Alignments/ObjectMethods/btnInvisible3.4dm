
C_LONGINT:C283($color)
C_OBJECT:C1216($oCurrent)

$oCurrent:=WP_FillCurrent 

$color:=Call_CustomColorPalette (True:C214;"backgroundColor")

Case of 
	: ($color=-1)
		  // do nothing
	: ($color>=0)
		OBJECT SET RGB COLORS:C628(*;"backgroundColor";$color;$color)
		
		WP_SetBackgroundColor ($oCurrent;$color)
		
	: ($color=-2)  // other…
		OPEN COLOR PICKER:C1304
		GOTO OBJECT:C206(*;"backgroundColor")  // gives the focus to the object that will manage the color…
		
	: ($color=-3)  // transparent 
		
		WP_SetBackgroundColor ($oCurrent;wk transparent:K81:134)
		
End case 

WP_GetBackgroundColor ($oCurrent)