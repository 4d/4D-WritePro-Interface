Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		//WP SET ATTRIBUTES(WParea; wk font bold; wk false)
		//WP SET ATTRIBUTES(WParea; wk font italic; wk false)
		//WP SET ATTRIBUTES(WParea; wk text align; wk left)
		//WP SET ATTRIBUTES(WParea; wk text color; "#000000")
		//WP SET ATTRIBUTES(WParea; wk text linethrough color; wk default)
		//WP SET ATTRIBUTES(WParea; wk text linethrough style; wk none)
		//WP SET ATTRIBUTES(WParea; wk text shadow color; wk transparent)
		//WP SET ATTRIBUTES(WParea; wk text underline style; wk none)
		
		
		ARRAY TEXT:C222($_AllowedMethods; 0)
		APPEND TO ARRAY:C911($_AllowedMethods; "zGetSamplePict")
		APPEND TO ARRAY:C911($_AllowedMethods; "zGetSamplePictBW")
		APPEND TO ARRAY:C911($_AllowedMethods; "zGetEmptyPict")
		
		SET ALLOWED METHODS:C805($_AllowedMethods)
		
		
		C_OBJECT:C1216($WP_skin)
		$WP_skin:=New object:C1471
		
		If (FORM Get color scheme:C1761="light")
			$WP_skin.backgroundColor:=0x00D0D0F0  // un peu bleu
			$WP_skin.separatorColor:=0x00B0B0F0  // gris bleu 
		Else 
			$WP_skin.separatorColor:=0x00202820  // un peu vert
			$WP_skin.backgroundColor:=0x00707870  // gris vert
		End if 
		
		
		//WP UpdateWidget("WPtoolbar"; "WParea")  //; $WP_skin)
		
End case 
