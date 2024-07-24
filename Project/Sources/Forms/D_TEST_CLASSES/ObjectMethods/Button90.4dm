
var $wp : cs:C1710.WPdocument
var $pictElem : cs:C1710.WPelement
var $picture : Picture
var $pictures : Collection

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)

$pictures:=$wp.getElements(wk type image inline:K81:247)
If ($pictures.length>=3)
	
	$pictures[2].delete()
	
End if 