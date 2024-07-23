var $wp : Object
var $sec : cs:C1710.WPsection

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)
$sec:=$wp.getSection(2)

$sec.tableSplitCells()

