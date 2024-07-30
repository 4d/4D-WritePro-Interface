<<<<<<< Updated upstream

var $wp : cs:C1710.WPdocument
var $element : cs:C1710.WPelement

var $links : Collection
var $link : Object
var $i; $n : Integer

//If (Shift down)

$wp:=cs:C1710.WPdocument.new(Form:C1466.wp)
$links:=$wp.getLinks()
For each ($link; $links)
	$link.range.setAttributes({color: "fuchsia"; fontBold: True:C214})
End for each 

//Else 

//$links:=WP Get links(Form.wp)
//For each ($link; $links)
//WP SET ATTRIBUTES($link.range; "color"; "green"; "fontBold"; False)
//End for each 

//End if 


=======
var $doc : cs:C1710.WPdocument
var $properties : Object

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)
$properties:=$doc.getViewProperties("WParea")
ALERT:C41(JSON Stringify:C1217($properties; *))
>>>>>>> Stashed changes

