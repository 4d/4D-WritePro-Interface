
var $area : cs:C1710.WPdocument
var $attributes : Object

$area:=cs:C1710.WPdocument.new()
$area.setText("Charlie Delta "*50)

$attributes:={borderStyle: wk solid:K81:115; borderColor: "green"; borderWidth: "3pt"}
$area.setAttributes($attributes)


Form:C1466.wp:=$area.document

//$attributes:={}
//$attributes:=$area.getAttributes(["borderStyle"; "borderColor"; "borderWidth"])



