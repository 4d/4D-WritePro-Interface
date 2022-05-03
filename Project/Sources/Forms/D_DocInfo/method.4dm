Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (FORM Get color scheme:C1761="dark")
			
			OBJECT SET RGB COLORS:C628(*; "BackgroundA@"; "#141414"; "#141414")  // very dark grey
			OBJECT SET RGB COLORS:C628(*; "BackgroundB@"; "#282828"; "#282828")  // a bit less dark grey
			
		End if 
		
End case 
