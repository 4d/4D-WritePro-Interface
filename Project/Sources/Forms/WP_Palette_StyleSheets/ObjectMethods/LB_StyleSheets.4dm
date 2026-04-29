var $styleSheets:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")

var $column; $row : Integer
LISTBOX GET CELL POSITION:C971(*; "LB_StyleSheets"; $column; $row)

If ($row<=0)\
 || ($row>Size of array:C274($styleSheets->))
	
	return 
	
End if 

var $ui:=cs:C1710._ui.me
var $e:=FORM Event:C1606

//%W-533.3
var $selectedItem : Text:=$styleSheets->{$row}
//%W+533.3

If ($selectedItem="-")
	
	SET TIMER:C645(-1)
	return -1
	
End if 

var $name:=$ui.normalizeStyleSheetName($selectedItem)

// Is this a template?
var $template : Object:=$ui.multiLevelListsTemplates.query("name = :1"; $selectedItem).first()

//%W-518.1
ARRAY TEXT:C222($_items; 0)
COPY ARRAY:C226($styleSheets->; $_items)
//%W+518.1

var $index : Integer:=Self:C308->

Case of 
		
		// ________________________________________________________________________________
	: ($e.code=On Selection Change:K2:29)\
		 | ($e.code=On Clicked:K2:4)
		
		If ($template#Null:C1517)\
			 && ($index>Find in array:C230($_items; "-"))
			
			var $styleSheet : 4D:C1709.WriteStyleSheet:=$ui.styleSheets.query("name = :1"; $name).first()
			
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
		
		SET TIMER:C645(-1)
		
		// ________________________________________________________________________________
	: ($e.code=On Before Data Entry:K2:39)
		
		$name:=$styleSheets->{$row}
		
		If ($name="Normal")\
			 || (($template#Null:C1517) && ($index>Find in array:C230($_items; "-")))\
			 || Match regex:C1019("(?m-si)\\slvl\\s\\d+$"; $name; 1)
			
			$0:=-1  // Not enterable
			
		Else 
			
			var $memo:={name: $name; position: $row}
			Form:C1466.memo:=$memo
			
		End if 
		
		// ________________________________________________________________________________
	: ($e.code=On Data Change:K2:15)
		
		$memo:=Form:C1466.memo
		
		//%W-533.3
		var $newName : Text:=$styleSheets->{$memo.position}
		//%W+533.3
		
		If (Count in array:C907($styleSheets->; $newName)>1)
			
			BEEP:C151
			
			//%W-533.3
			$styleSheets->{$memo.position}:=$memo.name  // Restore
			//%W+533.3
			
		Else 
			
			// Rename the style sheet
			$styleSheet:=WP Get style sheet:C1656($ui.document; $memo.name)
			
			If ($styleSheet=Null:C1517)
				
				return 
				
			End if 
			
			$styleSheet.name:=$newName
			$ui.updateListOfStyleSheets()
			
		End if 
		
		// ________________________________________________________________________________
End case 