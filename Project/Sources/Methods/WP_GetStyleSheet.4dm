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

If ($type=wk type paragraph:K81:191)
	
/* 📌 Requirement #21272
	
When the "Paragraph style sheets" button is active 
(which means the "Multi-level style sheets" button is deactivated), 
then the dropdown list shall contain only the paragraph style sheets that are not multi-level style sheets
	
*/
	
	var $isList:=Bool:C1537(oForm.styleSheet.btnType[6])
	
	If ($isList)  // Keep only list style sheets
		
		$c:=$c.query("listStyleType != null AND name != normal")
		
	Else   // Keep only paragraphe style sheets
		
		// Save the name of the “Normal” style sheet
		
		var $normal : Text:=$c.query("listStyleType = 0").first().name
		$c:=$c.query("listStyleType = null")
		
	End if 
	
	$c:=$c.extract("name")
	$c.sort()
	
	If ($isList)
		
/* 📌 Requirement #21240
		
In the style sheets dropdown list, there shall be 5 pre-defined multi-level style sheets (templates) 
for the user to choose from
		
*/
		
		If (Form:C1466.predefinedMultiLevelLists#Null:C1517)\
			 && (Form:C1466.predefinedMultiLevelLists.length>0)
			
/*  📌 Requirement #21247
			
In the style sheets dropdown list, the multi-level style sheets shall be divided into 2: 
• the ones defined in the WP document at the top, 
• and the templates at the bottom
			
*/
			
			If ($c.length>0)
				
				$c.push("-")
				
			End if 
			
			var $o : Object
			For each ($o; Form:C1466.predefinedMultiLevelLists)
				
				$c.push($o.name)
				
			End for each 
		End if 
		
	Else 
		
		$c.push($normal)
		
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