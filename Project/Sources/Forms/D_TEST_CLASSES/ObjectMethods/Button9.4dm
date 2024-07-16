
var $area : cs:C1710.WPdocument
var $textBox : cs:C1710.WPelement
var $rangeCollection : Collection
var $range : cs:C1710.WPrange

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$rangeCollection:=$area.findAll("tempus"; wk whole word:K81:333; "green")

For each ($range; $rangeCollection)
	$range.setAttributes({color: "green"; fontBold: True:C214})
End for each 