
C_POINTER:C301($ptrArrayNames; $ptrArrayValues)
C_POINTER:C301($ptrLineHeightUnit)

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
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "bAlign1"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "bAlign2"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "bAlign3"))->:=0
		(OBJECT Get pointer:C1124(Object named:K67:5; "bAlign4"))->:=0
		
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
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "lineHeightRuler"))->:=100
		
		CLEAR VARIABLE:C89(oSettings1)
		CLEAR VARIABLE:C89(oSettings2)
		
		//----------------------------------------------------------------
		
		$ptrArrayNames:=OBJECT Get pointer:C1124(Object named:K67:5; "listStyleNames")
		$ptrArrayValues:=OBJECT Get pointer:C1124(Object named:K67:5; "listStyleValues")
		$ptrLineHeightUnit:=OBJECT Get pointer:C1124(Object named:K67:5; "lineHeightUnit")
		
		ARRAY TEXT:C222($ptrArrayNames->; 0)
		ARRAY LONGINT:C221($ptrArrayValues->; 0)
		ARRAY TEXT:C222($ptrLineHeightUnit->; 0)
		
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("None"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Disc"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Circle"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Square"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("HollowSquare"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Diamond"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Club"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("123"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("010203"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("abcLow"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("abcCAP"))
		APPEND TO ARRAY:C911($ptrArrayNames->; Get localized string:C991("Roman"))
		
		APPEND TO ARRAY:C911($ptrArrayValues->; wk none:K81:91)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk disc:K81:140)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk circle:K81:141)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk square:K81:142)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk hollow square:K81:155)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk diamond:K81:156)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk club:K81:157)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk decimal:K81:126)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk decimal leading zero:K81:143)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk lower latin:K81:144)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk upper latin:K81:146)
		APPEND TO ARRAY:C911($ptrArrayValues->; wk upper roman:K81:147)
		
		APPEND TO ARRAY:C911($ptrLineHeightUnit->; "%")
		APPEND TO ARRAY:C911($ptrLineHeightUnit->; "pt")
		$ptrLineHeightUnit->:=1
		
		//----------------------------------------------------------------
		
		skinAppliedSub:=UI_ApplySkin
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Bound Variable Change:K2:52) | (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$setupOK:=SetupLocalVariables
		
		If (Not:C34(skinAppliedSub))  // 2nd chance
			skinAppliedSub:=UI_ApplySkin
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
					WP_GetTextAlign($oCurrent)  // automatic action
					WP_GetTextIndent($oCurrent)
					WP_GetTextLineHeight($oCurrent)
					WP_GetListStyle($oCurrent)
				End if 
				
				WP_GetBackgroundColor($oCurrent)
				
			End if 
			
			WP_GetMargins($oCurrent; wk margin:K81:10)
			
		End if 
		
		UI_PaletteAlignments  //ACI0098389  2018/07/10  (moved at the end of the method…)
		
End case 

