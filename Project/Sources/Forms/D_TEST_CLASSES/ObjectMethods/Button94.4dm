var $doc : cs:C1710.WPdocument
var $range : Object

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)
$range:=$doc.selectionRange("WParea")
ALERT:C41(JSON Stringify:C1217($range; *))

