//%W-533.3
var $selectedItem : Text:=Self:C308->{Self:C308->}
//%W+533.3

var $ui:=cs:C1710._ui.me
var $name:=$ui.normalizeStyleSheetName($selectedItem)

// Is this a template?
var $template : Object:=$ui.multiLevelListsTemplates.query("name = :1"; $selectedItem).first()

/* 📌 Requirement #21273

When a style sheet (of any type) of a name that is similar to a template already exists in the WP document, 
and a template multi-level style sheet is selected from the dropdown, 
then a warning message should be displayed before any action is taken.

When the template style sheet is selected, and there is already a style sheet present in the WP document with a similar name, 
a dialog with the following message and options shall be displayed:

"A style sheet with the name "STYLESHEETNAME" already exists. What would you like to do? 
"Overwrite existing style sheet" or "Create a new style sheet"

*/

//%W-518.1
ARRAY TEXT:C222($_items; 0)
COPY ARRAY:C226(Self:C308->; $_items)
//%W+518.1

var $index : Integer:=Self:C308->

If ($template#Null:C1517)\
 && ($index>Find in array:C230($_items; "-"))
	
	var $styleSheet : Object:=$ui.styleSheets.query("name = :1"; $name).first()
	
	If ($styleSheet#Null:C1517)
		
		CONFIRM:C162(\
			Replace string:C233(Localized string:C991("aStyleSheetWithThisNameAlreadyExists"); "{name}"; $selectedItem); \
			Localized string:C991("overwriteExistingStyleSheet"); \
			Localized string:C991("createANewStyleSheet"))
		
		If (Bool:C1537(OK))  // Overwrite existing style sheet
			
			WP DELETE STYLE SHEET:C1652($styleSheet)
			
		Else   // Create a new style sheet
			
			$name:=$ui.newStyleSheetName($styleSheet.name; $ui.document; wk type paragraph:K81:191)
			
			If (Length:C16($name)=0)  // The user canceled
				
				$ui.updateListOfStyleSheets()
				
				return 
				
			End if 
		End if 
	End if 
	
	$ui.duplicateStyleSheet($template; $name; $ui.document)
	
End if 

WP SET ATTRIBUTES:C1342($ui.selection; wk style sheet:K81:63; $name)

$ui.updateListOfStyleSheets()