//%attributes = {"invisible":true}

C_TEXT:C284($numFormat)  //•
C_TEXT:C284($unitName)  //•

  //UI_ApplySkin 
C_LONGINT:C283($typeSelection)

If (UI_isProtected (False:C215))  // false means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	OBJECT SET ENTERABLE:C238(*;"@";False:C215)
	
Else 
	
	$typeSelection:=Form:C1466.selection.type
	
	Case of 
			
		: ($typeSelection=2)  // static picture
			OBJECT SET ENABLED:C1123(*;"@";False:C215)
			  //OBJECT SET ENTERABLE(*;"@";False)
			
			OBJECT SET ENABLED:C1123(*;"UserUnitNames";True:C214)  // only unit is available
			
		: ($typeSelection=0)
			
			OBJECT SET ENABLED:C1123(*;"@";True:C214)
			  //OBJECT SET ENTERABLE(*;"@";True)
			
			$unitName:=unitName
			$numFormat:=numFormat
			
			$numFormat:=$numFormat+" "+$unitName+";-;auto"
			
			OBJECT SET FORMAT:C236(*;"paragraph@";$numFormat)
			OBJECT SET FORMAT:C236(*;"picture@";$numFormat)
			
	End case 
	
End if 