var $doc : cs:C1710.WPdocument
var $header; $footer : cs:C1710.WPelement


$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)
$header:=$doc.getHeader(1; wk left page:K81:204)
If ($header#Null:C1517)
	$header.delete()
End if 
