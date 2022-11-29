
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
		
		
		TB_setAutomaticActions("Paddings")
		TB_setAutomaticActions("BordersAndRadius")
		
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

