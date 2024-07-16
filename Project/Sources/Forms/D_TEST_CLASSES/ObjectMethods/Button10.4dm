
var $area : cs:C1710.WPdocument
var $textBox : cs:C1710.WPelement
var $formulas : Collection
var $range : cs:C1710.WPrange
var $i; $n : Integer

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$formulas:=$area.getFormulas()
$n:=$formulas.length-1
For ($i; 0; $n)
	$formulas[$i].range.setAttributes({color: "red"; backgroundColor: "yellow"})
End for 


