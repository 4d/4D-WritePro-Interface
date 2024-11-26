//%attributes = {"invisible":true}
var $ptrStylesheetNames : Pointer
var $p : Integer
var $name : Text

If (Form:C1466.selection.type=wk type image:K81:192)
	
	OBJECT SET ENABLED:C1123(*; "Stylesheet_@"; False:C215)
	
Else 
	
	OBJECT SET ENABLED:C1123(*; "Stylesheet_@"; True:C214)
	
	$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "Stylesheet_Names")
	
	$p:=$ptrStylesheetNames->
	
	If ($p>0)
		$name:=$ptrStylesheetNames->{$p}
	Else 
		$name:=""
	End if 
	
	If ($name="normal") | ($name="")
		OBJECT SET ENABLED:C1123(*; "Stylesheet_btnDelete"; False:C215)
	Else 
		OBJECT SET ENABLED:C1123(*; "Stylesheet_btnDelete"; True:C214)
	End if 
	
End if 
