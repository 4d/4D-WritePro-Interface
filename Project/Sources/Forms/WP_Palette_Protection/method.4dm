C_BOOLEAN:C305($setupOK)

//$paletteID:=11

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		//Form.protectionEnabled:=False
		//Form.tableProtected:=0
		
		oForm.skinAppliedSub:=UI_ApplySkin
		
		If (Form:C1466#Null:C1517)
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
		End if 
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (oForm.skinAppliedSub=False:C215)  // may have changed on bound variable change
			oForm.skinAppliedSub:=UI_ApplySkin
		End if 
		
		//Form.protectionEnabled:=WP_GetDocumentProtection (Form.selection.owner)
		
		//Form.paragraphProtected:=WP_GetParagraphProtection (Form.selection)
		//Form.tableProtected:=WP_GetTableProtection (Form.selection)
		//Form.rowProtected:=WP_GetRowProtection (Form.selection)
		//Form.cellProtected:=WP_GetCellProtection (Form.selection)
		
		WP_GetProtections(Form:C1466.selection)
		
		UI_PaletteProtect
		
End case 

