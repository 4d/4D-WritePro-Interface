C_OBJECT:C1216($WP_skin)
$WP_skin:=New object:C1471

If (Shift down:C543)
	
	//OB SET($WP_skin; "skinName"; "dark")  //"00"+String(0x00300030))  //"light","dark")//;"00"+String(0x00FF00FF))  //
	//or step by step
	
	If (FORM Get color scheme:C1761="light")
		$WP_skin.backgroundColor:=0x00E2FFFF
		$WP_skin.separatorColor:=0x00D0F0F0
		$WP_skin.fontColor:=0xA0FF
		$WP_skin.separatorFontColor:=0x80C0
		//$WP_skin.font:="Optima"
		//$WP_skin.fontSize:=12
	Else 
		$WP_skin.backgroundColor:=0x00202820
		$WP_skin.separatorColor:=0x00283028
		//$WP_skin.font:="Optima"
		//$WP_skin.fontSize:=12
		$WP_skin.fontColor:=0x00408040
		$WP_skin.separatorFontColor:=0x0050A050
	End if 
	
Else 
	
	//$WP_skin.backgroundColor:=0x00FFFF00
	//OB SET($WP_skin; "skinName"; "light")
	
	$WP_skin:=New object:C1471
	
End if 

WP UpdateWidget("WPwidget"; "WParea"; $WP_skin)