//%attributes = {"invisible":true}
var $typeStylesheet:=WP_GetStylesheetType

Case of 
		
		// ________________________________________________________________________________
	: ($typeStylesheet=wk type default:K81:190)
		
		var $range : Object:=Form:C1466.selection
		
		// ________________________________________________________________________________
	: ($typeStylesheet=wk type paragraph:K81:191)
		
		$range:=WP Paragraph range:C1346(Form:C1466.selection)
		
		// ________________________________________________________________________________
End case 

If (OB Is empty:C1297($range))
	
	return 
	
End if 

var $styleSheet : Object
WP Get attributes:C1345($range; wk style sheet:K81:63; $styleSheet)

If ($styleSheet=Null:C1517)
	
	return 
	
End if 

var $ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")
var $name : Text:=$styleSheet.name
var $p:=Find in array:C230($ptrStylesheetNames->; $name)

$p:=$p>0 ? $p : 0

$ptrStylesheetNames->:=$p  // Toolbar widget
LISTBOX SELECT ROW:C912(*; "LB_StyleSheets"; $p; lk replace selection:K53:1)  // Palette widget