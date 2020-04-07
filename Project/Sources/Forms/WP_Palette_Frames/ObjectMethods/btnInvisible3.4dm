
C_LONGINT:C283($color)
C_OBJECT:C1216($oCurrent)

$color:=Call_CustomColorPalette (False:C215;"borderColor")

If ($color#-1)
	
	If ($color>=0)
		
		OBJECT SET RGB COLORS:C628(*;"borderColor";$color;$color)
		
		$oCurrent:=WP_FillCurrent 
		WP_SetFrame ($oCurrent;wk border color:K81:34)
		
	Else 
		If ($color=-2)  // other…
			OPEN COLOR PICKER:C1304
			GOTO OBJECT:C206(*;"borderColor")  // gives the focus to the object that will manage the color…
		End if 
	End if 
	
End if 