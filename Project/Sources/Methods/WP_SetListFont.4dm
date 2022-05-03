//%attributes = {"invisible":true}
#DECLARE($range : Object)  // $range:  a text range 

var $paragraphFont : Text

$range:=WP Paragraph range:C1346($range)  // transform into § range
WP GET ATTRIBUTES:C1345($range; wk font:K81:69; $paragraphFont)  // if the font is the same in the whole paragraph, then apply to list font too
If ($paragraphFont#"")
	WP SET ATTRIBUTES:C1342($range; wk list font:K81:60; $paragraphFont)
End if 
