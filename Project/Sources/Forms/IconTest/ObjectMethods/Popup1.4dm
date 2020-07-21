Case of 
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_toolbars;0)
		APPEND TO ARRAY:C911(_toolbars;"Toolbar1")
		APPEND TO ARRAY:C911(_toolbars;"Toolbar2")
		
		_toolbars:=1
		
		ARRAY TEXT:C222(_sizes;0)
		APPEND TO ARRAY:C911(_sizes;"24")
		APPEND TO ARRAY:C911(_sizes;"32")
		APPEND TO ARRAY:C911(_sizes;"48")
		
		_sizes:=2
		
		debug_ReformatButtons 
		
	: (Form event code:C388=On Data Change:K2:15)
		
		debug_ReformatButtons 
		
End case 