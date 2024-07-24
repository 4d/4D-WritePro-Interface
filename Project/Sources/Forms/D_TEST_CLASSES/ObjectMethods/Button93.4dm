
var $wp : cs:C1710.WPdocument
var $pictElem : cs:C1710.WPelement
var $picture : Picture
var $pictures : Collection

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)

$pictures:=$wp.getElements(wk type image:K81:192)
If ($pictures.length>=1)
	
	$pictures[0].delete()
	
End if 