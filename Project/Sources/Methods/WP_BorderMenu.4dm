//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2)


  //C_LONGINT($menu)
C_TEXT:C284($applyTo)
C_TEXT:C284($select)
C_TEXT:C284($where)
C_TEXT:C284($menuRef)
C_BOOLEAN:C305($withMenu)

$where:=$1
$withMenu:=$2

Case of 
	: (WP_applyTo=1)
		$applyTo:="section"
	: (WP_applyTo=2)
		$applyTo:="paragraph"
	: (WP_applyTo=3)
		$applyTo:="image"
	: (WP_applyTo=4)
		$applyTo:="table"
	: (WP_applyTo=5)
		$applyTo:="cell"
	: (WP_applyTo=6)
		$applyTo:="row"
End case 

If ($withMenu)
	
	  // read the "applyTo"
	
	$menuRef:=Create menu:C408
	APPEND MENU ITEM:C411($menuRef;Get localized string:C991("bordersStyle"))
	SET MENU ITEM PROPERTY:C973($menuRef;-1;Associated standard action:K28:8;$applyTo+"/borderStyle"+$where)
	
	APPEND MENU ITEM:C411($menuRef;Get localized string:C991("bordersColor"))
	SET MENU ITEM PROPERTY:C973($menuRef;-1;Associated standard action:K28:8;$applyTo+"/borderColor"+$where)
	
	APPEND MENU ITEM:C411($menuRef;Get localized string:C991("borderWidth"))
	SET MENU ITEM PROPERTY:C973($menuRef;-1;Associated standard action:K28:8;$applyTo+"/borderWidth"+$where)
	
	$select:=Dynamic pop up menu:C1006($menuRef)
	
	RELEASE MENU:C978($menuRef)
	
	
Else 
	
	INVOKE ACTION:C1439($applyTo+"/borderStyle"+$where+"?value=solid")
	
	  //INVOKE ACTION($applyTo+"/borderColor"+$where+"?value=black")
	  //INVOKE ACTION($applyTo+"/borderWidth"+$where+"?value=1pt")
	  //INVOKE ACTION($applyTo+"/padding"+$where+"?value=5pt")
	
End if 
