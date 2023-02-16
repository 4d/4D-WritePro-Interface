//%attributes = {"invisible":true}
var $protected : Boolean
$protected:=UI_isProtected(False:C215)  // don't manage focus


// always true even for protected documents

OBJECT SET ENTERABLE:C238(*; "inputFind"; True:C214)  // 
OBJECT SET ENABLED:C1123(*; "inputFind"; True:C214)
OBJECT SET ENABLED:C1123(*; "btnFind@"; (oForm.FR.find#""))  //allow findNext and findPrevious if something in oForm.FR.find
OBJECT SET ENABLED:C1123(*; "btnOptions"; True:C214)  // options can be fixed prior entering what to be found (does not matter)


If ($protected)  //ACI0103628 
	
	OBJECT SET ENTERABLE:C238(*; "inputReplace"; False:C215)  // can NOT replace : replace text is NOT enterable/available
	OBJECT SET ENABLED:C1123(*; "inputReplace"; False:C215)
	oForm.FR.replace:=""
	OBJECT SET ENABLED:C1123(*; "btnReplace@"; False:C215)
	
Else 
	
	OBJECT SET ENTERABLE:C238(*; "inputReplace"; True:C214)  //replace text is available
	OBJECT SET ENABLED:C1123(*; "inputReplace"; True:C214)
	OBJECT SET ENABLED:C1123(*; "btnReplace@"; (oForm.FR.find#""))
	
	// more based on options
	
	If (oForm.FR.kanaSensitive)
		
		//oForm.FR.caseSensitive:=True
		//oForm.FR.diacriticSensitive:=True
		
		OBJECT SET ENABLED:C1123(*; "cbCaseSensitive"; False:C215)
		OBJECT SET ENABLED:C1123(*; "cbAccentSensitive"; False:C215)
		
		OBJECT SET ENABLED:C1123(*; "cbWidthSensitive"; True:C214)
		
	Else 
		
		//oForm.FR.widthSensitive:=False
		
		OBJECT SET ENABLED:C1123(*; "cbCaseSensitive"; True:C214)
		OBJECT SET ENABLED:C1123(*; "cbAccentSensitive"; True:C214)
		
		OBJECT SET ENABLED:C1123(*; "cbWidthSensitive"; False:C215)
		
	End if 
	
	//
	OBJECT SET ENTERABLE:C238(*; "occurencesInfo@"; False:C215)
	
	// the tab buttons are always enabled
	OBJECT SET ENABLED:C1123(*; "tabBtn_@"; True:C214)
	
	//OBJECT SET VISIBLE(*; "Replacement@"; oForm.FR.displayReplacements)
	//OBJECT SET VISIBLE(*; "Occurences@"; Not(oForm.FR.displayReplacements))
	
End if   //ACI0103628 


////for sidebar "find"
If (oForm.FR.find#"")
	oForm.FR.messageoccurences:=Get localized string:C991("OccurencesColon")+" "+String:C10(oForm.FR.occurences)
Else 
	oForm.FR.messageoccurences:=""
End if 

//for sidebar "replace"
If (oForm.FR.displayReplacements)
	oForm.FR.messageReplacements:=Get localized string:C991("ReplacementsColon")+" "+String:C10(oForm.FR.replacements)
Else 
	oForm.FR.messageReplacements:=""
End if 

If (oForm.FR.displayReplacements)
	oForm.FR.message:=oForm.FR.messageReplacements
	oForm.FR.displayReplacements:=False:C215  // next time occurences shall be displayed
Else 
	oForm.FR.message:=oForm.FR.messageoccurences
End if 