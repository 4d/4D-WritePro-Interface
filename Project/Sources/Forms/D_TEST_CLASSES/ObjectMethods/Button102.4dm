var $doc : cs:C1710.WPdocument
var $section : cs:C1710.WPsection

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)

$section:=$doc.getSection(2)

If ($section#Null:C1517)
	If (Shift down:C543)
		$section.select(10; 10+(Random:C100%50))
	Else 
		$section.select()
	End if 
Else 
	ALERT:C41("null element")
End if 

