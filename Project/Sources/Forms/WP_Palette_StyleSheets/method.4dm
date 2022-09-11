//C_LONGINT(wp_tabList)

C_BOOLEAN:C305($setupOK)

//C_LONGINT($paletteID)
//$paletteID:=3


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		If (Undefined:C82(oForm.styleSheet))
			oForm.styleSheet:=New object:C1471
			oForm.styleSheet.btnType:=New collection:C1472(1; 0; 0; 0; 0; 0)
			oForm.styleSheet.btnValue:=New collection:C1472(wk type paragraph:K81:191; wk type default:K81:190; wk type image:K81:192; wk type table:K81:222; wk type table row:K81:223; wk type table cell:K81:224)
		End if 
		
		// temporarly
		OBJECT SET ENABLED:C1123(*; "Stylesheet_Type3"; False:C215)
		OBJECT SET ENABLED:C1123(*; "Stylesheet_Type4"; False:C215)
		OBJECT SET ENABLED:C1123(*; "Stylesheet_Type5"; False:C215)
		OBJECT SET ENABLED:C1123(*; "Stylesheet_Type6"; False:C215)
		
		
		//If (Form.selection.type=2)
		//// static pict selected
		//Else 
		//WP_GetStyleSheets
		//End if 
		
		//OBJECT SET STYLE SHEET(*;"@";Automatic style sheet_additional)
		
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
		
		If (Form:C1466.selection.type=2)
			// static pict selected
		Else 
			WP_GetStyleSheets
		End if 
		
		UI_PaletteStylesheets
		
		
		//: (Form event=On Unload)
		
End case 
