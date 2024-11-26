//%attributes = {"invisible":true}
#DECLARE($mode : Text)

var $tabs : Collection
var $marginLeft; $marginRight; $textIndent : Real
var $direction : Integer

Case of 
	: ($mode="copy")
		
		oForm.ruler:=New object:C1471
		
		WP Get attributes:C1345(Form:C1466.selection; wk tabs:K81:278; $tabs; wk margin left:K81:11; $marginLeft; wk margin right:K81:12; $marginRight; wk text indent:K81:52; $textIndent; wk direction:K81:50; $direction)
		
		oForm.ruler.tabs:=$tabs
		oForm.ruler.marginLeft:=$marginLeft
		oForm.ruler.marginRight:=$marginRight
		oForm.ruler.textIndent:=$textIndent
		oForm.ruler.direction:=$direction
		
	: ($mode="paste")
		
		If (oForm.ruler#Null:C1517)
			WP SET ATTRIBUTES:C1342(Form:C1466.selection; wk tabs:K81:278; oForm.ruler.tabs; wk margin left:K81:11; oForm.ruler.marginLeft; wk margin right:K81:12; oForm.ruler.marginRight; wk text indent:K81:52; oForm.ruler.textIndent; wk direction:K81:50; oForm.ruler.direction)
		End if 
		
End case 