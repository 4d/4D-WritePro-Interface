var $doc : cs:C1710.WPdocument
var $header; $footer : cs:C1710.WPelement


$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)
$footer:=$doc.getFooter(1; wk left page:K81:204)
If ($footer#Null:C1517)
	$footer.delete()
End if 
