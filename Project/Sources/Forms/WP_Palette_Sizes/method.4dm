
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
		
		skinAppliedSub:=UI_ApplySkin
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin
		End if 
		
		UI_PaletteSizes
		
		If ($setupOK) & ($typeSelection#2)
			
			WP_GetUserUnit(Form:C1466.selection[wk owner:K81:168])
			WP_GetSizes(Form:C1466.paragraphRange; "paragraph")
			
			WP_GetSizes(Form:C1466.imageRange; "picture")  //ACI0100269
			WP_GetImageUrl(Form:C1466.imageRange)  //ACI0100269
			
		End if 
		
End case 
