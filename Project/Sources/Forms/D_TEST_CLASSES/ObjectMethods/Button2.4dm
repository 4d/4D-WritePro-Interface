
var $area : cs:C1710.WPdocument
var $range : cs:C1710.WPrange

var $name : Text

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

//$range:=$area.textRange(1; 10)

$range:=cs:C1710.WPrange.new(WP Selection range:C1340(*; "WParea"))


$name:=$range.getText()

If ($name#"")
	//$area.newBookmark(WP Selection range(*; "WParea"); $name)
	If (Shift down:C543)
		$area.newBookmark($range; $name)
	Else 
		$area.newBookmark(WP Selection range:C1340(*; "WParea"); $name)
	End if 
End if 

