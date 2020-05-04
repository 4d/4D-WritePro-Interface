C_TEXT:C284($WP_toolbarName)

If (Shift down:C543)
	$WP_toolbarName:="Toolbar1"
Else 
	$WP_toolbarName:="Toolbar2"
End if 
WP SwitchToolbar ("WPtoolbar";$WP_toolbarName)
