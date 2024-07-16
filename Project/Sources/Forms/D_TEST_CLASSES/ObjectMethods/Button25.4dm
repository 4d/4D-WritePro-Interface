
var $area : cs:C1710.WPdocument
var $range : cs:C1710.WPrange
var $table : cs:C1710.WPtable

var $name : Text

$area:=cs:C1710.WPdocument.new()
$table:=$area.insertTable(wk append:K81:179; wk include in range:K81:180; 3; 6)

Form:C1466.wp:=$area.document
