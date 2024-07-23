var $wp : cs:C1710.WPdocument
var $range : cs:C1710.WPrange

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)
$range:=$wp.selectionRange("WParea")

$range:=$range.tableGetCells()

$range.setAttributes({backgroundColor: "lightgreen"})

