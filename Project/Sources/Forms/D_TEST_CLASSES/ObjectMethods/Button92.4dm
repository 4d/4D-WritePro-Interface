

var $doc : cs:C1710.WPdocument
var $properties : Object

If (Shift down:C543)
	$properties:={visibleHorizontalRuler: True:C214; visibleVerticalRuler: False:C215}
Else 
	$properties:={visibleHorizontalRuler: False:C215; visibleVerticalRuler: True:C214}
End if 

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)
$doc.setViewProperties("WParea"; $properties)

