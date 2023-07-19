
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
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeHorUnit")
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("auto"))
		
		// two new values added 2023/07/19 by RL
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("cover"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("contain"))
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("pct"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("mm"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("cm"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("inches"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("pt"))
		$ptrArrayNames->:=1
		
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeVertUnit")
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("auto"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("pct"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("mm"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("cm"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("inches"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("pt"))
		$ptrArrayNames->:=1
		
		
		// CSS array added 2023/07/19 by RL
		$ptrCSS:=OBJECT Get pointer:C1124(Object named:K67:5; "CSSUnits")
		APPEND TO ARRAY:C911($ptrCSS->; "auto")
		APPEND TO ARRAY:C911($ptrCSS->; "cover")
		APPEND TO ARRAY:C911($ptrCSS->; "contain")
		APPEND TO ARRAY:C911($ptrCSS->; "%")
		APPEND TO ARRAY:C911($ptrCSS->; "mm")
		APPEND TO ARRAY:C911($ptrCSS->; "cm")
		APPEND TO ARRAY:C911($ptrCSS->; "in")
		APPEND TO ARRAY:C911($ptrCSS->; "pt")
		
		
		
		
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

