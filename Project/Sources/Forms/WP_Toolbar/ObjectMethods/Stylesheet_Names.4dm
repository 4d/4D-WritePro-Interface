//%W-533.3
var $name : Text:=Self:C308->{Self:C308->}
//%W+533.3

var $styleSheetName:=cs:C1710._wp.me.normalizeStyleSheetName($name)
var $doc : Object:=cs:C1710._wp.me.doc

// Is this a template?
var $template : Object:=cs:C1710._wp.me.multiLevelListsTemplates.query("name = :1"; $name).first()
var $isTemplate:=$template#Null:C1517

If ($isTemplate)
	
	var $styleSheets:=cs:C1710._wp.me.styleSheets
	var $style : Object:=$styleSheets.query("name = :1"; $styleSheetName).first()
	var $create : Boolean:=($style=Null:C1517)
	
	If (Not:C34($create))
		
/* 📌 Requirement #21273
		
When a style sheet (of any type) of a name that is similar to a template already exists in the WP document, 
and a template multi-level style sheet is selected from the dropdown, 
then a warning message should be displayed before any action is taken.
		
When the template style sheet is selected, and there is already a style sheet present in the WP document with a similar name, 
a dialog with the following message and options shall be displayed:
		
"A style sheet with the name "STYLESHEETNAME" already exists. What would you like to do? 
"Overwrite existing style sheet" or "Create a new style sheet"
		
*/
		
		CONFIRM:C162(\
			Replace string:C233(Localized string:C991("aStyleSheetWithThisNameAlreadyExists"); "{name}"; $name); \
			Localized string:C991("overwriteExistingStyleSheet"); \
			Localized string:C991("createANewStyleSheet"))
		
		If (OK=1)  // Overwrite
			
			// Delete the existing style
			WP DELETE STYLE SHEET:C1652($style)
			
		Else   // New
			
			Repeat 
				
				$styleSheetName:=cs:C1710._tools.me.incrementString($styleSheetName; " ")
				
			Until ($styleSheets.query("name = :1"; $styleSheetName).first()=Null:C1517)
			
			Repeat 
				
				$styleSheetName:=cs:C1710._wp.me.request("requestTitle"; $styleSheetName; "requestCreateLabel"; "requestCancelLabel"; "StyleSheetPlaceHolder")
				
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
	
	cs:C1710._wp.me.duplicateStyleSheet($template; $styleSheetName; $doc)
	
End if 

WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $styleSheetName)

SET TIMER:C645(-1)