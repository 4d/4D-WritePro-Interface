var $name : Text:=Self:C308->{Self:C308->}
var $styleSheetName:=WP_NormalizeStyleSheetName($name)
var $wpDoc : Object:=Form:C1466.area
var $template : Object:=oForm.predefinedMultiLevelLists.query("name = :1"; $name).first()

/* 📌 Requirement #21273

When a style sheet (of any type) of a name that is similar to a template already exists in the WP document, 
and a template multi-level style sheet is selected from the dropdown, 
then a warning message should be displayed before any action is taken.

When the template style sheet is selected, and there is already a style sheet present in the WP document with a similar name, 
a dialog with the following message and options shall be displayed:

"A style sheet with the name "STYLESHEETNAME" already exists. What would you like to do? 
"Overwrite existing style sheet" or "Create a new style sheet"

*/
If ($template#Null:C1517)
	
	var $styleSheets:=WP Get style sheets:C1655($wpDoc; wk type paragraph:K81:191).combine(WP Get style sheets:C1655($wpDoc; wk type character:K81:296))
	var $style : Object:=$styleSheets.query("name = :1"; $styleSheetName).first()
	var $create : Boolean:=($style=Null:C1517)  //&& ($style#$template)
	
	If (Not:C34($create))
		
		CONFIRM:C162(\
			Replace string:C233(Localized string:C991("aStyleSheetWithThisNameAlreadyExists"); "{name}"; $name); \
			Localized string:C991("overwriteExistingStyleSheet"); \
			Localized string:C991("createANewStyleSheet"))
		
		If (OK=1)  // Overwrite
			
			// Delete the existing style
			WP DELETE STYLE SHEET:C1652($style)
			
		Else   // New
			
			Repeat 
				
				$styleSheetName:=TOOL_IncrementString($styleSheetName)
				
			Until ($styleSheets.query("name = :1"; $styleSheetName).first()=Null:C1517)
			
			Repeat 
				
				$styleSheetName:=WP_Request(\
					Localized string:C991("requestTitle"); \
					$styleSheetName; \
					Localized string:C991("requestCreateLabel"); \
					Localized string:C991("requestCancelLabel"); \
					Localized string:C991("StyleSheetPlaceHolder"))
				
				var $isValid:=Position:C15("section"; $styleSheetName)#1
				
				If (Not:C34($isValid))
					
					ALERT:C41(Localized string:C991("nameError"))
					
				End if 
			Until ($isValid & (Length:C16($styleSheetName)>0)) | (OK=0)
			
			If (OK=0)
				
				return 
				
			End if 
		End if 
	End if 
	
	var $length : Integer:=$template.levels.length
	$style:=WP New style sheet:C1650($wpDoc; wk type paragraph:K81:191; $styleSheetName; $length)
	
	var $i : Integer
	For ($i; 0; $length-1; 1)
		
		var $level : Object:=$template.levels[$i]
		
		var $attributeName : Text
		
		For each ($attributeName; $level)
			
			var $attributValue : Variant:=$level[$attributeName]
			
			If (["listStyleType"].includes($attributeName))
				
				If (Value type:C1509($attributValue)=Is text:K8:3)
					
					If (Position:C15("wk "; $attributValue)=0)
						
						$attributValue:="wk "+$attributValue
						
					End if 
					
					$attributValue:=Formula from string:C1601($attributValue).call()
					
				End if 
			End if 
			
			var $targetLevel : Object:=WP Get style sheet:C1656($wpDoc; $styleSheetName; $i+1)
			WP SET ATTRIBUTES:C1342($targetLevel; $attributeName; $attributValue)
			
		End for each 
	End for 
End if 

WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $styleSheetName)

SET TIMER:C645(-1)