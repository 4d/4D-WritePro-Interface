//%attributes = {"invisible":true}
C_BOOLEAN:C305($delete)
C_LONGINT:C283($stylesheetType)
C_POINTER:C301($ptrListbox;$ptrStylesheetNames)
C_TEXT:C284($menu;$menuLabel;$choice)
C_LONGINT:C283($p)
C_TEXT:C284($stylesheetName)

$ptrListbox:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_StyleSheets")
$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5;"stylesheet_Names")
If (Not:C34(Is nil pointer:C315($ptrListbox)))  // executed from palette
	$p:=Find in array:C230($ptrListbox->;True:C214)
Else   // executed from toolbar
	$p:=$ptrStylesheetNames->
End if 

If ($p>0)
	$stylesheetName:=$ptrStylesheetNames->{$p}
Else 
	$stylesheetName:=""
End if 

If ($stylesheetName="normal") | ($stylesheetName="")
	
	  //$delete:=False
	  // should NEVER happend, the button should be disabled
	
	
Else 
	
	$stylesheetType:=WP_GetStylesheetType   // wk type default or wk type paragraph
	
	
	  //CONFIRM(".Delete style sheet \""+$stylesheetName+"\"?";".delete";".cancel")
	  //If (ok=1)  // cancel = 1, delete = 0
	  //  //ALERT(".Style sheet can't be delete yet…")
	  //WP DELETE STYLE SHEET(Form.document;$stylesheetName)
	  //WP_GetStyleSheets   // refresh
	  //End if 
	  //SET TIMER(-1)
	
	$menu:=Create menu:C408
	$delete:=True:C214
	
	If ($delete)
		$menuLabel:=Get localized string:C991("menuDeleteStylesheet")
		$menuLabel:=Replace string:C233($menuLabel;"<1>";$stylesheetName)
		APPEND MENU ITEM:C411($menu;$menuLabel)
		SET MENU ITEM PARAMETER:C1004($menu;-1;"Delete")
	End if 
	
	If ($stylesheetType=wk type default:K81:190)
		APPEND MENU ITEM:C411($menu;Get localized string:C991("menuRemoveCharacterStyleshet"))
		SET MENU ITEM PARAMETER:C1004($menu;-1;"RemoveCharacterSS")
	End if 
	
	If ($stylesheetType=wk type paragraph:K81:191)
		APPEND MENU ITEM:C411($menu;Get localized string:C991("menuRemoveParagraphStylesheet"))
		SET MENU ITEM PARAMETER:C1004($menu;-1;"RemoveParagraphSS")
	End if 
	
	
	$choice:=Dynamic pop up menu:C1006($menu)
	RELEASE MENU:C978($menu)
	Case of 
		: ($choice="Delete")
			
			CONFIRM:C162(Replace string:C233(Get localized string:C991("confirmDeleteStylesheet");"<1>";$stylesheetName);Get localized string:C991("delete");Get localized string:C991("cancel"))
			If (ok=1)
				WP DELETE STYLE SHEET:C1652(Form:C1466.document;$stylesheetName)
			End if 
			WP_GetStyleSheets 
			
		: ($choice="RemoveCharacterSS")
			WP RESET ATTRIBUTES:C1344(Form:C1466.selection;wk style sheet:K81:63)
			
		: ($choice="RemoveParagraphSS")
			WP RESET ATTRIBUTES:C1344(WP Paragraph range:C1346(Form:C1466.selection);wk style sheet:K81:63)
			
	End case 
	
	SET TIMER:C645(-1)
	
End if 





