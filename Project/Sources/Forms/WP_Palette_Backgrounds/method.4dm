
C_POINTER:C301($ptrArrayNames; $ptrArrayValues)
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
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector1"))->:=0  // doc
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector2"))->:=1  //paragraph by default
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector3"))->:=0  // pict
		
		//--------------------------
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndRepeatMode")
		$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndRepeatModeVal")
		
		ARRAY TEXT:C222($ptrArrayNames->; 0)
		ARRAY LONGINT:C221($ptrArrayValues->; 0)
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("None"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Repeat"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("RepeatHor"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("RepeatVert"))
		
		APPEND TO ARRAY:C911($ptrArrayValues->; wk no repeat:K81:109)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk repeat:K81:106)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk repeat x:K81:107)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk repeat y:K81:108)
		
		$ptrArrayNames->:=1
		$ptrArrayValues->:=1
		
		
		//--------------------------
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "bgndSizeHorUnit")
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("auto"))
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
		UI_PaletteImage
		
		If ($setupOK) & ($typeSelection#2)
			
			$oCurrent:=WP_FillCurrent
			
			//WP_GetFrame ($oCurrent)
			
			WP_GetBackgroundURL($oCurrent)
			WP_GetBackgroundPosition($oCurrent)
			WP_GetBackgroundRepeat($oCurrent)
			WP_GetBackgroundClip($oCurrent)
			WP_GetBackgroundOrigin($oCurrent)
			WP_GetBackgroundSize($oCurrent)
			
			
		End if 
		
		//: (Form event=On Close Box)
		//CANCEL
		//_paletteState{$paletteID}:=0
		//CALL PROCESS(Current process)
		
End case 

