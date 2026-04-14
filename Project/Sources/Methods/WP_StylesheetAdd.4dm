//%attributes = {"invisible":true}


var $ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "stylesheet_Names")
var $typeStylesheet:=WP_GetStylesheetType/* 0 = Paragraph, 1 = Font, 6 = List */

// MARK:- Create menu
var $menu:=Create menu:C408

APPEND MENU ITEM:C411($menu; Localized string:C991("menuNewFromSelection"))
SET MENU ITEM PARAMETER:C1004($menu; -1; "newFromSelection")

var $n : Integer:=Size of array:C274($ptrStylesheetNames->)

If ($n>0)  // No "duplicate" if no items !
	
	var $submenu:=Create menu:C408
	var $i : Integer
	For ($i; 1; $n; 1)
		
		APPEND MENU ITEM:C411($submenu; $ptrStylesheetNames->{$i})
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
ARRAY TEXT:C222($allstylesheet_Names; 0)
COLLECTION TO ARRAY:C1562(WP Get style sheets:C1655(Form:C1466.document; wk type character:K81:296).extract("name").concat(WP Get style sheets:C1655(Form:C1466.document; wk type paragraph:K81:191).extract("name")); $allstylesheet_Names)

var $rqTitle:=Localized string:C991("requestTitle")
var $rqPlaceHolder:=Localized string:C991("requestPlaceHolder")
var $rqOK:=Localized string:C991("requestCreateLabel")
var $rqCancel:=Localized string:C991("requestCancelLabel")
var $placeHolder:=Localized string:C991("StyleSheetPlaceHolder")

Case of 
		
		//________________________________________________________________________________
	: ($choice="new")\
		 | ($choice="newFromSelection")
		
		Repeat 
			
			// Method WP_Request created 2020/06/03 to fix the ACI0100879
			var $newName:=WP_Request($rqTitle; $rqPlaceHolder; $rqOK; $rqCancel; $placeHolder)
			
			If ($newName="section@")
				
				ALERT:C41(Localized string:C991("nameError"))
				
			End if 
		Until (($newName#"section@") & ($newName#"")) | (OK=0)
		
		//________________________________________________________________________________
	: ($choice="duplicate_@")
		
		$i:=Num:C11(Substring:C12($choice; 11))  // 11 = after the "_" in "duplicate_XXX"
		var $sourceName : Text:=$ptrStylesheetNames->{$i}
		$newName:=$sourceName
		
		Repeat 
			
			$newName:=TOOL_IncrementString($newName)
			var $pos : Integer:=Find in array:C230($allstylesheet_Names; $newName)
			
		Until ($pos<0)
		
		// Method WP_Request created 2020/06/03 to fix the ACI0100879
		$newName:=WP_Request($rqTitle; $rqPlaceHolder; $rqOK; $rqCancel; $placeHolder)
		
		//________________________________________________________________________________
End case 

If (Bool:C1537(OK))  // resuls of Request
	
	// just in case the user refuses the "x" added at the end…
	$pos:=Find in array:C230($allstylesheet_Names; $newName)
	
	While ($pos>0)
		
		$newName:=TOOL_IncrementString($newName)
		$pos:=Find in array:C230($allstylesheet_Names; $newName)
		
	End while 
	
	var $newStylesheet:=WP New style sheet:C1650(Form:C1466.document; $typeStylesheet; $newName)
	
	Case of 
			
			//________________________________________________________________________________
		: ($choice="newFromSelection")
			
			var $c:=WP_GetStyleAttributesByType($typeStylesheet)  // collection of attributes according to stylesheet TYPE
			
			Case of 
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
				: ($typeStylesheet=wk type default:K81:190)
					
					var $source : Object:=Form:C1466.selection
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
				: ($typeStylesheet=wk type paragraph:K81:191)
					
					$source:=WP Paragraph range:C1346(Form:C1466.selection)
					
					//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
			End case 
			
			var $o:={\
				list: $c; \
				from: $source; \
				to: $newStylesheet; \
				remove: True:C214}
			
			WP_StylesheetSetAttributes($o)
			WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk style sheet:K81:63; $newStylesheet)  // As an object
			
			//________________________________________________________________________________
		: ($choice="duplicate_@")
			
			$o:={\
				from: WP Get style sheet:C1656(Form:C1466.document; $sourceName); \
				to: $newStylesheet}
			
			WP_StylesheetCopyAttributes($o)  // $col;$sourceStylesheet;$newStylesheet)
			
			//________________________________________________________________________________
	End case 
	
	
	WP_GetStyleSheets  // Update the list
	
End if 


