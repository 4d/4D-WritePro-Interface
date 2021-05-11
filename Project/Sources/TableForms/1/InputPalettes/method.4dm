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
		
End case 
