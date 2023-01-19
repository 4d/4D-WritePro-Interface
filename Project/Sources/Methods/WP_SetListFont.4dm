//%attributes = {"invisible":true}
#DECLARE($range : Object)  // $range:  a text range 

var $paragraphFont; $listFont : Text
var $listType : Integer

$range:=WP Paragraph range:C1346($range)  // transform into § range
WP GET ATTRIBUTES:C1345($range; wk font:K81:69; $paragraphFont; wk list font:K81:60; $listFont; wk list style type:K81:55; $listType)  // ACI xxxxxxx  2023/01/19

If ($paragraphFont#"") && ($listType#0) && ($listFont#$paragraphFont)  // ACI xxxxxxx  2023/01/19
	// the same font is used in the whole paragraph
	// AND a list type is used
	// AND the font of the list is not the same as the font of the paragraph
	WP SET ATTRIBUTES:C1342($range; wk list font:K81:60; $paragraphFont)
End if 
