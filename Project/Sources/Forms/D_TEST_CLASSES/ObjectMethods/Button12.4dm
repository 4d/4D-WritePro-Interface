
var $area : cs:C1710.WPdocument
var $element : cs:C1710.WPelement

var $elements : Collection
var $i : Integer

$area:=cs:C1710.WPdocument.new(Form:C1466.wp)

$elements:=$area.getElements(wk type paragraph:K81:191)

$i:=0
For each ($element; $elements)
	If ($i%2=0)
		$element.setAttributes({textAlign: wk left:K81:95; color: "indigo"})
	Else 
		$element.setAttributes({textAlign: wk right:K81:96; color: "darkgrey"})
	End if 
	$i+=1
End for each 


