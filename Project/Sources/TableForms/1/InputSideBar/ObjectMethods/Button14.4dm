// ACI0104407 no more dependencies with 4D SVG

// the whole method has been commented
// (could be decommented for temporary use)


//C_LONGINT($i; $j; $x; $y; $width; $height; $svgWidth; $svgHeight)
//C_OBJECT($sel; $cells; $currentCell)
//C_TEXT($path)
//C_TEXT($color)
//C_TEXT($svg; $svgRect)

//$width:=20
//$height:=6


//$sel:=WP Selection range([SAMPLE]WP)
//$cells:=WP Table get cells($sel)
//If (Not($cells=Null))

//$svgWidth:=($width*$cells.columnCount)+2
//$svgHeight:=($height*$cells.rowCount)+1

//If ($svgWidth<82)
//$svgWidth:=82
//End if 
//If ($svgHeight<30)
//$svgHeight:=30
//End if 


//SVG_SET_OPTIONS(SVG_Get_options ?+ 5)

//$svg:=SVG_New($svgWidth; $svgHeight)  //;"";"")  //;True)//;Scaled to fit prop centered)
//$x:=1
//$y:=1

//For ($i; 1; $cells.columnCount)

//For ($j; 1; $cells.rowCount)

//$currentCell:=WP Table get cells($cells.table; $i; $j; 1; 1)
//WP GET ATTRIBUTES($currentCell; wk background color; $color)

//$svgRect:=SVG_New_rect($svg; $x; $y; $width; $height; 0; 0; "black"; $color; 1)


//$y:=$y+$height
//End for 
//$x:=$x+$width
//$y:=1

//End for 

//SVG_SET_SHAPE_RENDERING($svg; "crispEdges")

////SVGTool_SHOW_IN_VIEWER ($svg)

//SVG EXPORT TO PICTURE($svg; vSVG)

//$path:=Get 4D folder(Current resources folder)+"table_templates"
//$Path:=$path+Folder separator+"TableTemplate_"+String(templateID; "00")+".png"
//WRITE PICTURE FILE($path; vSVG; ".png")

//End if 


