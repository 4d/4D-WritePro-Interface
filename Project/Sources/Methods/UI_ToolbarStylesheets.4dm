//%attributes = {"invisible":true}
If (Form:C1466.selection.type=wk type image:K81:192)
	
	OBJECT SET ENABLED:C1123(*; "Stylesheet_@"; False:C215)
	
Else 
	
	OBJECT SET ENABLED:C1123(*; "Stylesheet_@"; True:C214)
	
	var $ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "Stylesheet_Names")
	var $pos : Integer:=$ptrStylesheetNames->
	var $name : Text:=$pos>0 ? $ptrStylesheetNames->{$pos} : ""
	
	OBJECT SET ENABLED:C1123(*; "Stylesheet_btnDelete"; (Length:C16($name)>0) && ($name#"normal"))
	
End if 