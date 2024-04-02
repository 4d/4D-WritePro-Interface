If ((Self:C308->)=0)
	
	If (Contextual click:C713)
		
		var $menu : Text
		
		$menu:=Create menu:C408
		
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; wk text linethrough style:K81:75)
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; wk text linethrough color:K81:76)
		
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; wk text underline style:K81:73)
		
		APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
		SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; wk text underline color:K81:74)
		
		$menu:=Dynamic pop up menu:C1006($menu)
		
	End if 
	
End if 
