//var $styleSheets : Collection:=Form.styleSheets
var $row : Integer:=Form:C1466.styleSheetsItemPosition

If ($row<0)
	
	return 
	
End if 

var $ui:=cs:C1710._ui.me
var $item : Object:=Form:C1466.styleSheetsItem

If (Bool:C1537($item.separator))
	
	SET TIMER:C645(-1)
	return -1
	
End if 

// Is this a template?
var $isTemplate:=Bool:C1537($item.template)
var $template : Object

If ($isTemplate)
	
	$template:=$ui.multiLevelListsTemplates.query("name = :1"; $item.name).first()
	
End if 

var $name:=$ui.normalizeStyleSheetName($item.name)
var $e:=FORM Event:C1606


var $index : Integer:=Form:C1466.styleSheetsItemPosition



Case of 
		
		// ________________________________________________________________________________
	: ($e.code=On Selection Change:K2:29)\
		 | ($e.code=On Clicked:K2:4)
		
		If ($isTemplate)
			
			var $styleSheet : 4D:C1709.WriteStyleSheet:=$ui.styleSheets.query("name = :1"; $name).first()
			
			If ($styleSheet#Null:C1517)
				
				CONFIRM:C162(\
					Replace string:C233(Localized string:C991("aStyleSheetWithThisNameAlreadyExists"); "{name}"; $item.name); \
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
		
		SET TIMER:C645(-1)
		
		// ________________________________________________________________________________
	: ($e.code=On Before Data Entry:K2:39)
		
		TRACE:C157
		
		$name:=$item.name
		
		If ($name="Normal")\
			 || ($isTemplate)\
			 || Match regex:C1019("(?m-si)\\slvl\\s\\d+$"; $name; 1)
			
			$0:=-1  // Not enterable
			
		Else 
			
			var $memo:={name: $name; position: $row}
			Form:C1466.memo:=$memo
			
		End if 
		
		// ________________________________________________________________________________
	: ($e.code=On Data Change:K2:15)
		
		$memo:=Form:C1466.memo
		
		TRACE:C157
		
/*
//%W-533.3
var $newName : Text:=$styleSheets->{$memo.position}
//%W+533.3
		
If (Count in array($styleSheets->; $newName)>1)
		
BEEP
		
//%W-533.3
$styleSheets->{$memo.position}:=$memo.name  // Restore
//%W+533.3
		
Else 
		
// Rename the style sheet
$styleSheet:=WP Get style sheet($ui.document; $memo.name)
		
If ($styleSheet=Null)
		
return 
		
End if 
		
$styleSheet.name:=$newName
$ui.updateListOfStyleSheets()
		
End if 
*/
		
		
		// ________________________________________________________________________________
End case 