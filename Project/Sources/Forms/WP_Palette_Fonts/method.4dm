C_LONGINT:C283($paletteID)
C_BOOLEAN:C305($setupOK)
C_LONGINT:C283($typeSelection)

$paletteID:=1
$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		InitFontLists
		
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
		
		// UI_PaletteFonts moved from here…
		
		If ($setupOK) & ($typeSelection#2)
			
			WP_GetFontInfo(Form:C1466.selection)  // font, size, weight, textcolor
			
			WP_GetBackgroundColor(Form:C1466.selection)
			
			WP_GetTextUnderline(Form:C1466.selection)
			
			//WP_GetFontVertAlign(Form.selection)
			
			//WP_GetTextTransform(Form.selection)
			
			WP_GetTextShadow(Form:C1466.selection)
			
		End if 
		
		// …to here
		UI_PaletteFonts
		
		//: (Form event=On Close Box)
		
		//CANCEL
		//_paletteState{$paletteID}:=0
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		ARRAY TEXT:C222(WP_fontFamilly; 0)
		ARRAY TEXT:C222(WP_fontStyle; 0)
		ARRAY TEXT:C222(WP_fontLongName; 0)
		
End case 
