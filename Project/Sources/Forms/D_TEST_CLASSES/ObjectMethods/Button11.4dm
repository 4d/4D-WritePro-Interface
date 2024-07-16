
var $area : cs:C1710.WPdocument
var $textBox : cs:C1710.WPelement
var $breaks : Collection
var $range : cs:C1710.WPrange
var $i; $n : Integer

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$breaks:=$area.getBreaks()

$n:=$breaks.length-1
For ($i; $n; 0; -1)
	$breaks[$i].setText("•••")
End for 


