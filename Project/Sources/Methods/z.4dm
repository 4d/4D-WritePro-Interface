//%attributes = {}
////$d:=Chaîne(Date du jour; Système date court)
////$h:=Chaîne(Heure courante; Système heure court)



var $doc : cs:C1710.WPdocument
var $section1a; $section1b : cs:C1710.WPsection
var $textRange : cs:C1710.WPrange
var $range : cs:C1710.WPrange

var $header; $footer : cs:C1710.WPelement
var $textBox : cs:C1710.WPelement


var $text : Text


$doc:=cs:C1710.WPdocument.new()



$doc.setText("blablabla"; wk append:K81:179)
$text:=$doc.getText()

$range:=$doc.textRange(1; 3)


$section1a:=cs:C1710.WPsection.new($doc.document; 1)
$section1b:=cs:C1710.WPsection.new($range.range)


$header:=$section1b.newHeader()
$footer:=$section1b.newFooter()

$textBox:=$doc.newTextBox()

$textBox.delete()



