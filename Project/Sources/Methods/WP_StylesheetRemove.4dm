//%attributes = {"invisible":true}
var $hdl:=cs:C1710._wp.me
var $name : Text:=$hdl.selectedStyleSheetName()

If ($name="normal")\
 | (Length:C16($name)=0)
	
	return   // Should NEVER happend, the button should be disabled
	
End if 

var $selectedType:=$hdl.selectedSyleSheetType()
var $type:=$hdl.selectedSyleSheetType(True:C214)

/* 📌 Requirement #21270

When the selected paragraph has a root-level or sub-level style sheet applied to it, 
the “Delete STYLENAME style sheet”, "Remove STYLENAME style sheet" and "Update style sheet" buttons s
hall have the same behavior as with other types of style sheets (see description)

• If a root-level style sheet is applied to the selected paragraph:
  - the root-level style sheet along with its sub-level style sheets shall be deleted in this case
  - a confirmation message warning the user that all sub-level style sheets will be deleted as well shall be displayed before the deletion

• If a sub-level style sheet is applied to the selected paragraph, then only the sub-level is deleted

*/
var $isRootLevel : Boolean:=($selectedType=6) && Not:C34(Match regex:C1019("\\slvl\\s\\d"; $name; 1))

var $menu:=Create menu:C408

var $menuLabel:=Localized string:C991("menuDeleteStylesheet")
$menuLabel:=Replace string:C233($menuLabel; "<1>"; $name)
APPEND MENU ITEM:C411($menu; $menuLabel)
SET MENU ITEM PARAMETER:C1004($menu; -1; "Delete")

Case of 
		
		// ______________________________________________________
	: ($selectedType=6)\
		 || ($type=wk type paragraph:K81:191)
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("menuRemoveParagraphStylesheet"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "paragraph")
		// ______________________________________________________
	: ($type=wk type default:K81:190)
		
		APPEND MENU ITEM:C411($menu; Localized string:C991("menuRemoveCharacterStylesheet"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "character")
		
		// ______________________________________________________
End case 

var $choice:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)

Case of 
		
		// ________________________________________________________________________________
	: ($choice="Delete")
		
		var $message:=Replace string:C233(Localized string:C991("confirmDeleteStylesheet"); "<1>"; $name)
		
		If ($isRootLevel)
			
			// TODO: Check if at leas one sub-level
			
			$message+="\r\r.All sub-level style sheets will be removed."
			
		End if 
		
		CONFIRM:C162($message; Localized string:C991("delete"))
		
		If (Not:C34(Bool:C1537(OK)))
			
			return 
			
		End if 
		
		WP DELETE STYLE SHEET:C1652($hdl.document; $name)
		
		$hdl.updateListOfStyleSheets()
		
		// ________________________________________________________________________________
	: ($choice="character")
		
		WP RESET ATTRIBUTES:C1344($hdl.selection; wk style sheet:K81:63)
		
		// ________________________________________________________________________________
	: ($choice="paragraph")
		
		WP RESET ATTRIBUTES:C1344($hdl.paragraph; wk style sheet:K81:63)
		
		// ________________________________________________________________________________
End case 

SET TIMER:C645(-1)