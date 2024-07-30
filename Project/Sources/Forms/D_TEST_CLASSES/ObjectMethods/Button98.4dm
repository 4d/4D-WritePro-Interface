var $doc : cs:C1710.WPdocument
var $element : cs:C1710.WPelement

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)

$element:=$doc.getBody()

If ($element#Null:C1517)
	If (Shift down:C543)
		$element.select(10; 10+(Random:C100%50))
	Else 
		$element.select()  //"WParea")
	End if 
Else 
	ALERT:C41("null element")
End if 

