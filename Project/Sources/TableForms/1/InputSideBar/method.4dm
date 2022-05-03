C_COLLECTION:C1488($col)
C_OBJECT:C1216($formula)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222($_AllowedMethods; 0)
		APPEND TO ARRAY:C911($_AllowedMethods; "zGetSamplePict")
		APPEND TO ARRAY:C911($_AllowedMethods; "zGetSamplePictBW")
		
		SET ALLOWED METHODS:C805($_AllowedMethods)
		
		
		$col:=WP Get elements:C1550([SAMPLE:1]WP:2; wk type image anchored:K81:248)
		If ($col.length>0)
			$formula:=Formula:C1597(zGetSamplePict)
			WP SET ATTRIBUTES:C1342($col[0]; wk image formula:K81:305; $formula)
		End if 
		
		//C_OBJECT($WP_skin)
		//$WP_skin:=New object
		
		//If (FORM Get color scheme="light")
		//$WP_skin.backgroundColor:=0x00C0D0E0  // un peu bleu
		//$WP_skin.fontColor:=0x0060
		//$WP_skin.separatorColor:=0x00B0C0D0  // gris bleu 
		//$WP_skin.separatorFontColor:=0x00F0FFFF  // bleu pale
		
		//Else 
		//$WP_skin.backgroundColor:=0x00707870  // gris vert
		//$WP_skin.fontColor:=0x00C0FFC0
		
		//$WP_skin.separatorColor:=0x00202820  // un peu vert
		//$WP_skin.separatorFontColor:=0x00A0C0A0
		//End if 
		
		//WP UpdateWidget("WPwidget"; "WParea"; $WP_skin)
		
		//SET TIMER(10)
		
		
	: (Form event code:C388=On Timer:K2:25)
		//SET TIMER(0)
		
		
End case 
