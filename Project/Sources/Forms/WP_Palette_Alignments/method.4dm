
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
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector1"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector2"))->:=1  //paragraph by default
		(OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector3"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "btn_alignLeft"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "btn_alignCenter"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "btn_alignRight"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "btn_alignJustify"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "textIndentRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "textIndentInput"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "rb1"))->:=1
		(OBJECT Get pointer:C1124(Object named:K67:5; "rb2"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "MarginLeft"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "MarginTop"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "MarginRight"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "MarginBottom"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "marginHorizontalRuler"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "marginVerticalRuler"))->:=0
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "textLineHeightRuler"))->:=100
		
		CLEAR VARIABLE:C89(oSettings1)
		CLEAR VARIABLE:C89(oSettings2)
		
		//----------------------------------------------------------------
		
		//$ptrArrayNames:=OBJECT Get pointer(Object named; "listStyleNames")
		//$ptrArrayValues:=OBJECT Get pointer(Object named; "listStyleValues")
		
		//ARRAY TEXT($ptrArrayNames->; 0)
		//ARRAY LONGINT($ptrArrayValues->; 0)
		
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("None"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Disc"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Circle"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Square"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("HollowSquare"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Diamond"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Club"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("123"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("010203"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("abcLow"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("abcCAP"))
		//APPEND TO ARRAY($ptrArrayNames->; Get localized string("Roman"))
		
		//APPEND TO ARRAY($ptrArrayValues->; wk none)
		//APPEND TO ARRAY($ptrArrayValues->; wk disc)
		//APPEND TO ARRAY($ptrArrayValues->; wk circle)
		//APPEND TO ARRAY($ptrArrayValues->; wk square)
		//APPEND TO ARRAY($ptrArrayValues->; wk hollow square)
		//APPEND TO ARRAY($ptrArrayValues->; wk diamond)
		//APPEND TO ARRAY($ptrArrayValues->; wk club)
		//APPEND TO ARRAY($ptrArrayValues->; wk decimal)
		//APPEND TO ARRAY($ptrArrayValues->; wk decimal leading zero)
		//APPEND TO ARRAY($ptrArrayValues->; wk lower latin)
		//APPEND TO ARRAY($ptrArrayValues->; wk upper latin)
		//APPEND TO ARRAY($ptrArrayValues->; wk upper roman)
		
		
		
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
			
			$oCurrent:=WP_FillCurrent
			
			If ($typeSelection#2)
				
				Case of 
					: ((OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector1"))->=1)
						$case:=1
					: ((OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector2"))->=1)
						$case:=2
					: ((OBJECT Get pointer:C1124(Object named:K67:5; "TargetSelector3"))->=1)
						$case:=3
				End case 
				
				If ($case=2)
					WP_GetParagraphVertAlign($oCurrent)
				End if 
				
				If ($case#3)
					WP_GetTextAlign($oCurrent)
					WP_GetTextIndent($oCurrent)
					WP_GetTextLineHeight($oCurrent)
					//WP_GetListStyle($oCurrent)  // automatic action
				End if 
				
				WP_GetBackgroundColor($oCurrent)
				
			End if 
			
			WP_GetMargins($oCurrent; wk margin:K81:10)
			
		End if 
		
		UI_PaletteAlignments  //ACI0098389  2018/07/10  (moved at the end of the method…)
		
End case 

