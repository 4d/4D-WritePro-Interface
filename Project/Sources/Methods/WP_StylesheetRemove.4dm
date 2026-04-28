//%attributes = {"invisible":true}
var $ui:=cs:C1710._ui.me
var $name : Text:=$ui.selectedStyleSheetName()

If ($name="normal")\
 | (Length:C16($name)=0)
	
	return   // Should NEVER happend, the button should be disabled
	
End if 

var $selectedType:=$ui.selectedSyleSheetType()
var $type:=$ui.selectedSyleSheetType(True:C214)

/* 📌 Requirement #21270

When the selected paragraph has a root-level or sub-level style sheet applied to it, 
the “Delete STYLENAME style sheet”, "Remove STYLENAME style sheet" and "Update style sheet" buttons
shall have the same behavior as with other types of style sheets.

• If a root-level style sheet is applied to the selected paragraph:
  - the root-level style sheet along with its sub-level style sheets shall be deleted
  - in this case a confirmation message warning the user that all sub-level style sheets 
    will be deleted as well shall be displayed before the deletion

• If a sub-level style sheet is applied to the selected paragraph, then only the sub-level is deleted

*/

var $isRootLevel : Boolean:=($selectedType=6) && Not:C34(Match regex:C1019("\\slvl\\s\\d"; $name; 1))

var $menu:=Create menu:C408

APPEND MENU ITEM:C411($menu; Replace string:C233(Localized string:C991("menuDeleteStylesheet"); "<1>"; $name))
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
		
		If ($isRootLevel)\
			 && (WP Get style sheet:C1656($ui.document; $name; 2)#Null:C1517)  //At least one sub-level
			
			$message+="\r\r"+Localized string:C991("allSub-levelStyleSheetsWillBeRemoved")
			
		End if 
		
		CONFIRM:C162($message; Localized string:C991("delete"))
		
		If (Not:C34(Bool:C1537(OK)))
			
			return 
			
		End if 
		
		WP DELETE STYLE SHEET:C1652($ui.document; $name)
		
		$ui.updateListOfStyleSheets()
		
		// ________________________________________________________________________________
	: ($choice="character")
		
		WP RESET ATTRIBUTES:C1344($ui.selection; wk style sheet:K81:63)
		
		// ________________________________________________________________________________
	: ($choice="paragraph")
		
		WP RESET ATTRIBUTES:C1344($ui.paragraph; wk style sheet:K81:63)
		
		// ________________________________________________________________________________
End case 

SET TIMER:C645(-1)