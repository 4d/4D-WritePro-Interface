

var $doc : cs:C1710.WPdocument
var $section; $subsection : cs:C1710.WPsection
var $headFoot : cs:C1710.WPelement

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)

$section:=$doc.getSection(1)
$subsection:=$section.getSubsection(wk first page:K81:203)

$headFoot:=$subsection.newHeader()
$headFoot.setAttributes({borderStyle: 1; borderWidth: "2pt"; margin: "12pt"; textAlign: wk center:K81:99; color: "Blue"; fontSize: "24pt"})
$headFoot.setText("FIRST PAGE HEADER")

$headFoot:=$subsection.newFooter()
$headFoot.setAttributes({borderStyle: 2; borderWidth: "3pt"; margin: "6pt"; textAlign: wk center:K81:99; color: "Green"; fontSize: "24pt"})
$headFoot.setText("FIRST PAGE FOOTER")

