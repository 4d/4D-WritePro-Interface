var $oCurrent : Object

Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		TB_setAutomaticActions("background")
		
		$oCurrent:=WP_FillCurrent("popup")
		
		WP_GetBackgroundURL($oCurrent)
		WP_GetBackgroundSize($oCurrent)
		
		
End case 