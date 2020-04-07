C_BOOLEAN:C305($setupOK)

  //$paletteID:=11

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		  //If (Undefined(oForm.tables)) | (Shift down)
		
		  //oForm.tables:=New object
		
		  //oForm.tables.shiftLeft:=1
		  //oForm.tables.shiftUp:=0
		
		  //End if 
		
		skinAppliedSub:=UI_ApplySkin 
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Data Change:K2:15)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables 
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin 
		End if 
		
		
		
		WP_GetCellsBackgroundColor (Form:C1466.selection)
		
		UI_PaletteTables 
		
End case 

