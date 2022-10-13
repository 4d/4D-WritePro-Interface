//C_OBJECT($oCurrent)
//C_LONGINT($color)

//Case of 
//: (Form event code=On Getting Focus)
//OBJECT SET VISIBLE(*; "FakeFocusBorderColor"; True)

//: (Form event code=On Losing Focus)
//OBJECT SET VISIBLE(*; "FakeFocusBorderColor"; False)

//: (Form event code=On After Edit)

//OBJECT GET RGB COLORS(Self->; $color)  // get the color of the text
//OBJECT SET RGB COLORS(Self->; $color; $color)  // set the same color on the background

//$oCurrent:=WP_FillCurrent
//WP_SetFrame($oCurrent; wk border color)

//End case 
