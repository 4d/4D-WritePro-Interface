
C_LONGINT:C283($paletteID)
$paletteID:=4

C_POINTER:C301($ptrArrayNames)
C_POINTER:C301($ptrArrayValues)

C_BOOLEAN:C305($setupOK)

C_LONGINT:C283($typeSelection)
$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		OBJECT SET ENABLED:C1123(*; "TargetSelector@"; False:C215)  // fake buttons on the right side
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "rbWidthOption1"))->:=1  //set width by default
		(OBJECT Get pointer:C1124(Object named:K67:5; "rbWidthOption2"))->:=0
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "UserUnitNames")
		$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "UserUnitValues")
		
		ARRAY TEXT:C222($ptrArrayNames->; 0)
		ARRAY TEXT:C222($ptrArrayValues->; 0)
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("cm"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("mm"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("inches"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("pt"))
		
		APPEND TO ARRAY:C911($ptrArrayValues->; wk unit cm:K81:135)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk unit mm:K81:171)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk unit inch:K81:172)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk unit pt:K81:136)
		
		$ptrArrayNames->:=1
		$ptrArrayValues->:=1
		
		oForm.skinAppliedSub:=UI_ApplySkin
		
		//tip for HideEmptyImages
		OBJECT SET HELP TIP:C1181(*; "btn_visibleEmptyImages"; Get action info:C1442("visibleEmptyImages").title)
		
		
		If (Form:C1466#Null:C1517)
			SET TIMER:C645(-1)  // IF events are NOT managed in the area, then Form will be null (ACI0102661)
		End if 
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (oForm.skinAppliedSub=False:C215)  // may have changed on bound variable change
			oForm.skinAppliedSub:=UI_ApplySkin
		End if 
		
		UI_PaletteSizes
		
		If ($setupOK) & ($typeSelection#2)
			
			WP_GetUserUnit(Form:C1466.selection[wk owner:K81:168])
			
			WP_GetSizes(Form:C1466.paragraphRange; "paragraph")
			
			// removed from dial, no more info for pictures v19R5 01/02/2022)
			// WP_GetSizes(Form.imageRange; "picture")  //ACI0100269
			
			// removed from dial, no more info for pictures v19R5 14/02/2022)
			// WP_GetImageUrl(Form.imageRange)  //ACI0100269
			
		End if 
		
End case 
