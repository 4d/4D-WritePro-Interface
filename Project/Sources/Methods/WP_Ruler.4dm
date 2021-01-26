//%attributes = {"invisible":true}
C_TEXT:C284($1; $mode)

C_COLLECTION:C1488($tabs)
C_REAL:C285($marginLeft; $marginRight; $textIndent)
C_LONGINT:C283($direction)

$mode:=$1  // copy or paste


Case of 
	: ($mode="copy")
		
		oForm.ruler:=New object:C1471
		
		WP GET ATTRIBUTES:C1345(Form:C1466.selection; wk tabs:K81:278; $tabs; wk margin left:K81:11; $marginLeft; wk margin right:K81:12; $marginRight; wk text indent:K81:52; $textIndent; wk direction:K81:50; $direction)
		
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