var $doc : cs:C1710.WPdocument
var $section; $subsection : cs:C1710.WPsection

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)

$section:=$doc.getSection(1)
$subsection:=$section.newSubsection(wk first page:K81:203)

$subsection.setAttributes({backgroundColor: "#FFFFF0"})


