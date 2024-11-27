WP UpdateWidget("WPtoolbar"; "WParea")


ContextMemu_Display("WParea"; ["paragraph"; "table"; "spell"])




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




