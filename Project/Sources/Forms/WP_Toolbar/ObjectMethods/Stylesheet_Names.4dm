var $selected : Text:=Self:C308->{Self:C308->}

var $normalized:=WP_NormalizeStyleSheetName($selected)

/* 📌 Requirement #21273

When a style sheet (of any type) of a name that is similar to a template already exists in the WP document, 
and a template multi-level style sheet is selected from the dropdown, 
then a warning message should be displayed before any action is taken.

When the template style sheet is selected, and there is already a style sheet present in the WP document with a similar name, 
a dialog with the following message and options shall be displayed:

"A style sheet with the name "STYLESHEETNAME" already exists. What would you like to do? 
"Overwrite existing style sheet" or "Create a new style sheet"

*/
var $area : Object:=Form:C1466.area
var $template : Object:=oForm.predefinedMultiLevelLists.query("name = :1"; $selected).first()
var $allStyleSheets:=WP Get style sheets:C1655($area; wk type paragraph:K81:191).combine(WP Get style sheets:C1655($area; wk type character:K81:296))

// Create mutliLevelStyles style sheet from template if any
If ($template#Null:C1517)\
 && ($allStyleSheets.query("name = :1"; $normalized).first()=Null:C1517)
	
	var $levelCount : Integer:=$template.levels.length
	var $style:=WP New style sheet:C1650($area; wk type paragraph:K81:191; $normalized; $levelCount)
	
	var $i : Integer
	For ($i; 0; $levelCount-1; 1)
		
		var $currentLevel : Object:=$template.levels[$i]
		
		var $attribute : Text
		For each ($attribute; $currentLevel)
			
			If ($attribute="level")
				
				continue
				
			End if 
			
			var $value : Variant:=$currentLevel[$attribute]
			
			If (["listStyleType"].includes($attribute))
				
				If (Value type:C1509($value)=Is text:K8:3)
					
					If (Position:C15("wk "; $value)=0)
						
						$value:="wk "+$value
						
					End if 
					
					$value:=Formula from string:C1601($value).call()
					
				End if 
			End if 
			
			var $level : Object:=WP Get style sheet:C1656($area; $normalized; $i+1)
			WP SET ATTRIBUTES:C1342($level; $attribute; $value)
			
		End for each 
	End for 
End if 

WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $normalized)

SET TIMER:C645(-1)