C_OBJECT:C1216($oCurrent)
$oCurrent:=WP_FillCurrent 

Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		ResetIfMixed 
		
	: (Form event code:C388=On Data Change:K2:15)
		WP_SetMargins ($oCurrent;wk margin bottom:K81:14;Self:C308->)
		
End case 