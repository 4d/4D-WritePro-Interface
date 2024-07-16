
var $area : cs:C1710.WPdocument
var $range : cs:C1710.WPrange
var $request : Text

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$request:=Request:C163("name")
If (ok=1)
	$range:=$area.bookmarkRange($request)
	ALERT:C41(JSON Stringify:C1217($range))
	ALERT:C41($range.getText())
End if 
