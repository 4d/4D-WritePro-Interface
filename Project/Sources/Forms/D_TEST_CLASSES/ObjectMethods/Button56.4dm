var $wp : cs:C1710.WPdocument
var $range : cs:C1710.WPrange


$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)

$range:=$wp.tableGetColumns()
$range.setAttributes({color: "blue"})
