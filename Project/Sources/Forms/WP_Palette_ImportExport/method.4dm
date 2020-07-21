
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		skinAppliedSub:=UI_ApplySkin 
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin 
		End if 
		
		
		UI_PaletteImportExport 
		
		
	: (Form event code:C388=On Unload:K2:2)
		
End case 
