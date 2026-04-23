var $paletteID; $typeSelection : Integer
var $setupOK : Boolean
var $oCurrent : Object

$paletteID:=5

$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (formData=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			formData:=New object:C1471
		End if 
		
		OBJECT SET STYLE SHEET:C1257(*; "@"; Automatic style sheet_additional:K14:14)
		
		TB_setAutomaticActions("background")
		
		// <ACI0104082>
		formData.bgndSizeHor:=0  // Input Hor.
		formData.bgndSizeVert:=0  // Input Vert.
		
		
		formData.horizontalSizeUnits:=New object:C1471  // Dropdown Hor.
		
		formData.horizontalSizeUnits.values:=New collection:C1472()
		formData.horizontalSizeUnits.values.push(Localized string:C991("auto"))
		formData.horizontalSizeUnits.values.push(Localized string:C991("cover"))
		formData.horizontalSizeUnits.values.push(Localized string:C991("contain"))
		formData.horizontalSizeUnits.values.push(Localized string:C991("pct"))
		formData.horizontalSizeUnits.values.push(Localized string:C991("mm"))
		formData.horizontalSizeUnits.values.push(Localized string:C991("cm"))
		formData.horizontalSizeUnits.values.push(Localized string:C991("inches"))
		formData.horizontalSizeUnits.values.push(Localized string:C991("pt"))
		formData.horizontalSizeUnits.values.push(Localized string:C991("pixels"))
		
		formData.horizontalSizeUnits.css:=New collection:C1472()
		formData.horizontalSizeUnits.css.push("auto")
		formData.horizontalSizeUnits.css.push("cover")
		formData.horizontalSizeUnits.css.push("contain")
		formData.horizontalSizeUnits.css.push("%")
		formData.horizontalSizeUnits.css.push("mm")
		formData.horizontalSizeUnits.css.push("cm")
		formData.horizontalSizeUnits.css.push("in")
		formData.horizontalSizeUnits.css.push("pt")
		formData.horizontalSizeUnits.css.push("px")
		
		formData.horizontalSizeUnits.memoUnit:=""
		
		formData.horizontalSizeUnits.index:=0
		
		
		
		formData.verticalSizeUnits:=New object:C1471  // Dropdown Vert.
		
		formData.verticalSizeUnits.values:=New collection:C1472()
		formData.verticalSizeUnits.values.push(Localized string:C991("auto"))
		formData.verticalSizeUnits.values.push(Localized string:C991("pct"))
		formData.verticalSizeUnits.values.push(Localized string:C991("mm"))
		formData.verticalSizeUnits.values.push(Localized string:C991("cm"))
		formData.verticalSizeUnits.values.push(Localized string:C991("inches"))
		formData.verticalSizeUnits.values.push(Localized string:C991("pt"))
		formData.verticalSizeUnits.values.push(Localized string:C991("pixels"))
		
		formData.verticalSizeUnits.css:=New collection:C1472()
		formData.verticalSizeUnits.css.push("auto")
		formData.verticalSizeUnits.css.push("%")
		formData.verticalSizeUnits.css.push("mm")
		formData.verticalSizeUnits.css.push("cm")
		formData.verticalSizeUnits.css.push("in")
		formData.verticalSizeUnits.css.push("pt")
		formData.verticalSizeUnits.css.push("px")
		
		formData.verticalSizeUnits.memoUnit:=""
		
		formData.verticalSizeUnits.index:=0
		// </ACI0104082>
		
		
		
		formData.skinAppliedSub:=UI_ApplySkin
		
		If (Form:C1466#Null:C1517)
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
		End if 
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (formData.skinAppliedSub=False:C215)  // may have changed on bound variable change
			formData.skinAppliedSub:=UI_ApplySkin
		End if 
		
		UI_PaletteBackgrounds
		
		UI_PaletteImage(False:C215)  // some items in the palette are focusable, so must ignore focus
		
		If ($setupOK)  //& ($typeSelection#2)
			
			$oCurrent:=WP_FillCurrent("popup")
			WP_GetBackgroundURL($oCurrent)
			WP_GetBackgroundSize($oCurrent)
			
		End if 
		
End case 

