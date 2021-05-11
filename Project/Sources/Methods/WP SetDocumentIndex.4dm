//%attributes = {}
var $1; $document; $header; $footer : Object
var $text : Text
var $i; $sections : Integer
var $words : Collection

ARRAY TEXT:C222($_words; 0)

$document:=$1
$text:=WP Get text:C1575(WP Get body:C1516($document); wk expressions as space:K81:257)
$sections:=WP Get sections:C1580($document).length

For ($i; 1; $sections)
	
	$header:=WP Get header:C1503($document; $i)
	If ($header#Null:C1517)
		$text:=$text+" "+WP Get text:C1575($header; wk expressions as space:K81:257)
	End if 
	$header:=WP Get header:C1503($document; $i; wk first page:K81:203)
	If ($header#Null:C1517)
		$text:=$text+" "+WP Get text:C1575($header; wk expressions as space:K81:257)
	End if 
	$header:=WP Get header:C1503($document; $i; wk right page:K81:205)
	If ($header#Null:C1517)
		$text:=$text+" "+WP Get text:C1575($header; wk expressions as space:K81:257)
	End if 
	$header:=WP Get header:C1503($document; $i; wk left page:K81:204)
	If ($header#Null:C1517)
		$text:=$text+" "+WP Get text:C1575($header; wk expressions as space:K81:257)
	End if 
	
	$footer:=WP Get footer:C1504($document; $i; wk first page:K81:203)
	If ($footer#Null:C1517)
		$text:=$text+" "+WP Get text:C1575($footer; wk expressions as space:K81:257)
	End if 
	$footer:=WP Get footer:C1504($document; $i; wk right page:K81:205)
	If ($header#Null:C1517)
		$text:=$text+" "+WP Get text:C1575($footer; wk expressions as space:K81:257)
	End if 
	$footer:=WP Get footer:C1504($document; $i; wk left page:K81:204)
	If ($header#Null:C1517)
		$text:=$text+" "+WP Get text:C1575($footer; wk expressions as space:K81:257)
	End if 
	$footer:=WP Get footer:C1504($document; $i)
	If ($header#Null:C1517)
		$text:=$text+" "+WP Get text:C1575($footer; wk expressions as space:K81:257)
	End if 
	
End for 

GET TEXT KEYWORDS:C1141($text; $_words; *)
OB SET ARRAY:C1227($document; "_keywords"; $_words)


//OR  (Alternate way to create the attribute)

$words:=New collection:C1472
ARRAY TO COLLECTION:C1563($words; $_words)
$document._keywords:=$words



