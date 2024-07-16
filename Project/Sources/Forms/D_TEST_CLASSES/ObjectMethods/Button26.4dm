
var $area : cs:C1710.WPdocument
var $range : cs:C1710.WPrange
var $table : cs:C1710.WPtable
var $section : cs:C1710.WPsection

var $name : Text

$area:=cs:C1710.WPdocument.new()
$area.insertBreak(wk section break:K81:187; wk append:K81:179)
$area.insertBreak(wk section break:K81:187; wk append:K81:179)

$section:=$area.getSection(2)
$table:=$section.insertTable(wk append:K81:179; wk include in range:K81:180; 3; 6)

Form:C1466.wp:=$area.document
