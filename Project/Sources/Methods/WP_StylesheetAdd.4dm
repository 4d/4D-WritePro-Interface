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
	
	return 
	
End if 

// MARK:- Action
var $title:=Localized string:C991("requestTitle")
var $default:=Localized string:C991("requestPlaceHolder")
var $okTitle:=Localized string:C991("requestCreateLabel")
var $cancelTitle:=Localized string:C991("requestCancelLabel")
var $placeHolder:=Localized string:C991("StyleSheetPlaceHolder")

Case of 
		
		//________________________________________________________________________________
	: ($choice="new")\
		 | ($choice="newFromSelection")
		
		Repeat 
			
			var $newName:=cs:C1710._wp.me.request($title; $default; $okTitle; $cancelTitle; $placeHolder)
			
			If ($newName="section@")
				
				ALERT:C41(Localized string:C991("nameError"))
				
			End if 
		Until (($newName#"section@") & ($newName#"")) | (OK=0)
		
		//________________________________________________________________________________
	: ($choice="duplicate_@")
		
		var $source : Object:=$styleSheets[Num:C11(Delete string:C232($choice; 1; 10))]
		var $sourceName : Text:=$source.name
		$newName:=cs:C1710._wp.me.normalizeStyleSheetName($source.name; Form:C1466.document)
		$newName:=cs:C1710._wp.me.request($title; $newName; $okTitle; $cancelTitle; $placeHolder)
		
		//________________________________________________________________________________
End case 

If (Bool:C1537(OK))  // resuls of Request
	
	var $typeStylesheet:=WP_GetStylesheetType/* 0 = Paragraph, 1 = Font, 6 = List */
	
	// Just in case the user refuses the "x" added at the end…
	$newName:=cs:C1710._wp.me.normalizeStyleSheetName($newName; Form:C1466.document)
	
	var $to : Object:=$source.levelCount#Null:C1517\
		 ? WP New style sheet:C1650(Form:C1466.document; $typeStylesheet; $newName; $source.levelCount)\
		 : WP New style sheet:C1650(Form:C1466.document; $typeStylesheet; $newName)
	
	Case of 
			
			//________________________________________________________________________________
		: ($choice="newFromSelection")
			
			var $attributes:=WP_GetStyleAttributesByType($typeStylesheet)  // collection of attributes according to stylesheet TYPE
			
			Case of 
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
				: ($typeStylesheet=wk type default:K81:190)
					
					var $from : Object:=Form:C1466.selection
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
				: ($typeStylesheet=wk type paragraph:K81:191)
					
					$from:=WP Paragraph range:C1346(Form:C1466.selection)
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			End case 
			
			WP_StylesheetSetAttributes({list: $attributes; from: $from; to: $to; remove: True:C214})
			
			WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $to)  // As an object
			
			//________________________________________________________________________________
		: ($choice="duplicate_@")
			
			$from:=WP Get style sheet:C1656(Form:C1466.document; $source.name)
			WP_StylesheetCopyAttributes({from: $from; to: $to})
			
			//________________________________________________________________________________
	End case 
	
	
	WP_GetStyleSheets  // Update the list
	
End if 


