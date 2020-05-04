C_BOOLEAN:C305($setupOK)

  //$paletteID:=11

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.protectionEnabled:=False:C215
		Form:C1466.tableProtected:=0
		
		skinAppliedSub:=UI_ApplySkin 
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Data Change:K2:15)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables 
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin 
		End if 
		
		
		Form:C1466.protectionEnabled:=WP_GetDocumentProtection (Form:C1466.selection.owner)
		
		Form:C1466.paragraphProtected:=WP_GetParagraphProtection (Form:C1466.selection)
		Form:C1466.tableProtected:=WP_GetTableProtection (Form:C1466.selection)
		Form:C1466.rowProtected:=WP_GetRowProtection (Form:C1466.selection)
		Form:C1466.cellProtected:=WP_GetCellProtection (Form:C1466.selection)
		
		UI_PaletteProtect 
		
End case 

