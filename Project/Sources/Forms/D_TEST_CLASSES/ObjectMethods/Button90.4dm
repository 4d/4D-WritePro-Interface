<<<<<<< Updated upstream

var $wp : cs:C1710.WPdocument
var $pictElem : cs:C1710.WPelement
var $picture : Picture
var $pictures : Collection

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)

$pictures:=$wp.getElements(wk type image inline:K81:247)
If ($pictures.length>=3)
	
	$pictures[2].delete()
	
End if 
=======
var $properties : Object

If (Shift down:C543)
	$properties:={visibleHorizontalRuler: True:C214; visibleVerticalRuler: False:C215}
Else 
	$properties:={visibleHorizontalRuler: False:C215; visibleVerticalRuler: True:C214}
End if 

//$doc:=cs.WPdocument.new()

WP SET VIEW PROPERTIES:C1648(*; "WParea"; $properties)
>>>>>>> Stashed changes
