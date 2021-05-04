
C_POINTER:C301($ptrArrayNames; $ptrArrayValues)
C_LONGINT:C283($paletteID)
C_BOOLEAN:C305($setupOK)
C_OBJECT:C1216($oCurrent)

$paletteID:=5

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		OBJECT SET STYLE SHEET:C1257(*; "@"; Automatic style sheet_additional:K14:14)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector1"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector2"))->:=1  //paragraph by default
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector3"))->:=0
		
		OBJECT SET RGB COLORS:C628(*; "TargetSelector1"; 0x00808080; 0x00808080)
		OBJECT SET RGB COLORS:C628(*; "TargetSelector2"; 0x00FFFFFF; 0x00FFFFFF)
		OBJECT SET RGB COLORS:C628(*; "TargetSelector3"; 0x00FFFFFF; 0x00FFFFFF)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "CB1"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "CB2"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "CB3"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "CB4"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "rb1"))->:=1
		(OBJECT Get pointer:C1124(Object named:K67:5; "rb2"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "rb3"))->:=0
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "borderStyleNames")
		$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "borderStyleValues")
		
		ARRAY TEXT:C222($ptrArrayNames->; 0)
		ARRAY LONGINT:C221($ptrArrayValues->; 0)
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Solid"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Dotted"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Dashed"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Double"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Groove"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Ridge"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Inset"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Outset"))
		
		APPEND TO ARRAY:C911($ptrArrayValues->; wk solid:K81:115)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk dotted:K81:116)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk dashed:K81:117)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk double:K81:118)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk groove:K81:129)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk ridge:K81:130)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk inset:K81:131)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk outset:K81:132)
		
		$ptrArrayNames->:=1
		$ptrArrayValues->:=1
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "borderWidthRuler"))->:=1
		(OBJECT Get pointer:C1124(Object named:K67:5; "borderWidthInput"))->:=1
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "borderRadiusRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "borderRadiusinput"))->:=0
		
		skinAppliedSub:=UI_ApplySkin
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Data Change:K2:15)
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin
		End if 
		
		UI_PaletteFrames
		
		If ($setupOK)  // & (s e lectionType#2)
			
			$oCurrent:=WP_FillCurrent
			
			WP_GetFrame($oCurrent)
			
			WP_GetMargins($oCurrent; wk padding:K81:15)
			
			UI_PaletteFrames
			
		End if 
		
		//: (Form event=On Close Box)
		//CANCEL
		//_paletteState{$paletteID}:=0
		
End case 

