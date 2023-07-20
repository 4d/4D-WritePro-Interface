
C_POINTER:C301($ptrArrayNames; $ptrArrayValues; $ptrCSS)
C_LONGINT:C283($paletteID)
C_BOOLEAN:C305($setupOK)
C_OBJECT:C1216($oCurrent)

$paletteID:=5

C_LONGINT:C283($typeSelection)
$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		OBJECT SET STYLE SHEET:C1257(*; "@"; Automatic style sheet_additional:K14:14)
		
		TB_setAutomaticActions("background")
		
		
		oForm.bgndSizeHor:=0  // Input Hor.
		oForm.bgndSizeVert:=0  // Input Vert.
		
		oForm.horizontalSizeUnits:=New object:C1471  // Dropdown Hor.
		
		oForm.horizontalSizeUnits.values:=New collection:C1472()
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("auto"))
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("cover"))
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("contain"))
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("pct"))
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("mm"))
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("cm"))
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("inches"))
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("pt"))
		oForm.horizontalSizeUnits.values.push(Get localized string:C991("pixels"))
		
		oForm.horizontalSizeUnits.css:=New collection:C1472()
		oForm.horizontalSizeUnits.css.push("auto")
		oForm.horizontalSizeUnits.css.push("cover")
		oForm.horizontalSizeUnits.css.push("contain")
		oForm.horizontalSizeUnits.css.push("%")
		oForm.horizontalSizeUnits.css.push("mm")
		oForm.horizontalSizeUnits.css.push("cm")
		oForm.horizontalSizeUnits.css.push("in")
		oForm.horizontalSizeUnits.css.push("pt")
		oForm.horizontalSizeUnits.css.push("px")
		
		oForm.horizontalSizeUnits.memoUnit:=""
		
		oForm.horizontalSizeUnits.index:=0
		
		
		
		oForm.verticalSizeUnits:=New object:C1471  // Dropdown Vert.
		
		oForm.verticalSizeUnits.values:=New collection:C1472()
		oForm.verticalSizeUnits.values.push(Get localized string:C991("auto"))
		oForm.verticalSizeUnits.values.push(Get localized string:C991("pct"))
		oForm.verticalSizeUnits.values.push(Get localized string:C991("mm"))
		oForm.verticalSizeUnits.values.push(Get localized string:C991("cm"))
		oForm.verticalSizeUnits.values.push(Get localized string:C991("inches"))
		oForm.verticalSizeUnits.values.push(Get localized string:C991("pt"))
		oForm.verticalSizeUnits.values.push(Get localized string:C991("pixels"))
		
		oForm.verticalSizeUnits.css:=New collection:C1472()
		oForm.verticalSizeUnits.css.push("auto")
		oForm.verticalSizeUnits.css.push("%")
		oForm.verticalSizeUnits.css.push("mm")
		oForm.verticalSizeUnits.css.push("cm")
		oForm.verticalSizeUnits.css.push("in")
		oForm.verticalSizeUnits.css.push("pt")
		oForm.verticalSizeUnits.css.push("px")
		
		oForm.verticalSizeUnits.memoUnit:=""
		
		oForm.verticalSizeUnits.index:=0
		
		
		
		
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
		
		UI_PaletteBackgrounds
		
		UI_PaletteImage(False:C215)  // some items in the palette are focusable, so must ignore focus
		
		If ($setupOK)  //& ($typeSelection#2)
			
			$oCurrent:=WP_FillCurrent("popup")
			WP_GetBackgroundURL($oCurrent)
			WP_GetBackgroundSize($oCurrent)
			
		End if 
		
End case 

