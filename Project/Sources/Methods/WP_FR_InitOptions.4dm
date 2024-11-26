//%attributes = {"invisible":true}
#DECLARE($location : Text)

var $check : Boolean
var $title : Text

// init default values

If ($location="sideBar") | ($location="toolbar")
	
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

If ($location="sideBar") | ($location="dialog")
	
	OBJECT SET VISIBLE:C603(*; "cbKeyboardBased"; False:C215)
	
	If (Not:C34(Undefined:C82(oForm.FR.keyboard)))
		$title:=Localized string:C991("KeyboardBased")
		$title:=Replace string:C233($title; "<1>"; oForm.FR.keyboard)
		OBJECT SET TITLE:C194(*; "cbKeyboardBased"; $title)
		OBJECT SET VISIBLE:C603(*; "cbKeyboardBased"; True:C214)
	End if 
	
End if 

