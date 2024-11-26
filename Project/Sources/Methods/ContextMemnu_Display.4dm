//%attributes = {}
#DECLARE($areaName : Text; $menuKinds : Collection)  // ex : ["table";"picture";"paragraph"]

var $concerned : Collection
var $selection : Object
var $kind; $concernedType; $menu; $choice : Text
var $tablecount : Integer

//var $isInTable : Boolean

If (Form event code:C388=On Clicked:K2:4) && (Contextual click:C713)
	
	$concerned:=New collection:C1472
	$selection:=WP Selection range:C1340(*; $areaName)
	
	For each ($kind; $menuKinds)
		Case of 
			: ($kind="spell")
				$concerned.push("spell")  // always
			: ($kind="paragraph")
				$concerned.push("paragraph")  // always
				
			: ($kind="table")
				$tablecount:=WP Get elements:C1550($selection; wk type table:K81:222).length
				If ($tablecount>0)
					$concerned.push("table")
				End if 
				
		End case 
	End for each 
	
	$menu:=Create menu:C408
	
	// etc.
	
	If ($concerned.length>0)
		For each ($concernedType; $concerned)
			
			
			Case of 
					
				: ($concernedType="paragraph")
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "textAlign")
					//APPEND MENU ITEM($menu; ak standard action title)
					//SET MENU ITEM PROPERTY($menu; -1; Associated standard action; "textAlign?value=right")
					//APPEND MENU ITEM($menu; ak standard action title)
					//SET MENU ITEM PROPERTY($menu; -1; Associated standard action; "textAlign?value=center")
					//APPEND MENU ITEM($menu; ak standard action title)
					//SET MENU ITEM PROPERTY($menu; -1; Associated standard action; "textAlign?value=justify")
					
					APPEND MENU ITEM:C411($menu; "-")
					
					
				: ($concernedType="table")
					
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "table")
					APPEND MENU ITEM:C411($menu; "-")
					
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "insertRowAbove")
					
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "insertRowBelow")
					
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "deleteRows")
					
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "insertColumnToTheLeft")
					
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "insertColumnToTheRight")
					
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "deleteColumns")
					
					APPEND MENU ITEM:C411($menu; "-")
					
				: ($concernedType="spell")
					
					APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
					SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "spell")
					
					APPEND MENU ITEM:C411($menu; "-")
					
			End case 
			
		End for each 
	End if 
	
	$choice:=Dynamic pop up menu:C1006($menu)
	RELEASE MENU:C978($menu)
	
End if 