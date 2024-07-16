
var $area : cs:C1710.WPdocument
var $range : cs:C1710.WPrange
var $section : cs:C1710.WPsection
var $count : Integer

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$section:=$area.getSection(2)

$count:=$section.pageCount



