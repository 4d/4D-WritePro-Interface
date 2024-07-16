
var $area : cs:C1710.WPdocument
var $attributes : Object
var $range : cs:C1710.WPrange

Form:C1466.wp:=WP New:C1317

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)
$area.setText("Alpha Bravo "*50)

$attributes:={borderStyle: wk dashed:K81:117; borderColor: "red"; borderWidth: "4pt"}
$area.setAttributes($attributes)

$range:=$area.textRange(1; 10)
$range.setText("XXXXXXXXXX")

$range:=$area.textRange(11; 20)
$range.setText("YYYYYYYYYY")





