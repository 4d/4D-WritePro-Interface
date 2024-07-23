var $wp : cs:C1710.WPdocument
var $table : cs:C1710.WPtable
var $range : cs:C1710.WPrange

var $i : Integer

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)

$table:=$wp.getElements(wk type table:K81:222)[0]


$range:=$table.splitCells(2; 2; 2; 2)

