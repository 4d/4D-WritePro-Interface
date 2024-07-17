

var $doc : cs:C1710.WPdocument
var $section; $subsection : cs:C1710.WPsection
var $header; $footer : cs:C1710.WPelement


$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)  // à partir d'un doc existant s'il existe

$section:=$doc.getSection(1)

$subsection:=$section.getSubsection(wk first page:K81:203)

$header:=$subsection.newHeader()
$header.setAttributes({borderStyle: 1; borderWidth: "2pt"; margin: "12pt"; textAlign: wk center:K81:99; color: "Blue"; fontSize: "24pt"})
$header.setText("First page header")

$footer:=$subsection.newFooter()
$footer.setAttributes({borderStyle: 2; borderWidth: "3pt"; margin: "6pt"; textAlign: wk center:K81:99; color: "Green"; fontSize: "24pt"})
$footer.setText("First page footer")

