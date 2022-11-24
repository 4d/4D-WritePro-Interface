WP UpdateWidget("WPtoolbar"; "WParea")
















//WP ContextualMenu(New collection("pictureSettings"; "formulaSettings"))


//If (Form event code=On Double Clicked) | (Shift down)  // shift down to allow anchored picture selection (test)


//WP PictureSettings()
//WP FormulaSettings()

////$range:=WP Selection range(Self->)
////WP PictureSettings($range)
////WP FormulaSettings($range)

//// TEST no error
//// $_pictElems:=WP Get elements($range; wk type image)
//// If ($_pictElems.length>0)
//// WP PictureSettings($_pictElems[0])  // illegal
//// End if 

//End if 



