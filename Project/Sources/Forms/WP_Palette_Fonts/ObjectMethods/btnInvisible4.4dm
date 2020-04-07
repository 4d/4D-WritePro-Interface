C_LONGINT:C283($color)
C_LONGINT:C283($offset)

$color:=Call_CustomColorPalette (False:C215;"ColorShadow")  // false means do not allow transparency

If ($color#-1)
	
	oForm.cbShadow:=1
	
	Case of 
		: ($color>=0)
			
			OBJECT SET RGB COLORS:C628(*;"ColorShadow";$color;$color)
			$offset:=oForm.shadowOffset
			If ($offset<1)
				$offset:=1
				oForm.shadowOffset:=1
			End if 
			
			WP_SetTextShadow (Form:C1466.selection;$offset;$color)
			
		: ($color=-2)  // other…
			OPEN COLOR PICKER:C1304
			GOTO OBJECT:C206(*;"ColorShadow")  // gives the focus to the object that will manage the color…
			
	End case 
	
End if 
