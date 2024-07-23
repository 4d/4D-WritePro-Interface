var $wp : Object
var $sec : cs:C1710.WPsection
var $range : cs:C1710.WPrange

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)
$sec:=$wp.getSection(2)

$range:=$sec.tableGetRows()
$range.setAttributes({color: "green"})