
If (False:C215)
	$WP_skin:=New object:C1471
	C_OBJECT:C1216($WP_skin)
	
	OB SET:C1220($WP_skin; "skinName"; "dark")  //"00"+String(0x2060))  //"light","dark")//;"00"+String(0x00FF00FF))  //
	//or step by step
	//$WP_skin.separatorColor:=0x2080
	//$WP_skin.backgroundColor:=0x0040
	//$WP_skin.font:="Optima"
	//$WP_skin.fontSize:=12
	//$WP_skin.fontColor:=0xC0FF
	//$WP_skin.separatorFontColor:=0x00D0D0FF
End if 

WP UpdateWidget("WPwidget"; "WParea")  //; $WP_skin)
