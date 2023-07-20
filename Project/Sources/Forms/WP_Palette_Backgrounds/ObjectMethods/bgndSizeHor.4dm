var $oCurrent : Object

Case of 
		
	: (Form event code:C388=On Getting Focus:K2:7)
		HIGHLIGHT TEXT:C210(*; OBJECT Get name:C1087(Object current:K67:2); 0; MAXLONG:K35:2)
		
	: (Form event code:C388=On Data Change:K2:15)
		
		$oCurrent:=WP_FillCurrent("popup")
		
		UI_PaletteBackgrounds(OBJECT Get name:C1087(Object current:K67:2))
		
		WP_SetBackgroundSize($oCurrent)
		// TEMP for check purpose
		// WP_GetBackgroundSize($oCurrent)
		
		
End case 