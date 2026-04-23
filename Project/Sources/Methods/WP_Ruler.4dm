//%attributes = {"invisible":true}
#DECLARE($mode : Text)

var $tabs : Collection
var $marginLeft; $marginRight; $textIndent : Real
var $direction : Integer

Case of 
	: ($mode="copy")
		
		formData.ruler:=New object:C1471
		
		WP Get attributes:C1345(Form:C1466.selection; wk tabs:K81:278; $tabs; wk margin left:K81:11; $marginLeft; wk margin right:K81:12; $marginRight; wk text indent:K81:52; $textIndent; wk direction:K81:50; $direction)
		
		formData.ruler.tabs:=$tabs
		formData.ruler.marginLeft:=$marginLeft
		formData.ruler.marginRight:=$marginRight
		formData.ruler.textIndent:=$textIndent
		formData.ruler.direction:=$direction
		
	: ($mode="paste")
		
		If (formData.ruler#Null:C1517)
			WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk tabs:K81:278; formData.ruler.tabs; wk margin left:K81:11; formData.ruler.marginLeft; wk margin right:K81:12; formData.ruler.marginRight; wk text indent:K81:52; formData.ruler.textIndent; wk direction:K81:50; formData.ruler.direction)
		End if 
		
End case 