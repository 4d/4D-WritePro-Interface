var $doc : cs:C1710.WPdocument
var $section; $subsection : cs:C1710.WPsection

$doc:=cs:C1710.WPdocument.new(Form:C1466.wp)

$section:=$doc.getSection(1)

$subsection:=$section.newSubsection(wk right page:K81:205)
$subsection.setAttributes({backgroundColor: "#F8F8FF"})

$subsection:=$section.getSubsection(wk left page:K81:204)  // GET not NEW :-)
$subsection.setAttributes({backgroundColor: "#F8FFF8"})


