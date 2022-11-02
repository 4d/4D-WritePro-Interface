var $textbox; $oPos1; $oPos2 : Object
var $textRange : Object

$textbox:=WP Get elements:C1550([SAMPLE:1]WP:2; wk type text box:K81:372)[0]
$oPos1:=WP Get position:C1577($textbox)


$textRange:=WP Selection range:C1340([SAMPLE:1]WP:2)
$oPos2:=WP Get position:C1577($textRange)
