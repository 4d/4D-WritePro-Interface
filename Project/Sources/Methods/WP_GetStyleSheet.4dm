//%attributes = {"invisible":true}
var $type:=WP_GetStylesheetType

Case of 
		
		// ________________________________________________________________________________
	: ($type=wk type default:K81:190)
		
		var $range : Object:=Form:C1466.selection
		
		// ________________________________________________________________________________
	: ($type=wk type paragraph:K81:191)
		
		$range:=WP Paragraph range:C1346(Form:C1466.selection)
		
		// ________________________________________________________________________________
End case 

If (OB Is empty:C1297($range))
	
	return 
	
End if 

var $namesArrayPtr:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")

// MARK:- Update the list of style sheets
var $c:=WP Get style sheets:C1655(Form:C1466.selection[wk owner:K81:168]; $type)

If ($type=1)
	
	var $isList : Boolean:=Bool:C1537(oForm.styleSheet.btnType[6])  // || (Num($styleSheet.listStyleType)#0)
	
	If ($isList)
		
		// Keep only list style sheets
		$c:=$c.query("listStyleType != null AND name != normal")
		
	Else 
		
		// Keep only paragraphe style sheets
		$c:=$c.query("listStyleType = null")
		
	End if 
	
	$c:=$c.extract("name")
	$c.sort()
	
	If ($c.length>0)
		
		$c.push("-")
		
	End if 
	
	If ($isList)
		
		// TODO: Localisation
		$c.push("Technical Blue Print")
		$c.push("Legal & Governance")
		$c.push("Education Material")
		$c.push("Meeting Minutes")
		$c.push("Visual Hierarchy")
		
	Else 
		
		$c.push("Normal")
		
	End if 
	
	COLLECTION TO ARRAY:C1562($c; $namesArrayPtr->)
	
End if 

var $styleSheet : Object
WP Get attributes:C1345($range; wk style sheet:K81:63; $styleSheet)

If ($styleSheet=Null:C1517)
	
	return   // <NOTHING MORE TO DO>
	
End if 

// MARK:- Select the current style sheet if ny
var $name : Text:=$styleSheet.name
var $pos:=Find in array:C230($namesArrayPtr->; $name)
$pos:=$pos>0 ? $pos : 0

/*Toolbar*/$namesArrayPtr->:=$pos

/*Palette*/LISTBOX SELECT ROW:C912(*; "LB_StyleSheets"; $pos; lk replace selection:K53:1)