//%attributes = {"invisible":true}
// Always true even for protected documents
OBJECT SET ENTERABLE:C238(*; "inputFind"; True:C214)  //
OBJECT SET ENABLED:C1123(*; "inputFind"; True:C214)
OBJECT SET ENABLED:C1123(*; "btnFind@"; Length:C16(formData.FR.find)#0)  // Allow findNext & findPrevious if something in formData.FR.find
OBJECT SET ENABLED:C1123(*; "btnOptions"; True:C214)  // Options can be fixed prior entering what to be found (does not matter)

var $protected:=UI_isProtected(False:C215)  // Don't manage focus

If ($protected)  // ACI0103628
	
	OBJECT SET ENTERABLE:C238(*; "inputReplace"; False:C215)  // Can NOT replace : replace text is NOT enterable/available
	OBJECT SET ENABLED:C1123(*; "inputReplace"; False:C215)
	OBJECT SET ENABLED:C1123(*; "btnReplace@"; False:C215)
	
	formData.FR.replace:=""
	
Else 
	
	OBJECT SET ENTERABLE:C238(*; "inputReplace"; True:C214)  // Replace text is available
	OBJECT SET ENABLED:C1123(*; "inputReplace"; True:C214)
	OBJECT SET ENABLED:C1123(*; "btnReplace@"; Length:C16(formData.FR.find)#0)
	
	// More based on options
	If (formData.FR.kanaSensitive)
		
		OBJECT SET ENABLED:C1123(*; "cbCaseSensitive"; False:C215)
		OBJECT SET ENABLED:C1123(*; "cbAccentSensitive"; False:C215)
		OBJECT SET ENABLED:C1123(*; "cbWidthSensitive"; True:C214)
		
	Else 
		
		OBJECT SET ENABLED:C1123(*; "cbCaseSensitive"; True:C214)
		OBJECT SET ENABLED:C1123(*; "cbAccentSensitive"; True:C214)
		OBJECT SET ENABLED:C1123(*; "cbWidthSensitive"; False:C215)
		
	End if 
	
	OBJECT SET ENTERABLE:C238(*; "occurencesInfo@"; False:C215)
	OBJECT SET ENABLED:C1123(*; "tabBtn_@"; True:C214)  // The tab buttons are always enabled
	
End if   // ACI0103628

// for sidebar "find"
If (Length:C16(formData.FR.find)#0)
	
	formData.FR.messageoccurences:=Localized string:C991("OccurencesColon")+" "+String:C10(formData.FR.occurences)
	
Else 
	
	formData.FR.messageoccurences:=""
	
End if 

// For sidebar "replace"
If (formData.FR.displayReplacements)
	
	formData.FR.messageReplacements:=Localized string:C991("ReplacementsColon")+" "+String:C10(formData.FR.replacements)
	
Else 
	
	formData.FR.messageReplacements:=""
	
End if 

If (formData.FR.displayReplacements)
	
	formData.FR.message:=formData.FR.messageReplacements
	formData.FR.displayReplacements:=False:C215  // Next time occurences shall be displayed
	
Else 
	
	formData.FR.message:=formData.FR.messageoccurences
	
End if 