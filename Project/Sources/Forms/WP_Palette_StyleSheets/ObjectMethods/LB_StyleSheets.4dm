var $styleSheetNamesPtr:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")

var $column; $row : Integer
LISTBOX GET CELL POSITION:C971(*; "LB_StyleSheets"; $column; $row)

var $ui:=cs:C1710._ui.me
var $e:=FORM Event:C1606

Case of 
		
		// ________________________________________________________________________________
	: ($row<=0)\
		 || ($row>Size of array:C274($styleSheetNamesPtr->))
		
		return 
		
		// ________________________________________________________________________________
	: ($e.code=On Selection Change:K2:29)\
		 | ($e.code=On Clicked:K2:4)
		
		var $name : Text:=$styleSheetNamesPtr->{$row}
		WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $name)
		
		SET TIMER:C645(-1)
		
		// ________________________________________________________________________________
	: ($e.code=On Before Data Entry:K2:39)
		
		$name:=$styleSheetNamesPtr->{$row}
		
		If ($name="Normal")
			
			$0:=-1  // Not enterable
			
		Else 
			
			var $memo:={name: $name; position: $row}
			Form:C1466.memo:=$memo
			
		End if 
		
		// ________________________________________________________________________________
	: ($e.code=On Data Change:K2:15)
		
		$memo:=Form:C1466.memo
		
		//%W-533.3
		var $newName : Text:=$styleSheetNamesPtr->{$memo.position}
		//%W+533.3
		
		If (Count in array:C907($styleSheetNamesPtr->; $newName)>1)
			
			BEEP:C151
			
			//%W-533.3
			$styleSheetNamesPtr->{$memo.position}:=$memo.name  // Restore
			//%W+533.3
			
		Else 
			
			// Rename the style sheet
			var $styleSheet : 4D:C1709.WriteStyleSheet:=WP Get style sheet:C1656($ui.document; Form:C1466.memo.name)
			
			If ($styleSheet#Null:C1517)
				
				$styleSheet.name:=$newName
				$ui.updateListOfStyleSheets()
				
			End if 
		End if 
		
		// ________________________________________________________________________________
End case 