//%attributes = {"invisible":true}

var $range; $styleSheet : Object
var $typeStylesheet; $p : Integer
var $ptrStylesheetNames : Pointer
var $name : Text

$typeStylesheet:=WP_GetStylesheetType

Case of 
	: ($typeStylesheet=wk type default:K81:190)
		$range:=Form:C1466.selection
		
	: ($typeStylesheet=wk type paragraph:K81:191)
		$range:=WP Paragraph range:C1346(Form:C1466.selection)
		
End case 

If (Not:C34(OB Is empty:C1297($range)))
	
	WP Get attributes:C1345($range; wk style sheet:K81:63; $styleSheet)  // wk name
	If ($styleSheet#Null:C1517)
		$name:=$styleSheet.name
		$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")
		
		$p:=Find in array:C230($ptrStylesheetNames->; $name)
		
		If ($p>0)
			$ptrStylesheetNames->:=$p  // toolbar widget
			LISTBOX SELECT ROW:C912(*; "LB_StyleSheets"; $p; lk replace selection:K53:1)  // palette widget
		Else 
			$ptrStylesheetNames->:=0  // toolbar widget
			LISTBOX SELECT ROW:C912(*; "LB_StyleSheets"; 0; lk remove from selection:K53:3)  // palette widget
		End if 
		
	End if 
	
End if 


