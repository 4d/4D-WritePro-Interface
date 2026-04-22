//%attributes = {"invisible":true}
// MARK:- Create menu
var $menu:=Create menu:C408

APPEND MENU ITEM:C411($menu; Localized string:C991("menuNewFromSelection"))
SET MENU ITEM PARAMETER:C1004($menu; -1; "newFromSelection")

var $styleSheets:=cs:C1710._wp.me.styleSheets.orderBy("name")  //.query()
var $length:=$styleSheets.length

If ($length>0)  // No "duplicate" if no items !
	
	var $submenu:=Create menu:C408
	
	var $i : Integer
	For ($i; 0; $length-1; 1)
		
		If (Match regex:C1019("(?m-si)\\slvl\\s\\d+$"; $styleSheets[$i].name; 1))  // levels
			
			continue
			
		End if 
		
		// APPEND MENU ITEM($submenu; $ptrStylesheetNames->{$i})
		APPEND MENU ITEM:C411($submenu; $styleSheets[$i].name)
		SET MENU ITEM PARAMETER:C1004($submenu; -1; "duplicate_"+String:C10($i))
		
	End for 
	
	APPEND MENU ITEM:C411($menu; Localized string:C991("menuDuplicate"); $submenu)
	RELEASE MENU:C978($submenu)  // Will be cleared later thanks to refcounting
	
End if 

var $choice:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)

If (Length:C16($choice)=0)
	
	return   // <NOTHING MORE TO DO>
	
End if 

// MARK:- Action
var $new:=$choice="new"
var $newFromSelection:=$choice="newFromSelection"
var $duplicate:=Position:C15("duplicate_"; $choice)=1

var $type:=getSelectedStyleSheetType/* 0 = Paragraph, 1 = Font, 6 = List */

Case of 
		
		//________________________________________________________________________________
	: ($new || $newFromSelection)
		
		var $name:=cs:C1710._wp.me.newStyleSheetName(Localized string:C991("requestPlaceHolder"); Form:C1466.document; $type)
		var $success:=Length:C16($name)>0
		
		If (Not:C34($success))
			
			return   // <NOTHING MORE TO DO>
			
		End if 
		
		If ($newFromSelection)
			
			Case of 
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
				: ($type=wk type default:K81:190)
					
					var $from : Object:=Form:C1466.selection
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
				: ($type=wk type paragraph:K81:191)
					
					$from:=WP Paragraph range:C1346(Form:C1466.selection)
					var $styleSheet : Object
					WP Get attributes:C1345($from; wk style sheet:K81:63; $styleSheet)
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			End case 
		End if 
		
		//________________________________________________________________________________
	: ($duplicate)
		
		var $source : Object:=$styleSheets[Num:C11(Delete string:C232($choice; 1; 10))]
		$name:=cs:C1710._wp.me.newStyleSheetName($source.name; Form:C1466.document; $type)
		$success:=Length:C16($name)>0
		
		If (Not:C34($success))
			
			return   // <NOTHING MORE TO DO>
			
		End if 
		
		//________________________________________________________________________________
End case 

// Ensure that the name is unique & valid
$name:=cs:C1710._wp.me.normalizeStyleSheetName($name; Form:C1466.document)
$success:=Length:C16($name)>0

If ($success)
	
/* 📌 Requirement #21267
	
When the selected paragraph has a listStyleType applied to it (not necessarily a style sheet), 
the “New style sheet based on selection” button shall create a multi-level list of 1 level based on the style
	
*/
	// Normal $styleSheet.type=1; listStyleType=0; listLevelCount=null
	// listStyleType & 
	
	If ($styleSheet.listStyleType#Null:C1517)
		
		var $to:=WP New style sheet:C1650(Form:C1466.document; $type; $name; 1)
		
	Else 
		
		$to:=($styleSheet.listLevelCount#Null:C1517) || ($source.listLevelCount#Null:C1517)\
			 ? WP New style sheet:C1650(Form:C1466.document; $type; $name; $styleSheet.listLevelCount || $source.listLevelCount)\
			 : WP New style sheet:C1650(Form:C1466.document; $type; $name)
		
	End if 
	
	Case of 
			
			//________________________________________________________________________________
		: ($newFromSelection)
			
			WP_StylesheetSetAttributes({list: WP_GetStyleAttributesByType($type); from: $from; to: $to; remove: True:C214})
			WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $to)
			
			//________________________________________________________________________________
		: ($duplicate)
			
			$from:=WP Get style sheet:C1656(Form:C1466.document; $source.name)
			WP_StylesheetCopyAttributes({from: $from; to: $to})
			
			//________________________________________________________________________________
	End case 
	
	
	WP_GetStyleSheets  // Update the list
	
End if 


