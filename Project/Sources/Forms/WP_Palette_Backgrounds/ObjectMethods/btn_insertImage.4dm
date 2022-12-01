var $pict : Picture
var $url; $menu; $result : Text
var $_formulas : Collection

If (Form:C1466.selection#Null:C1517)
	
	WP GET ATTRIBUTES:C1345(Form:C1466.selection; wk image url:K81:218; $url)
	$_formulas:=WP Get formulas:C1702(Form:C1466.selection)
	
	$menu:=Create menu:C408
	
	If ($_formulas.length>0)
		APPEND MENU ITEM:C411($menu; Get localized string:C991("editImageFormula"))
		SET MENU ITEM PARAMETER:C1004($menu; -1; "insertFormula")
		
	Else 
		If ($url#"") & ($url#"data:@")
			APPEND MENU ITEM:C411($menu; Get localized string:C991("editImageURL"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "editURL")
		Else 
			APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
			SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "insertImage")
			
			APPEND MENU ITEM:C411($menu; Get localized string:C991("insertImageURL"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "insertURL")
			
			APPEND MENU ITEM:C411($menu; Get localized string:C991("insertImageFormula"))
			SET MENU ITEM PARAMETER:C1004($menu; -1; "insertFormula")
		End if 
	End if 
	
	$result:=Dynamic pop up menu:C1006($menu)
	
	Case of 
		: ($result="insertURL")
			$url:=Request:C163(Get localized string:C991("URLhyphen"))
			
			If (ok=1)
				WP INSERT PICTURE:C1437(Form:C1466.selection; $pict; wk replace:K81:177)
				WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk image url:K81:218; $url)
			End if 
			
		: ($result="editURL")
			
			$url:=Request:C163(Get localized string:C991("URLhyphen"); $url)
			If (ok=1)
				WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk image url:K81:218; $url)
			End if 
			
		: ($result="insertFormula")
			
			//WP_Set4Dexpression
			WP_SetFormula
	End case 
	
	RELEASE MENU:C978($menu)
	
	
End if 
