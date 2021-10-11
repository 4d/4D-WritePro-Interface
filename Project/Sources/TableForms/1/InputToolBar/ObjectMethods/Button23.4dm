C_OBJECT:C1216($WP_skin)
$WP_skin:=New object:C1471

If (Shift down:C543)
	
	//OB SET($WP_skin; "skinName"; "dark")  //"00"+String(0x00300030))  //"light","dark")//;"00"+String(0x00FF00FF))  //
	//or step by step
	
	If (FORM Get color scheme:C1761="light")
		
		$WP_skin.backgroundColor:=0x00C0D0E0  // un peu bleu
		$WP_skin.fontColor:=0x0060
		$WP_skin.separatorColor:=0x00B0C0D0  // gris bleu 
		$WP_skin.separatorFontColor:=0x00F0FFFF  // bleu pale
		
	Else 
		$WP_skin.backgroundColor:=0x00203020
		$WP_skin.separatorColor:=0x00285828
		$WP_skin.fontColor:=0x00408040
		$WP_skin.separatorFontColor:=0x0050A050
	End if 
	
Else 
	
	//$WP_skin.backgroundColor:=0x00FFFF00
	//OB SET($WP_skin; "skinName"; "light")
	
	$WP_skin:=New object:C1471
	
End if 

WP UpdateWidget("WPtoolbar"; "WParea"; $WP_skin)
