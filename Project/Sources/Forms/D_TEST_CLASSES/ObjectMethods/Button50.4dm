var $wp : Object
var $table : Object

var $i : Integer

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)

$table:=$wp.getElements(wk type table:K81:222)[0]
For ($i; 1; 5)
	$table.appendRow(Random:C100; Random:C100; Random:C100; Random:C100; Random:C100)
End for 
