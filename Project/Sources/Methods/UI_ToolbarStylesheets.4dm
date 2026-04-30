//%attributes = {"invisible":true}
var $ui:=cs:C1710._ui.me

If ($ui.selection.type=wk type image:K81:192)
	
	OBJECT SET ENABLED:C1123(*; "Stylesheet_@"; False:C215)
	
Else 
	
	OBJECT SET ENABLED:C1123(*; "Stylesheet_@"; True:C214)
	
	If ($ui._withSyleSheetsAsCollection)
		
		var $name : Text:=Form:C1466.styleSheets.currentValue
		
		If (Form:C1466.styleSheets.index#-1)
			
			$name:=Form:C1466.styleSheets.values[Form:C1466.styleSheets.index]
			
		End if 
		
	Else 
		
		var $ptrStylesheetNames : Pointer
		var $p : Integer
		$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5; "Stylesheet_Names")
		$p:=$ptrStylesheetNames->
		$name:=$p>0 ? $ptrStylesheetNames->{$p} : ""
		
	End if 
	
	OBJECT SET ENABLED:C1123(*; "Stylesheet_btnDelete"; (Length:C16($name)>0) && ($name#"normal"))
	
End if 