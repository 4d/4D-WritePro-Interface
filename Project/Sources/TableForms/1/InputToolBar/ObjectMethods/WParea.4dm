WP UpdateWidget("WPtoolbar"; "WParea")

//WP ContextualMenu(New collection("pictureSettings"; "formulaSettings"; "tableSettings"))


If (Form event code:C388=On Clicked:K2:4) && (Contextual click:C713)
	$menu:=Create menu:C408
	APPEND MENU ITEM:C411($menu; ak standard action title:K76:83)
	SET MENU ITEM PROPERTY:C973($menu; -1; Associated standard action:K56:1; "spell")
	
	$result:=Dynamic pop up menu:C1006($menu)
	RELEASE MENU:C978($menu)
	
End if 

//If (Form event code=On Double Clicked) | (Shift down)  // shift down to allow anchored picture selection (test)

//WP PictureSettings()
//WP FormulaSettings()
//WP TableSettings()

////$range:=WP Selection range(Self->)
////WP PictureSettings($range)
////WP FormulaSettings($range)

//// TEST no error
//// $_pictElems:=WP Get elements($range; wk type image)
//// If ($_pictElems.length>0)
//// WP PictureSettings($_pictElems[0])  // illegal
//// End if 

//End if 

//vEvent:=FORM Event.description+" "+String(Random)


//If (Form event code=On After Edit) & (Shift down)
//TRACE
//End if 




