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
		SET ALLOWED METHODS:C805($_AllowedMethods)
		
End case 
