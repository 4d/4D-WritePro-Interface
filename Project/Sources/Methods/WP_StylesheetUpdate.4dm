//%attributes = {"invisible":true}
var $stylesheetType:=getSelectedStyleSheetType  // Paragraph, char, picture, table, row or cell

var $ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5; "LB_StyleSheets")
var $ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")

If (Is nil pointer:C315($ptrListbox))  // From toolbar
	
	var $indx:=$ptrStylesheetNames->
	
Else   // From palette
	
	$indx:=Find in array:C230($ptrListbox->; True:C214)  // Index
	
End if 

var $stylesheetName : Text

If ($indx>0)
	
	//%W-533.3
	$stylesheetName:=$ptrStylesheetNames->{$indx}
	//%W+533.3
	
End if 

If (Length:C16($stylesheetName)#0)
	
	var $document : Object:=Form:C1466.selection[wk owner:K81:168]
	var $styleSheet:=WP Get style sheet:C1656($document; $stylesheetName)
	
	If ($stylesheet#Null:C1517)  // Should never happen
		
		var $_attributes:=WP_GetStyleAttributesByType($stylesheetType)  // All possible attributes for this type of style sheet
		
		Case of 
				
				// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			: ($stylesheetType=wk type default:K81:190)
				
				var $source : Object:=Form:C1466.selection
				
				// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			: ($stylesheetType=wk type paragraph:K81:191)
				
				// $source:=WP Paragraph range(Form.selection)
				$source:=Form:C1466.selection
				
				// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
		End case 
		
		WP_StylesheetSetAttributes({\
			list: $_attributes; \
			from: $source; \
			to: $stylesheet})
		
	End if 
End if 