C_COLLECTION:C1488($col)
C_OBJECT:C1216($formula)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		//ARRAY TEXT($_AllowedMethods; 0)
		//APPEND TO ARRAY($_AllowedMethods; "zGetSamplePict")
		//APPEND TO ARRAY($_AllowedMethods; "zGetSamplePictBW")
		
		//SET ALLOWED METHODS($_AllowedMethods)
		
		
		//$col:=WP Get elements([SAMPLE]WP; wk type image anchored)
		//If ($col.length>0)
		//$formula:=Formula(zGetSamplePict)
		//WP SET ATTRIBUTES($col[0]; wk image formula; $formula)
		//End if 
		
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
