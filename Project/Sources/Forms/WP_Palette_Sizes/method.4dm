var $setupOK : Boolean
var $paletteID; $typeSelection : Integer

$paletteID:=4

$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		//OBJECT SET ENABLED(*; "TargetSelector@"; False)  // fake buttons on the right side
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "rbWidthOption1"))->:=1  //set width by default
		(OBJECT Get pointer:C1124(Object named:K67:5; "rbWidthOption2"))->:=0
		
		oForm.skinAppliedSub:=UI_ApplySkin
		
		//tip for HideEmptyImages
		OBJECT SET HELP TIP:C1181(*; "btn_visibleEmptyImages"; Action info:C1442("visibleEmptyImages").title)
		OBJECT SET HELP TIP:C1181(*; "btn_visibleTableBorders"; Action info:C1442("visibleTableBorders").title)  // 20R6
		
		
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
			
			WP_GetSizes(Form:C1466.paragraphRange; "paragraph")
			
		End if 
		
End case 
