C_TEXT:C284($rgbColor)
C_TEXT:C284($id)

Case of 
	: (Form event code:C388=On Mouse Move:K2:35)
		$id:=SVG Find element ID by coordinates:C1054(Self:C308->;mousex;mousey)
		If ($id#"")
			SVG GET ATTRIBUTE:C1056(Self:C308->;$id;"fill";$rgbColor)
			wp_customColor:=TOOL_ColorRgbTextToColorRgbLong ($rgbColor)
			OBJECT SET RGB COLORS:C628(*;"sample";0;wp_customColor)
		End if 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		$id:=SVG Find element ID by coordinates:C1054(Self:C308->;mousex;mousey)
		If ($id#"")
			SVG GET ATTRIBUTE:C1056(Self:C308->;$id;"fill";$rgbColor)
			wp_customColor:=TOOL_ColorRgbTextToColorRgbLong ($rgbColor)
			ACCEPT:C269
		End if 
		
End case 
