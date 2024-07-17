

var $doc : cs:C1710.WPdocument
var $section; $subsection : cs:C1710.WPsection
var $headFoot : cs:C1710.WPelement

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)

$section:=$doc.getSection(1)
$subsection:=$section.getSubsection(wk left page:K81:204)

$headFoot:=$subsection.newHeader()
$headFoot.setAttributes({borderStyle: 1; borderWidth: "1pt"; margin: "4pt"; textAlign: wk left:K81:95; color: "Blue"; fontSize: "24pt"})
$headFoot.setText("LEFT PAGE HEADER")

$headFoot:=$subsection.newFooter()
$headFoot.setAttributes({borderStyle: 2; borderWidth: "1pt"; margin: "4pt"; textAlign: wk left:K81:95; color: "Blue"; fontSize: "24pt"})
$headFoot.setText("LEFT PAGE FOOTER")

