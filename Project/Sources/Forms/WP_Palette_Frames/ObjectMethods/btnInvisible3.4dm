
//C_LONGINT($color)
//C_OBJECT($oCurrent)

//$color:=Call_CustomColorPalette(False; "borderColor")

//If ($color#-1)

//If ($color>=0)

//OBJECT SET RGB COLORS(*; "borderColor"; $color; $color)

//$oCurrent:=WP_FillCurrent
//WP_SetFrame($oCurrent; wk border color)

//Else 
//If ($color=-2)  // other…
//OPEN COLOR PICKER
//GOTO OBJECT(*; "borderColor")  // gives the focus to the object that will manage the color…
//End if 
//End if 

//End if 