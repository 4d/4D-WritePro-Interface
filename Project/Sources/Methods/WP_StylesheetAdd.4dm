//%attributes = {"invisible":true}
// MARK:- Display menu
var $menu:=Create menu:C408

APPEND MENU ITEM:C411($menu; Localized string:C991("menuNewFromSelection"))
SET MENU ITEM PARAMETER:C1004($menu; -1; "newFromSelection")

var $styleSheets:=cs:C1710._wp.me.styleSheets.orderBy("name")
var $length:=$styleSheets.length

If ($length>0)  // 😇 No "duplicate" if no items !
	
	var $submenu:=Create menu:C408
	
	var $i : Integer
	
	For ($i; 0; $length-1; 1)
		
		If (Match regex:C1019("(?m-si)\\slvl\\s\\d+$"; $styleSheets[$i].name; 1))  // Levels
			
			continue
			
		End if 
		
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
var $new:=$choice="newFromSelection"
var $duplicate:=Position:C15("duplicate_"; $choice)=1

var $selectedType:=cs:C1710._wp.me.selectedSyleSheetType()  // 0 = Paragraph, 1 = Font, 6 = List
var $type : Integer:=$selectedType=6 ? wk type paragraph:K81:191 : $selectedType

Case of 
		
		// ________________________________________________________________________________
	: ($new)
		
		var $name:=cs:C1710._wp.me.newStyleSheetName(Localized string:C991("requestPlaceHolder"); Form:C1466.document; $type)
		
		If (Length:C16($name)=0)
			
			return   // <NOTHING MORE TO DO>
			
		End if 
		
		Case of 
				
				// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			: ($type=wk type default:K81:190)
				
				var $from : Object:=Form:C1466.selection
				
				// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			: ($selectedType=6)\
				 || ($type=wk type paragraph:K81:191)
				
				$from:=WP Paragraph range:C1346(Form:C1466.selection)
				var $styleSheet : Object
				WP Get attributes:C1345($from; wk style sheet:K81:63; $styleSheet)
				
				// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
		End case 
		
		// ________________________________________________________________________________
	: ($duplicate)
		
		$styleSheet:=$styleSheets[Num:C11(Delete string:C232($choice; 1; 10))]  // Remove prefix "duplicate_"
		
		$name:=cs:C1710._wp.me.newStyleSheetName($styleSheet.name; Form:C1466.document; $type)
		
		If (Length:C16($name)=0)
			
			return   // <NOTHING MORE TO DO>
			
		End if 
		
		// ________________________________________________________________________________
End case 

var $levelCount : Integer:=Num:C11($styleSheet.listLevelCount)

If ($levelCount=0)
	
/* 📌 Requirement #21267
		
When the selected paragraph has a listStyleType applied to it (not necessarily a style sheet), 
the “New style sheet based on selection” button shall create a multi-level list of 1 level based on the style
		
*/
	If (Num:C11(WP Get attributes:C1345($from; [wk list style type:K81:55])[wk list style type:K81:55])>0)
		
		var $to:=WP New style sheet:C1650(Form:C1466.document; $type; $name; 1)
		
	Else 
		
		$to:=WP New style sheet:C1650(Form:C1466.document; $type; $name)
		
	End if 
	
Else 
	
	$to:=WP New style sheet:C1650(Form:C1466.document; $type; $name; $levelCount)
	
End if 

Case of 
		
		// ________________________________________________________________________________
	: ($new)
		
		WP_StylesheetSetAttributes({list: WP_GetStyleAttributesByType($selectedType); from: $from; to: $to; remove: True:C214})
		WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $to)
		
		// ________________________________________________________________________________
	: ($duplicate)
		
		$from:=WP Get style sheet:C1656(Form:C1466.document; $styleSheet.name)
		WP_StylesheetCopyAttributes({from: $from; to: $to})
		
		// ________________________________________________________________________________
End case 

cs:C1710._wp.me.updateListOfStyleSheets()