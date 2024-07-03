//%attributes = {}
//$d:=Chaîne(Date du jour; Système date court)
//$h:=Chaîne(Heure courante; Système heure court)


var $doc : cs:C1710.WPdocument
var $section1a; $section1b : cs:C1710.WPsection
var $textRange : cs:C1710.WPrange
var $header; $footer : cs:C1710.WPelement


var $text : Text
var $range; $header; $footer : Object



$doc:=cs:C1710.WPdocument.new()



$doc.setText("blablabla"; wk append:K81:179)
$text:=$doc.getText()

$section1a:=cs:C1710.WPsection.new($doc.document; 1)
$section1b:=cs:C1710.WPsection.new($range.range)


$range:=$doc.textRange(1; 3)
$header:=$section1b.newHeader()
$footer:=$section1b.newFooter()




