
//C_LONGINT($x1; $y1; $x2; $y2)
////C_LONGINT($win)

//C_TEXT($Label; $URL)

//OBJECT GET COORDINATES(*; "SeparatorURL"; $x1; $y1; $x2; $y2)
//$y2:=$y2+5
//CONVERT COORDINATES($x1; $y2; XY Current form; XY Main window)

////$win:=Open form window("D_inputURL";Modal form dialog box;$x1;$y2)

//$Label:=(OBJECT Get pointer(Object named; "URLlabel"))->
//$URL:=(OBJECT Get pointer(Object named; "URLurl"))->

////DIALOG("D_inputURL")

//WP_Set4Durl($Label; $URL)

WP_SetURL
