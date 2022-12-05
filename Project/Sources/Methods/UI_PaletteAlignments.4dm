//%attributes = {"invisible":true}
//ACI0098389 (new item added)

C_POINTER:C301($ptrTextLineHeightUnit)
C_TEXT:C284($format)
C_LONGINT:C283($typeSelection)


If (UI_isProtected(False:C215))  // false means don't take focus into account
	
	
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
Else 
	
	// same start…
	OBJECT SET ENABLED:C1123(*; "@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "@"; False:C215)
	
	$typeSelection:=Form:C1466.selection.type
	
	Case of 
			
		: ($typeSelection=2)  // static picture
			
			OBJECT SET ENABLED:C1123(*; "@"; False:C215)  // desable everything except below
			OBJECT SET ENTERABLE:C238(*; "@"; False:C215)  // desable everything except below
			OBJECT SET VISIBLE:C603(*; "backgroundColor"; False:C215)  // fake text behing the color picker button
			
			OBJECT SET ENABLED:C1123(*; "margin@"; True:C214)
			OBJECT SET ENTERABLE:C238(*; "margin@"; True:C214)
			
			
		: ($typeSelection=0)
			
			OBJECT SET ENABLED:C1123(*; "@"; True:C214)
			OBJECT SET ENTERABLE:C238(*; "@"; True:C214)  // ALL except…
			
			OBJECT SET VISIBLE:C603(*; "backgroundColor"; True:C214)  // fake text behing the color picker button
			OBJECT SET ENTERABLE:C238(*; "backgroundColor"; False:C215)  //visible but not enterable
			
			
			If (Not:C34(Undefined:C82(oSettings1)))
				If (Not:C34(OB Is empty:C1297(oSettings1)))
					OBJECT SET ENABLED:C1123(*; "btnPaste"; True:C214)
				Else 
					OBJECT SET ENABLED:C1123(*; "btnPaste"; False:C215)
				End if 
			Else 
				OBJECT SET ENABLED:C1123(*; "btnPaste"; False:C215)
			End if 
			
			//OBJECT SET FORMAT(*;"padding@";$numFormat+" "+$unitName)
			
	End case 
	
	
	OBJECT SET FORMAT:C236(*; "textIndentInput"; numFormat+" "+unitName)
	
	
	
	$ptrTextLineHeightUnit:=OBJECT Get pointer:C1124(Object named:K67:5; "TextLineHeightUnit")
	$format:=OBJECT Get format:C894(*; "textLineHeightRuler")
	
	If (($ptrTextLineHeightUnit->)=1)  // "%"
		$format:="80;200;1;1;32;### ##0"
	Else   //                         "pt"
		$format:="10;100;1;1;32;### ##0"
	End if 
	OBJECT SET FORMAT:C236(*; "textLineHeightRuler"; $format)
	
End if 
