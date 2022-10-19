var $menuRef; $applyTo; $select : Text

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		INVOKE ACTION:C1439("insertTextbox")
		
	: (Form event code:C388=On Alternative Click:K2:36)
		
		$menuRef:=Create menu:C408
		$applyTo:="textBox"
		
		APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/borderColor")
		
		APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/borderWidth")
		
		APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/borderStyle")
		
		APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/backgroundColor")
		
		APPEND MENU ITEM:C411($menuRef; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menuRef; -1; Associated standard action name:K28:8; $applyTo+"/borderRadius")
		
		
		$select:=Dynamic pop up menu:C1006($menuRef)
		
		RELEASE MENU:C978($menuRef)
		
	: (Form event code:C388=On Clicked:K2:4)
		
End case 
