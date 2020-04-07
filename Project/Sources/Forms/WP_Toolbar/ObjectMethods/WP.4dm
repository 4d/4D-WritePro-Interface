C_POINTER:C301($ptr)
C_OBJECT:C1216($wpRange)

  // update font in selection
$ptr:=OBJECT Get pointer:C1124(Object subform container:K67:4)
If (Not:C34(Is nil pointer:C315($ptr)))
	If (OB Is defined:C1231($ptr->;"selection"))
		$wpRange:=OB Get:C1224($ptr->;"selection")
		
		ARRAY TEXT:C222(WP_fontStyle;0)
		ARRAY TEXT:C222(WP_fontLongName;0)
		FONT STYLE LIST:C1362(WP_fontFamilly{WP_fontFamilly};WP_fontStyle;WP_fontLongName)
		WP_fontStyle:=1
		WP_fontLongName:=1
		
		WP SET ATTRIBUTES:C1342($wpRange;wk font:K81:69;WP_fontLongName{WP_fontStyle})
		
	End if 
End if 
