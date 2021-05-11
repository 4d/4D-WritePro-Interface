//$userSel:=WP Selection range([SAMPLE]WP)

//$cells:=WP Table get cells($userSel)

//For ($col; $cells.firstColumn; $cells.firstColumn+$cells.columnCount-1)
//For ($row; $cells.firstRow; $cells.firstRow+$cells.rowCount-1)

//// take cells one by one

//$cell:=WP Table get cells($cells.table; $col; $row; 1; 1)
//$cellRange:=WP Text range($cell; wk start text; wk end text)


////$where:=$cellRange  // KO
////$where:=[SAMPLE]WP  // KO
//$where:=WP Get body([SAMPLE]WP)  // OK

//$boldRange:=WP Text range($where; $cellRange.start; $cellRange.start+1)
//WP SET ATTRIBUTES($boldRange; wk font bold; wk true; wk background color; "lightBlue")

//$italicRange:=WP Text range($where; $cellRange.start+1; $cellRange.end)
//WP SET ATTRIBUTES($italicRange; wk font italic; wk true; wk background color; "Yellow")

//End for 
//End for 

