//%attributes = {"invisible":true}
#DECLARE($location : Text)

var $check : Boolean
var $title : Text

// init default values

If ($location="sideBar") | ($location="toolbar")
	
	If (Undefined:C82(formData.FR.caseSensitive))  // not inited yet
		
		$check:=False:C215
		
		formData.FR.caseSensitive:=$check
		formData.FR.diacriticSensitive:=$check
		formData.FR.kanaSensitive:=$check
		formData.FR.widthSensitive:=$check
		formData.FR.fullWord:=$check
		formData.FR.keepCharStyle:=True:C214
		
		formData.FR.includeHeadersAndFooters:=$check
		
		formData.FR.keyboardBased:=False:C215
		
		If (Not:C34(Undefined:C82(Form:C1466.keyboard)))
			If (Form:C1466.keyboard#"")
				formData.FR.keyboard:=Form:C1466.keyboard
				formData.FR.keyboardBased:=True:C214
			End if 
		End if 
	End if 
	
End if 


// Interface setting  (display or not keyboard based option)

If ($location="sideBar") | ($location="dialog")
	
	OBJECT SET VISIBLE:C603(*; "cbKeyboardBased"; False:C215)
	
	If (Not:C34(Undefined:C82(formData.FR.keyboard)))
		$title:=Localized string:C991("KeyboardBased")
		$title:=Replace string:C233($title; "<1>"; formData.FR.keyboard)
		OBJECT SET TITLE:C194(*; "cbKeyboardBased"; $title)
		OBJECT SET VISIBLE:C603(*; "cbKeyboardBased"; True:C214)
	End if 
	
End if 

