//%attributes = {"invisible":true}


If (oForm.FR.find="")
	OBJECT SET ENABLED:C1123(*; "btn@"; False:C215)
	OBJECT SET ENABLED:C1123(*; "btnOptions"; True:C214)
Else 
	OBJECT SET ENABLED:C1123(*; "btn@"; True:C214)
	//If (Form.selection.end=Form.selection.start)
	//OBJECT SET ENABLED(*; "btnReplaceSingle"; False)
	//End if 
End if 

OBJECT SET ENTERABLE:C238(*; "input@"; True:C214)
OBJECT SET ENABLED:C1123(*; "input@"; True:C214)



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


//for sidebar "find"
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


