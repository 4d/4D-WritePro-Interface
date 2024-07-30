var $doc : cs:C1710.WPdocument
var $properties : Object

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)
$properties:=$doc.getViewProperties("WParea")
ALERT:C41(JSON Stringify:C1217($properties; *))

