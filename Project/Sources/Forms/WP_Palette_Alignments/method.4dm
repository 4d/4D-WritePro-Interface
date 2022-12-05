
C_POINTER:C301($ptrArrayNames; $ptrArrayValues)
C_POINTER:C301($ptrTextLineHeightUnit)

C_LONGINT:C283($case)
C_BOOLEAN:C305($setupOK)
C_OBJECT:C1216($oCurrent)

C_LONGINT:C283($typeSelection)


$typeSelection:=Form:C1466.selection.type

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (oForm=Null:C1517)  // ACI0101427 when used as a single palette, not as a sub-sub-form
			oForm:=New object:C1471
		End if 
		
		OBJECT SET STYLE SHEET:C1257(*; "@"; Automatic style sheet_additional:K14:14)
		
		//(OBJECT Get pointer(Object named; "TargetSelector1"))->:=0
		//(OBJECT Get pointer(Object named; "TargetSelector2"))->:=1  //paragraph by default
		//(OBJECT Get pointer(Object named; "TargetSelector3"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "btn_alignTextLeft"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "btn_alignTextCenter"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "btn_alignTextRight"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "btn_alignTextJustify"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "textIndentRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "textIndentInput"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "rb1"))->:=1
		(OBJECT Get pointer:C1124(Object named:K67:5; "rb2"))->:=0
		
		//(OBJECT Get pointer(Object named; "MarginLeft"))->:=0
		//(OBJECT Get pointer(Object named; "MarginTop"))->:=0
		//(OBJECT Get pointer(Object named; "MarginRight"))->:=0
		//(OBJECT Get pointer(Object named; "MarginBottom"))->:=0
		//(OBJECT Get pointer(Object named; "marginHorizontalRuler"))->:=0
		//(OBJECT Get pointer(Object named; "marginVerticalRuler"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "textLineHeightRuler"))->:=100
		
		CLEAR VARIABLE:C89(oSettings1)
		CLEAR VARIABLE:C89(oSettings2)
		
		TB_setAutomaticActions("Margins")
		
		//----------------------------------------------------------------
		
		
		$ptrTextLineHeightUnit:=OBJECT Get pointer:C1124(Object named:K67:5; "TextLineHeightUnit")
		ARRAY TEXT:C222($ptrTextLineHeightUnit->; 0)
		APPEND TO ARRAY:C911($ptrTextLineHeightUnit->; "%")
		APPEND TO ARRAY:C911($ptrTextLineHeightUnit->; "pt")
		$ptrTextLineHeightUnit->:=1
		
		//----------------------------------------------------------------
		
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
		
		If ($setupOK)
			
			WP_GetTextIndent(Form:C1466.paragraphRange)
			WP_GetTextLineHeight(Form:C1466.paragraphRange)
			WP_GetBackgroundColor(Form:C1466.paragraphRange)
			
		End if 
		
		UI_PaletteAlignments  //ACI0098389  2018/07/10  (moved at the end of the method…)
		
End case 

