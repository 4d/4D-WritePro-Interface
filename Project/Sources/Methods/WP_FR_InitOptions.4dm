//%attributes = {"invisible":true}
C_TEXT:C284($1)  //  "toolbar", "sidebar"  or "dialog"
C_BOOLEAN:C305($check)
C_TEXT:C284($title)


// init default values

If ($1="sideBar") | ($1="toolbar")
	
	If (Undefined:C82(oForm.FR.caseSensitive))  // not inited yet
		
		$check:=False:C215
		
		oForm.FR.caseSensitive:=$check
		oForm.FR.diacriticSensitive:=$check
		oForm.FR.kanaSensitive:=$check
		oForm.FR.widthSensitive:=$check
		oForm.FR.fullWord:=$check
		oForm.FR.keepCharStyle:=True:C214
		
		oForm.FR.includeHeadersAndFooters:=$check
		
		oForm.FR.keyboardBased:=False:C215
		
		If (Not:C34(Undefined:C82(Form:C1466.keyboard)))
			If (Form:C1466.keyboard#"")
				oForm.FR.keyboard:=Form:C1466.keyboard
				oForm.FR.keyboardBased:=True:C214
			End if 
		End if 
	End if 
	
End if 


// Interface setting  (display or not keyboard based option)

If ($1="sideBar") | ($1="dialog")
	
	OBJECT SET VISIBLE:C603(*; "cbKeyboardBased"; False:C215)
	
	If (Not:C34(Undefined:C82(oForm.FR.keyboard)))
		$title:=Get localized string:C991("KeyboardBased")
		$title:=Replace string:C233($title; "<1>"; oForm.FR.keyboard)
		OBJECT SET TITLE:C194(*; "cbKeyboardBased"; $title)
		OBJECT SET VISIBLE:C603(*; "cbKeyboardBased"; True:C214)
	End if 
	
End if 

