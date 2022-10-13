
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
		
		//(OBJECT Get pointer(Object named; "CB1"))->:=0
		//(OBJECT Get pointer(Object named; "CB2"))->:=0
		//(OBJECT Get pointer(Object named; "CB3"))->:=0
		//(OBJECT Get pointer(Object named; "CB4"))->:=0
		
		//(OBJECT Get pointer(Object named; "rb1"))->:=1
		//(OBJECT Get pointer(Object named; "rb2"))->:=0
		//(OBJECT Get pointer(Object named; "rb3"))->:=0
		
		//$ptrArrayNames:=OBJECT Get pointer(Object named; "borderStyleNames")
		//$ptrArrayValues:=OBJECT Get pointer(Object named; "borderStyleValues")
		
		//ARRAY TEXT($ptrArrayNames->; 0)
		//ARRAY LONGINT($ptrArrayValues->; 0)
		
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Solid"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Dotted"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Dashed"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Double"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Groove"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Ridge"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Inset"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Outset"))
		
		//APPEND TO ARRAY($ptrArrayValues->; wk solid)
		//APPEND TO ARRAY($ptrArrayValues->; wk dotted)
		//APPEND TO ARRAY($ptrArrayValues->; wk dashed)
		//APPEND TO ARRAY($ptrArrayValues->; wk double)
		//APPEND TO ARRAY($ptrArrayValues->; wk groove)
		//APPEND TO ARRAY($ptrArrayValues->; wk ridge)
		//APPEND TO ARRAY($ptrArrayValues->; wk inset)
		//APPEND TO ARRAY($ptrArrayValues->; wk outset)
		
		//$ptrArrayNames->:=1
		//$ptrArrayValues->:=1
		
		//(OBJECT Get pointer(Object named; "borderWidthRuler"))->:=1
		//(OBJECT Get pointer(Object named; "borderWidthInput"))->:=1
		
		//(OBJECT Get pointer(Object named; "borderRadiusRuler"))->:=0
		//(OBJECT Get pointer(Object named; "borderRadiusinput"))->:=0
		
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
		
		//UI_PaletteFrames
		
		If ($setupOK)  // & (s e lectionType#2)
			
			$oCurrent:=WP_FillCurrent
			
			//Removed and replaced by standard actions (or menus)
			//WP_GetFrame($oCurrent)
			//WP_GetMargins($oCurrent; wk padding)
			
			UI_PaletteFrames
			
		End if 
		
		//: (Form event=On Close Box)
		//CANCEL
		//_paletteState{$paletteID}:=0
		
End case 

