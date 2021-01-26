C_POINTER:C301($ptrArrayNames; $ptrArrayValues)

C_LONGINT:C283($paletteID)
$paletteID:=1

C_BOOLEAN:C305($setupOK)

C_LONGINT:C283($typeSelection)
$typeSelection:=Form:C1466.selection.type


Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		InitFontLists
		
		//-------------------------------------------
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "underlineStylesNames")
		$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "underlineStylesValues")
		
		ARRAY TEXT:C222($ptrArrayNames->; 0)
		ARRAY LONGINT:C221($ptrArrayValues->; 0)
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Solid"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Dotted"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Dashed"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Double"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Semi"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Word"))
		
		APPEND TO ARRAY:C911($ptrArrayValues->; wk solid:K81:115)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk dotted:K81:116)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk dashed:K81:117)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk double:K81:118)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk semi transparent:K81:119)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk word:K81:120)
		
		$ptrArrayNames->:=1
		$ptrArrayValues->:=1
		
		
		//-------------------------------------------
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "linethroughStylesNames")
		$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "linethroughStylesValues")
		
		ARRAY TEXT:C222($ptrArrayNames->; 0)
		ARRAY LONGINT:C221($ptrArrayValues->; 0)
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Solid"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Dotted"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Dashed"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Double"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Semi"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Word"))
		
		APPEND TO ARRAY:C911($ptrArrayValues->; wk solid:K81:115)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk dotted:K81:116)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk dashed:K81:117)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk double:K81:118)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk semi transparent:K81:119)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk word:K81:120)
		
		$ptrArrayNames->:=1
		$ptrArrayValues->:=1
		
		
		
		//-------------------------------------------
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "verticalAlignNames")
		$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "verticalAlignValues")
		
		ARRAY TEXT:C222($ptrArrayNames->; 0)
		ARRAY LONGINT:C221($ptrArrayValues->; 0)
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Baseline"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Superscript"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Subscript"))
		
		APPEND TO ARRAY:C911($ptrArrayValues->; wk baseline:K81:102)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk superscript:K81:103)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk subscript:K81:104)
		
		$ptrArrayNames->:=1
		$ptrArrayValues->:=1
		
		//-------------------------------------------
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "textTransformNames")
		$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "textTransformValues")
		
		ARRAY TEXT:C222($ptrArrayNames->; 0)
		ARRAY LONGINT:C221($ptrArrayValues->; 0)
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("TextTransformNone"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Capitalize"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Lowercase"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Uppercase"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("SmallUppercase"))
		
		APPEND TO ARRAY:C911($ptrArrayValues->; wk none:K81:91)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk capitalize:K81:163)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk lowercase:K81:121)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk uppercase:K81:122)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk small uppercase:K81:123)
		
		$ptrArrayNames->:=1
		$ptrArrayValues->:=1
		
		skinAppliedSub:=UI_ApplySkin
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (Not:C34(skinAppliedSub))
			// 2nd chance
			skinAppliedSub:=UI_ApplySkin
		End if 
		
		// UI_PaletteFonts moved from here…
		
		If ($setupOK) & ($typeSelection#2)
			
			WP_GetFontInfo(Form:C1466.selection)  // font, size, weight, textcolor
			
			WP_GetBackgroundColor(Form:C1466.selection)
			
			//wk text underline color
			//wk text underline style
			//wk text linethrough color
			//wk text linethrough style
			
			WP_GetTextUnderline(Form:C1466.selection)
			
			WP_GetFontVertAlign(Form:C1466.selection)
			
			WP_GetTextTransform(Form:C1466.selection)
			
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
