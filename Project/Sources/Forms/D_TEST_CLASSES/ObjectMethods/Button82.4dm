var $wp : cs:C1710.WPdocument
var $table : cs:C1710.WPtable

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)

$table:=$wp.getElements(wk type table:K81:222)[0]
$table.deleteRows(3; 2)


