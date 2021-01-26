C_LONGINT:C283(wp_tabList)

C_BOOLEAN:C305($setupOK)

C_LONGINT:C283($paletteID)
$paletteID:=3

C_LONGINT:C283($typeSelection)
$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		OBJECT SET STYLE SHEET:C1257(*; "@"; Automatic style sheet_additional:K14:14)
		
		skinAppliedSub:=UI_ApplySkin
		SET TIMER:C645(-1)
		
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin
		End if 
		
		UI_PaletteBookMarks
		
		If ($setupOK) & ($typeSelection#2)
			WP_GetBookmarks
		End if 
		
	: (Form event code:C388=On Unload:K2:2)
		
End case 
